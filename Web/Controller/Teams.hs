module Web.Controller.Teams where

import Web.Controller.Prelude
import Web.View.Teams.Index
import Web.View.Teams.New
import Web.View.Teams.Edit
import Web.View.Teams.Show
import qualified Web.View.Retros.New as NewRetroView
import qualified Web.View.TeamMembers.New as NewTeamMemberView

instance Controller TeamsController where
    beforeAction = ensureIsUser

    action NewTeamMemberAction { teamId } = do
        let teamMember = newRecord @TeamMember
                            |> set #teamId teamId
        setModal NewTeamMemberView.NewView { .. }
        jumpToAction $ ShowTeamAction $ get #teamId teamMember

    action TeamsAction = autoRefresh do
        teamMembers <- query @TeamMember
                    |> filterWhere (#userId, currentUserId)
                    |> fetch

        inTeams <- fetch $ map (get #teamId) teamMembers

        ownedTeams <- query @Team
            |> filterWhere (#ownerId, currentUserId)
            |> fetch
        
        render IndexView { .. }

    action NewTeamAction = do
        let team = newRecord
                    |> set #ownerId currentUserId
        setModal NewView { .. }
        jumpToAction TeamsAction

    
    action NewTeamRetroAction { teamId } = do
        let retro = newRecord @Retro
                    |> set #teamId teamId
        setModal NewRetroView.NewView { .. }
        jumpToAction $ ShowTeamAction teamId

    action ShowTeamAction { teamId } = autoRefresh do
        team <- fetch teamId
        retros <- query @Retro
                    |> filterWhere (#teamId, teamId)
                    |> fetch

        render ShowView { .. }

    action EditTeamAction { teamId } = do
        team <- fetch teamId
        owner <- fetch $ get #ownerId team
        teamMembers <- query @TeamMember
                            |> filterWhere (#teamId, teamId)
                            |> fetch
        users <- fetch $ map (get #userId) teamMembers
        setModal EditView { .. }
        jumpToAction $ ShowTeamAction teamId

    action UpdateTeamAction { teamId } = do
        team <- fetch teamId
        owner <- fetch $ get #ownerId team
        teamMembers <- query @TeamMember
                            |> filterWhere (#teamId, teamId)
                            |> fetch
        users <- fetch $ map (get #userId) teamMembers

        team
            |> buildTeam
            |> ifValid \case
                Left team -> render EditView { .. }
                Right team -> do
                    team <- team |> updateRecord
                    setSuccessMessage "Team updated"
                    redirectTo ShowTeamAction { .. }

    action CreateTeamAction = do
        let team = newRecord @Team
        team
            |> buildTeam
            |> validateField #title nonEmpty
            |> ifValid \case
                Left team -> do
                    setModal NewView { .. }
                    jumpToAction TeamsAction
                Right team -> do
                    team <- team |> createRecord
                    setSuccessMessage "Team created"
                    redirectTo TeamsAction

    action DeleteTeamAction { teamId } = do
        team <- fetch teamId
        if get #ownerId team == currentUserId then
            deleteRecord team
        else
            pure ()
        redirectTo TeamsAction

buildTeam team = team
    |> fill @["title","ownerId"]
