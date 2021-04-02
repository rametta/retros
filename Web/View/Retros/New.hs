module Web.View.Retros.New where
import Web.View.Prelude

newtype NewView = NewView { retro :: Retro }

instance View NewView where
    html NewView { .. } = [hsx|
        <main class="container mx-auto p-4">
            <div class="rounded bg-white bg-opacity-60 shadow px-3 pt-3 pb-1">
                <h1 class="text-xl">New Retro</h1>
                {renderForm retro}
            </div>
        </main>
    |]

renderForm :: Retro -> Html
renderForm retro = formFor retro [hsx|
    {(textField #title) {autofocus = True}}
    <div class="flex justify-between">
        <div class="flex">
            <button class="mr-2 bg-indigo-400 hover:bg-indigo-500 text-white font-bold py-1 px-2 rounded transition duration-300">Save</button>
            <a href={RetrosAction} class="block btn-gray">Cancel</a>
        </div>
    </div>
|]
