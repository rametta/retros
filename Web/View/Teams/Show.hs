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
                            <a href={NewTeamRetroAction $ get #id team} class="bg-green-400 hover:bg-green-300 text-white font-bold py-1 px-2 border-b-4 border-green-700 hover:border-green-500 rounded transition duration-300 transform hover:scale-105">New Retro</a>
                        </div>
                    </div>
                    {forEach sortedRetros renderRetro}
                </div>
            </main>
        |]
        where
            sortedRetros = retros |> sortOn (get #createdAt) |> reverse

renderRetro :: Retro -> Html
renderRetro retro = [hsx|
    <a href={ShowRetroAction $ get #id retro} class="bg-gray-800 hover:bg-gray-700 text-white font-bold flex justify-between transition duration-300 p-3 rounded mb-3">
        {get #title retro}
        <span class="text-gray-500">{date $ get #createdAt retro}</span>
    </a>
|]
