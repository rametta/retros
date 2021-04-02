module Web.View.Columns.New where
import Web.View.Prelude

newtype NewView = NewView { column :: Column }

instance View NewView where
    html NewView { .. } = [hsx|
        <main class="container mx-auto p-4">
            <div class="rounded bg-gray-100 shadow px-3 pt-3 pb-1">
                <h1 class="text-xl">New Column</h1>
                {renderForm column}
            </div>
        </main>
    |]

renderForm :: Column -> Html
renderForm column = formFor column [hsx|
    {(hiddenField #retroId)}
    {(textField #title) {autofocus = True}}
    {(textField #sortOrder) { fieldLabel = "Position", helpText = "Ex: A position of 0 would be the left most column" }}
    <div class="flex justify-between">
        <div class="flex">
             <button class="mr-2 bg-indigo-400 hover:bg-indigo-500 text-white font-bold py-1 px-2 rounded transition duration-300">Save</button>
             <a href={ShowRetroAction $ get #retroId column} class="block btn-gray">Cancel</a>
         </div>
        <a href={DeleteColumnAction $ get #id column} class="js-delete block bg-red-400 hover:bg-red-500 text-white font-bold py-1 px-2 rounded transition duration-300">Delete Item</a>
     </div>
|]