module Web.View.Items.New where
import Web.View.Prelude

newtype NewView = NewView { item :: Item }

instance View NewView where
    html NewView { .. } = renderModal Modal
        { modalTitle = "New"
        , modalCloseUrl = pathTo $ ShowRetroAction $ get #retroId item
        , modalFooter = Nothing
        , modalContent = renderForm item
        }

renderForm :: Item -> Html
renderForm item = formFor item [hsx|
    {(hiddenField #retroId) {required = True}}
    {(hiddenField #columnId) {required = True}}
    {(textField #title) {required = True, autofocus = True}}
    {(hiddenField #description)}
    {(hiddenField #upvotes)}
    {(hiddenField #sortOrder)}
    <div class="flex flex-wrap justify-between">
        <div class="flex">
            <button class="mr-2 bg-green-500 hover:bg-green-600 text-white font-bold py-1 px-2 rounded transition duration-300">Save</button>
            <a href={ShowRetroAction $ get #retroId item} class="block btn-gray">Cancel</a>
        </div>
    </div>
|]
