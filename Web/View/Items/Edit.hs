module Web.View.Items.Edit where
import Web.View.Prelude

data EditView = EditView { item :: Item }

instance View EditView where
    html EditView { .. } = [hsx|
        <main class="container mx-auto p-4">
            <h1 class="text-xl">Edit</h1>
            {renderForm item}
        </main>
    |]

renderForm :: Item -> Html
renderForm item = formFor item [hsx|
    {(hiddenField #retroId) {required = True}}
    {(hiddenField #columnId) {required = True}}
    {(textField #title) {required = True, autofocus = True}}
    {(hiddenField #description)}
    {(hiddenField #sortOrder)}
    <div class="flex justify-between">
        <div class="flex">
            <button class="mr-2 bg-indigo-400 hover:bg-indigo-500 text-white font-bold py-1 px-2 rounded transition duration-300">Save</button>
            <a href={ShowRetroAction $ get #retroId item} class="block btn-gray">Cancel</a>
        </div>
        <a href={DeleteItemAction $ get #id item} class="js-delete block bg-red-400 hover:bg-red-500 text-white font-bold py-1 px-2 rounded transition duration-300">Delete Item</a>
    </div>
|]
