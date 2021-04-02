module Web.View.Retros.Edit where
import Web.View.Prelude

newtype EditView = EditView { retro :: Retro }

instance View EditView where
    html EditView { .. } = [hsx|
        <main class="container mx-auto p-4">
            <div class="rounded bg-gray-100 shadow px-3 pt-3 pb-1">
                <h1 class="text-xl">Edit Retro</h1>
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
            <a href={ShowRetroAction $ get #id retro} class="block btn-gray">Cancel</a>
        </div>
        <a href={DeleteRetroAction $ get #id retro} class="js-delete block bg-red-400 hover:bg-red-500 text-white font-bold py-1 px-2 rounded transition duration-300">Delete Item</a>
    </div>
|]
