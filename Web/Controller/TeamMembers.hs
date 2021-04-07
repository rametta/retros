module Web.Controller.TeamMembers where

import Web.Controller.Prelude
import Web.View.TeamMembers.New
import Web.Controller.Teams

instance Controller TeamMembersController where
    action CreateTeamMemberAction = do
        let email = param @Text "email"
        let teamId = param @(Id Team) "teamId"

        let teamMember = newRecord @TeamMember
                            |> set #teamId teamId
        
        mUser <- query @User
                    |> filterWhere (#email, email)
                    |> fetchOneOrNothing

        let failure = do
                setModal NewView { .. }
                jumpToAction $ ShowTeamAction $ get #teamId teamMember

        case mUser of
            Nothing -> failure
            Just user -> do
                mExistingTeamMember <-
                    query @TeamMember
                        |> filterWhere (#teamId, teamId)
                        |> filterWhere (#userId, get #id user)
                        |> fetchOneOrNothing

                case mExistingTeamMember of
                    Just tm -> failure
                    Nothing -> 
                        teamMember
                            |> set #userId (get #id user)
                            |> ifValid \case
                                Left teamMember -> failure
                                Right teamMember -> do
                                    teamMember <- teamMember |> createRecord
                                    setSuccessMessage "TeamMember created"
                                    redirectTo $ EditTeamAction $ get #teamId teamMember

    action DeleteTeamMemberAction { teamId, userId } = do
        teamMember <- query @TeamMember
                        |> filterWhere (#teamId, teamId)
                        |> filterWhere (#userId, userId)
                        |> fetchOne

        deleteRecord teamMember
        setSuccessMessage "TeamMember deleted"
        redirectTo $ EditTeamAction teamId