module Web.View.Teams.Index where
import Web.View.Prelude

data IndexView = IndexView { inTeams :: [Team], ownedTeams :: [Team] }

instance View IndexView where
    html IndexView { .. } =
        [hsx|
            {renderNavbar Nothing mempty mempty}
            <main class="container mx-auto h-full flex flex-col mt-5">
                <div class="mx-3 flex flex-col">
                    <div class="flex justify-between">
                        <h1 class="text-2xl text-white font-bold mb-3">Your Teams</h1>
                        <div>
                            <a href={pathTo NewTeamAction} class="bg-green-400 hover:bg-green-300 text-white font-bold py-1 px-2 rounded transition duration-300">New Team</a>
                        </div>
                    </div>
                    {ownedTeamsHtml}
                    {inTeamsHtml}
                </div>
            </main>
        |]
        where
            sortedInTeams :: [Team]
            sortedInTeams = inTeams |> sortOn (get #createdAt) |> reverse

            sortedOwnedTeams :: [Team]
            sortedOwnedTeams = ownedTeams |> sortOn (get #createdAt) |> reverse

            inTeamsHtml :: Html
            inTeamsHtml = case sortedInTeams of
                [] -> mempty
                _ -> [hsx|
                    <h1 class="text-2xl text-white font-bold my-3">Teams shared with you</h1>
                    {forEach sortedInTeams renderTeam}
                |]

            ownedTeamsHtml :: Html
            ownedTeamsHtml = case sortedOwnedTeams of
                    [] -> [hsx|<span class="text-white text-center bg-gray-800 rounded p-3">You have not created any teams yet</span>|]
                    _ -> forEach sortedOwnedTeams renderTeam


renderTeam :: Team -> Html
renderTeam team = [hsx|
    <a href={ShowTeamAction $ get #id team} class="bg-gray-800 hover:bg-gray-700 text-white font-bold flex justify-between transition duration-300 p-3 rounded mb-3">
        {get #title team}
        <span class="text-gray-500">{date $ get #createdAt team}</span>
    </a>
|]
