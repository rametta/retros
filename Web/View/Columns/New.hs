module Web.View.Columns.New where
import Web.View.Prelude

newtype NewView = NewView { column :: Column }

instance View NewView where
    html NewView { .. } = renderModal Modal
        { modalTitle = "New Column"
        , modalCloseUrl = pathTo $ ShowRetroAction $ get #retroId column
        , modalFooter = Nothing
        , modalContent = renderForm column
        }

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
     </div>
|]