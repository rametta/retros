module Web.Controller.Retros where

import Web.Controller.Prelude
import Web.View.Retros.New
import Web.View.Retros.Edit
import Web.View.Retros.Show
import qualified Data.UUID

instance Controller RetrosController where
    beforeAction = ensureIsUser

    action ShowRetroAction { retroId } = autoRefresh do
        retro <- fetch retroId

        let teamId = get #teamId retro

        team <- fetch teamId

        members <- query @TeamMember
                    |> filterWhere (#teamId, teamId)
                    |> fetch

        let ownerId = get #ownerId team
        let memberIds = map (get #userId) members
        let memberAndOwnerIds = memberIds ++ [ownerId]

        accessDeniedUnless $ currentUserId `elem` memberAndOwnerIds

        columns <- query @Column
                    |> filterWhere (#retroId, retroId)
                    |> fetch

        items <- query @Item
                    |> filterWhere (#retroId, retroId)
                    |> fetch
            
        render ShowView { .. }

    action EditRetroAction { retroId } = do
        retro <- fetch retroId
        setModal EditView { .. }
        jumpToAction $ ShowRetroAction retroId

    action UpdateRetroAction { retroId } = do
        retro <- fetch retroId
        retro
            |> buildRetro
            |> validateField #title nonEmpty
            |> ifValid \case
                Left retro -> render EditView { .. }
                Right retro -> do
                    retro <- retro |> updateRecord
                    setSuccessMessage "Retro updated"
                    redirectTo $ ShowRetroAction retroId

    action CreateRetroAction = do
        let retro = newRecord @Retro
        let teamId = get #teamId retro
        retro
            |> buildRetro
            |> validateField #title nonEmpty
            |> ifValid \case
                Left retro -> render NewView { .. }
                Right retro -> do
                    retro <- retro |> createRecord
                    setSuccessMessage "Retro created"
                    redirectTo $ ShowRetroAction (get #id retro)

    action DeleteRetroAction { retroId } = do
        retro <- fetch retroId
        deleteRecord retro
        setSuccessMessage "Retro deleted"
        redirectTo $ ShowTeamAction $ get #teamId retro

    action MoveColumnToRetroAction { columnId, currentRetroId } = do
        let column = newRecord @Column |> fill @'["retroId"]
        let retroId = get #retroId column

        if unpack retroId /= Data.UUID.nil then
            withTransaction do
                column <- fetch columnId

                column
                    |> set #retroId retroId
                    |> updateRecord

                _ :: [Item] <- sqlQuery "UPDATE items SET retro_id = ? WHERE column_id = ? RETURNING *" (retroId, columnId)
                _ :: [Comment] <- sqlQuery "UPDATE comments SET retro_id = ? WHERE retro_id = ? RETURNING *" (retroId, currentRetroId)
                pure ()
        else
            pure ()

        redirectTo $ ShowRetroAction currentRetroId

buildRetro retro = retro
    |> fill @'["title", "teamId"]
