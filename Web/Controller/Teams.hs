module Web.Controller.Teams where

import Web.Controller.Prelude
import Web.View.Teams.Index
import Web.View.Teams.New
import Web.View.Teams.Edit
import Web.View.Teams.Show
import qualified Web.View.Retros.New as NewRetroView

instance Controller TeamsController where
    beforeAction = ensureIsUser

    action TeamsAction = autoRefresh do
        teamMembers <- query @TeamMember
                    |> filterWhere (#userId, currentUserId)
                    |> fetch

        inTeams <- fetch $ map (get #teamId) teamMembers

        ownedTeams <- query @Team
            |> filterWhere (#ownerId, currentUserId)
            |> fetch

        let teams = nub $ inTeams ++ ownedTeams
        
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
        setModal EditView { .. }
        jumpToAction $ ShowTeamAction teamId

    action UpdateTeamAction { teamId } = do
        team <- fetch teamId
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
            |> ifValid \case
                Left team -> render NewView { .. } 
                Right team -> do
                    team <- team |> createRecord
                    setSuccessMessage "Team created"
                    redirectTo TeamsAction

    action DeleteTeamAction { teamId } = do
        team <- fetch teamId
        deleteRecord team
        setSuccessMessage "Team deleted"
        redirectTo TeamsAction

buildTeam team = team
    |> fill @["title","ownerId"]
