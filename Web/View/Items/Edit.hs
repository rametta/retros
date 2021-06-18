module Web.View.Items.Edit where

import Data.Map as M (lookup)
import Web.View.Prelude

data EditView = EditView
    { item :: Item
    , createdBy :: Maybe User
    , comments :: [Comment]
    , usersMap :: Map (Id User) User
    }

instance View EditView where
    html EditView { .. } = renderModal Modal
        { modalTitle = "Edit"
        , modalCloseUrl = pathTo $ ShowRetroAction $ get #retroId item
        , modalFooter = Nothing
        , modalContent = [hsx|
            {renderItemForm item}
            <div class="flex justify-between items-end">
                {renderUpvotesForm item}
                {createdByHtml}
            </div>
            {renderCommentsSection item comments usersMap}
        |]
        }
        where
            createdByHtml :: Html
            createdByHtml =
                case createdBy of
                    Just user -> [hsx|<span class="text-gray-300 text-sm">Created By: <strong>{get #fullname user}</strong></span>|]
                    Nothing -> mempty

renderItemForm :: Item -> Html
renderItemForm item = formFor item [hsx|
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


renderUpvotesForm :: Item -> Html
renderUpvotesForm item =
    [hsx|
        <form action={UpvoteAction (get #id item) (get #retroId item)} method="POST">
            <button type="submit" class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-1 px-2 rounded transition duration-300">Upvote: {length $ get #upvotes item}</button>
        </form>
    |]

renderCommentsSection :: Item -> [Comment] -> Map (Id User) User -> Html
renderCommentsSection item comments usersMap =
    [hsx|
        <div class="mt-6">
            <h3 class="text-white font-bold mb-3">Comments</h3>
            <form action={CreateCommentAction (get #id item) (get #retroId item)} method="POST">
                <div>
                    <label for="add_comment">Add a comment</label>
                    <div class="flex">
                        <input required id="add_comment" type="text" name="comment-title" placeholder="e.g I agree with this!" class=" rounded-r-none" />
                        <button type="submit" class="bg-blue-500 hover:bg-blue-600 text-white font-bold py-1 px-2 rounded transition duration-300 rounded-l-none">Add</button>
                    </div>
                </div>
            </form>
            {renderComments}
        </div>
    |]
    where
        renderComments :: Html
        renderComments = case comments of
            [] -> mempty
            _ -> [hsx|<div class="mt-2">{forEach comments renderComment}</div>|]

        renderComment :: Comment -> Html
        renderComment comment =
            [hsx|
                <div class="my-1 flex justify-between items-start bg-gray-600 rounded p-2 text-gray-300">
                    <div>
                        <strong class="text-white">{getUser $ get #createdBy comment}: </strong> {get #title comment}
                    </div>
                    {deleteBtn comment}
                </div>
            |]
            where
                getUser :: Id User -> Html
                getUser id = case M.lookup id usersMap of
                    Just user -> [hsx|{get #fullname user}|]
                    Nothing -> [hsx|Unknown User|]

                deleteBtn :: Comment -> Html
                deleteBtn comment =
                    if Just (get #createdBy comment) == mId then
                        [hsx|<a class="js-delete btn-gray ml-2" href={DeleteCommentAction $ get #id comment}>&#10006;</a>|]
                    else
                        mempty
                    where
                        mId = get #id <$> currentUserOrNothing