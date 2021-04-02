module Web.View.Items.New where
import Web.View.Prelude

newtype NewView = NewView { item :: Item }

instance View NewView where
    html NewView { .. } = [hsx|
        <main class="container mx-auto p-4">
            <div class="rounded bg-white bg-opacity-60 shadow px-3 pt-3 pb-1">
                <h1 class="text-xl">New</h1>
                {renderForm item}
            </div>
        </main>
    |]

renderForm :: Item -> Html
renderForm item = formFor item [hsx|
    {(hiddenField #retroId) {required = True}}
    {(hiddenField #columnId) {required = True}}
    {(textField #title) {required = True, autofocus = True}}
    {(hiddenField #description)}
    {(hiddenField #sortOrder)}
    <div class="flex flex-wrap justify-between">
        <div class="flex">
            <button class="mr-2 bg-indigo-400 hover:bg-indigo-500 text-white font-bold py-1 px-2 rounded transition duration-300">Save</button>
            <a href={ShowRetroAction $ get #retroId item} class="block btn-gray">Cancel</a>
        </div>
    </div>
|]
