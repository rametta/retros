module Web.Controller.Retros where

import Web.Controller.Prelude
import Web.View.Retros.Index
import Web.View.Retros.New
import Web.View.Retros.Edit
import Web.View.Retros.Show

instance Controller RetrosController where
    action RetrosAction = do
        retros <- query @Retro |> fetch
        render IndexView { .. }

    action NewRetroAction = do
        let retro = newRecord
        setModal NewView { .. }
        jumpToAction RetrosAction

    action ShowRetroAction { retroId } = autoRefresh do
        retro <- fetch retroId

        columns <- query @Column
                    |> filterWhere (#retroId, retroId)
                    |> fetch

        items <- query @Item
                    |> filterWhere (#retroId, retroId)
                    |> fetch

        comments <- query @Comment
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
            |> ifValid \case
                Left retro -> render EditView { .. }
                Right retro -> do
                    retro <- retro |> updateRecord
                    setSuccessMessage "Retro updated"
                    redirectTo $ ShowRetroAction retroId

    action CreateRetroAction = do
        let retro = newRecord @Retro
        retro
            |> buildRetro
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
        redirectTo RetrosAction

buildRetro retro = retro
    |> fill @'["title"]
