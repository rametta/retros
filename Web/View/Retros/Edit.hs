module Web.View.Retros.Edit where
import Web.View.Prelude

newtype EditView = EditView { retro :: Retro }

instance View EditView where
    html EditView { .. } = renderModal Modal
        { modalTitle = "Edit Retro"
        , modalCloseUrl = pathTo $ ShowRetroAction $ get #id retro
        , modalFooter = Nothing
        , modalContent = renderForm retro
        }

renderForm :: Retro -> Html
renderForm retro = formFor retro [hsx|
    {(textField #title) {autofocus = True}}
    <div class="flex justify-between">
        <div class="flex">
            <button class="mr-2 bg-green-500 hover:bg-green-600 text-white font-bold py-1 px-2 rounded transition duration-300">Save</button>
            <a href={ShowRetroAction $ get #id retro} class="block btn-gray">Cancel</a>
        </div>
        <a href={DeleteRetroAction $ get #id retro} class="js-delete block bg-red-500 hover:bg-red-400 text-white font-bold py-1 px-2 rounded transition duration-300">Delete Retro</a>
    </div>
|]
