module Web.Controller.Comments where

import Web.Controller.Prelude
import Web.View.Comments.Index
import Web.View.Comments.New
import Web.View.Comments.Edit
import Web.View.Comments.Show

instance Controller CommentsController where
    beforeAction = ensureIsUser
    
    action CommentsAction = do
        comments <- query @Comment |> fetch
        render IndexView { .. }

    action NewCommentAction = do
        let comment = newRecord
        render NewView { .. }

    action ShowCommentAction { commentId } = do
        comment <- fetch commentId
        render ShowView { .. }

    action EditCommentAction { commentId } = do
        comment <- fetch commentId
        render EditView { .. }

    action UpdateCommentAction { commentId } = do
        comment <- fetch commentId
        comment
            |> buildComment
            |> ifValid \case
                Left comment -> render EditView { .. }
                Right comment -> do
                    comment <- comment |> updateRecord
                    setSuccessMessage "Comment updated"
                    redirectTo EditCommentAction { .. }

    action CreateCommentAction = do
        let comment = newRecord @Comment
        comment
            |> buildComment
            |> ifValid \case
                Left comment -> render NewView { .. } 
                Right comment -> do
                    comment <- comment |> createRecord
                    setSuccessMessage "Comment created"
                    redirectTo CommentsAction

    action DeleteCommentAction { commentId } = do
        comment <- fetch commentId
        deleteRecord comment
        setSuccessMessage "Comment deleted"
        redirectTo CommentsAction

buildComment comment = comment
    |> fill @["itemId","title"]
