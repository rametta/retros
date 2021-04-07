module Web.View.Columns.Edit where
import Web.View.Prelude

newtype EditView = EditView { column :: Column }

instance View EditView where
    html EditView { .. } = renderModal Modal
        { modalTitle = "Edit Column"
        , modalCloseUrl = pathTo $ ShowRetroAction $ get #retroId column
        , modalFooter = Nothing
        , modalContent = renderForm column
        }

renderForm :: Column -> Html
renderForm column = formFor column [hsx|
    {(hiddenField #retroId)}
    {(textField #title) {autofocus = True, required = True}}
    {(textField #sortOrder) { fieldLabel = "Position", helpText = "Ex: A position of 0 would be the left most column" }}
    <div class="flex justify-between">
        <div class="flex">
             <button class="mr-2 bg-green-500 hover:bg-green-600 text-white font-bold py-1 px-2 rounded transition duration-300">Save</button>
             <a href={ShowRetroAction $ get #retroId column} class="block btn-gray">Cancel</a>
         </div>
        <a href={DeleteColumnAction $ get #id column} class="js-delete block bg-red-500 hover:bg-red-400 text-white font-bold py-1 px-2 rounded transition duration-300">Delete Column</a>
     </div>
|]