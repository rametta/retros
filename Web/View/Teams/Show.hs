module Web.View.Teams.Show where
import Web.View.Prelude

data ShowView = ShowView { team :: Team, retros :: [Retro] }

instance View ShowView where
    html ShowView { .. } =
        [hsx|
            {renderNavbar Nothing mempty mempty}
            <main class="container mx-auto h-full flex flex-col mt-5">
                <div class="mx-3 flex flex-col">
                    <div class="flex justify-between">
                        <h1 class="text-2xl text-white font-bold mb-3">{get #title team} Retros</h1>
                        <div>
                            <a href={EditTeamAction $ get #id team} class="mr-2 bg-gray-500 hover:bg-gray-600 text-white font-bold py-1 px-2 rounded transition duration-300">Edit Team</a>
                            <a href={NewTeamRetroAction $ get #id team} class="bg-green-400 hover:bg-green-300 text-white font-bold py-1 px-2 rounded transition duration-300">New Retro</a>
                        </div>
                    </div>
                    {renderRetrosOrEmpty}
                </div>
            </main>
        |]
        where
            sortedRetros = retros |> sortOn (get #createdAt) |> reverse

            renderRetrosOrEmpty :: Html
            renderRetrosOrEmpty = case length sortedRetros of
                    0 -> [hsx|<span class="text-white text-center bg-gray-800 rounded p-3">This team has no Retro's yet. Create one!</span>|]
                    _ -> forEach sortedRetros renderRetro

renderRetro :: Retro -> Html
renderRetro retro = [hsx|
    <a href={ShowRetroAction $ get #id retro} class="bg-gray-800 hover:bg-gray-700 text-white font-bold flex justify-between transition duration-300 p-3 rounded mb-3">
        {get #title retro}
        <span class="text-gray-500">{date $ get #createdAt retro}</span>
    </a>
|]
