module Web.View.Retros.New where
import Web.View.Prelude

newtype NewView = NewView { retro :: Retro }

instance View NewView where
    html NewView { .. } = renderModal Modal
        { modalTitle = "New Retro"
        , modalCloseUrl = pathTo RetrosAction
        , modalFooter = Nothing
        , modalContent = renderForm retro
        }

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
