module Web.View.Teams.Index where
import Web.View.Prelude

newtype IndexView = IndexView { teams :: [Team] }

instance View IndexView where
    html IndexView { .. } =
        [hsx|
            {renderNavbar Nothing mempty mempty}
            <main class="container mx-auto h-full flex flex-col mt-5">
                <div class="mx-3 flex flex-col">
                    <div class="flex justify-between">
                        <h1 class="text-2xl text-white font-bold mb-3">Your Teams</h1>
                        <div>
                            <a href={pathTo NewTeamAction} class="bg-green-400 hover:bg-green-300 text-white font-bold py-1 px-2 border-b-4 border-green-700 hover:border-green-500 rounded transition duration-300 transform hover:scale-105">New Team</a>
                        </div>
                    </div>
                    {renderTeamsOrEmpty}
                </div>
            </main>
        |]
        where
            sortedTeams = teams |> sortOn (get #createdAt) |> reverse
            renderTeamsOrEmpty :: Html
            renderTeamsOrEmpty = case length sortedTeams of
                    0 -> [hsx|<span class="text-white text-center bg-gray-800 rounded p-3">You have not created or not part of any teams yet</span>|]
                    _ -> forEach sortedTeams renderTeam


renderTeam :: Team -> Html
renderTeam team = [hsx|
    <a href={ShowTeamAction $ get #id team} class="bg-gray-800 hover:bg-gray-700 text-white font-bold flex justify-between transition duration-300 p-3 rounded mb-3">
        {get #title team}
        <span class="text-gray-500">{date $ get #createdAt team}</span>
    </a>
|]
