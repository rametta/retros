module Web.View.Items.Edit where
import Web.View.Prelude

newtype EditView = EditView { item :: Item }
instance View EditView where
    html EditView { .. } = renderModal Modal
        { modalTitle = "Edit"
        , modalCloseUrl = pathTo $ ShowRetroAction $ get #retroId item
        , modalFooter = Nothing
        , modalContent = renderForms item
        }

renderForms :: Item -> Html
renderForms item = [hsx|
        {renderForm item}
        <form action={UpvoteAction (get #id item) (get #retroId item)} method="POST">
            <button type="submit" class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-1 px-2 rounded transition duration-300">Upvote: {length upvotes}</button>
        </form>
    |]
    where
        upvotes = get #upvotes item

renderForm :: Item -> Html
renderForm item = formFor item [hsx|
    {(hiddenField #retroId) {required = True}}
    {(hiddenField #columnId) {required = True}}
    {(textField #title) {required = True, autofocus = True}}
    {(hiddenField #description)}
    {(hiddenField #upvotes)}
    <div class="flex justify-between">
        <div class="flex">
            <button class="mr-2 bg-green-500 hover:bg-green-600 text-white font-bold py-1 px-2 rounded transition duration-300">Save</button>
            <a href={ShowRetroAction $ get #retroId item} class="block btn-gray">Cancel</a>
        </div>
        <a href={DeleteItemAction $ get #id item} class="js-delete block bg-red-500 hover:bg-red-400 text-white font-bold py-1 px-2 rounded transition duration-300">Delete Item</a>
    </div>
|]
