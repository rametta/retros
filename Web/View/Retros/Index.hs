module Web.View.Retros.Index where
import Web.View.Prelude

data IndexView = IndexView { retros :: [Retro] }

instance View IndexView where
    html IndexView { .. } =
        let
            sortedRetros = retros |> sortOn (get #createdAt) |> reverse
        in
        [hsx|
            <main class="container mx-auto h-full flex flex-col mt-5">
                <div class="mx-3 flex flex-col">
                    <div class="flex justify-between">
                        <h1 class="text-2xl text-white font-bold mb-3">Your Retros</h1>
                        <div>
                            <a href={pathTo NewRetroAction} class="bg-blue-400 hover:bg-blue-300 text-white font-bold py-1 px-2 border-b-4 border-blue-700 hover:border-blue-500 rounded transition duration-300 transform hover:scale-105">New Retro</a>
                        </div>
                    </div>
                    {forEach sortedRetros renderRetro}
                </div>
            </main>
        |]

renderRetro :: Retro -> Html
renderRetro retro = [hsx|
    <a href={ShowRetroAction $ get #id retro} class="bg-white flex justify-between bg-opacity-80 hover:bg-opacity-100 transition duration-300 p-3 rounded mb-3">
        {get #title retro}
        <span class=" text-gray-500">{date $ get #createdAt retro}</span>
    </a>
|]
