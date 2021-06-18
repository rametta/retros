module Web.Controller.Comments where

import Data.Text
import Web.Controller.Prelude
import Web.Controller.Items

instance Controller CommentsController where
    beforeAction = ensureIsUser

    action CreateCommentAction { itemId, retroId } = do
        let title = strip $ param @Text "comment-title"

        case title of
            "" -> redirectTo $ EditItemAction itemId
            _ -> do
                newRecord @Comment
                    |> set #title title
                    |> set #createdBy currentUserId
                    |> set #itemId itemId
                    |> set #retroId retroId
                    |> createRecord

                redirectTo $ EditItemAction itemId

    action DeleteCommentAction { commentId } = do
        comment <- fetch commentId
        -- only the comment creator can delete the comment
        accessDeniedUnless $ get #createdBy comment == currentUserId
        deleteRecord comment
        redirectTo $ EditItemAction (get #itemId comment)

buildComment comment = comment
    |> fill @["itemId","title"]
