module Web.Controller.Items where

import Web.Controller.Prelude
import Web.View.Items.New
import Web.View.Items.Edit
import Web.Controller.Retros

instance Controller ItemsController where
    beforeAction = ensureIsUser

    action NewItemAction = do
        let item = newRecord
        render NewView { .. }

    action NewColumnItemAction { retroId, columnId, sortOrder } = do
        let item = newRecord
                    |> set #retroId retroId
                    |> set #columnId columnId
                    |> set #sortOrder sortOrder
                    |> set #createdBy (Just currentUserId)

        setModal NewView { .. }
        jumpToAction $ ShowRetroAction retroId

    action UpvoteAction { itemId, retroId } = do
        item <- fetch itemId

        let upvotesIds = (map Id . get #upvotes) item

        let newUpvotes = if currentUserId `elem` upvotesIds then
                            filter (/= currentUserId) upvotesIds
                         else
                            upvotesIds ++ [currentUserId]

        let newUpvotesUUID = map unpack newUpvotes

        result <- sqlQuery "UPDATE public.items SET upvotes = ?::UUID[] WHERE id = ? RETURNING *" (newUpvotesUUID, itemId)

        let item :: Item = fromMaybe (newRecord @Item) $ head result

        createdBy <- fetchOneOrNothing $ get #createdBy item

        setModal EditView { .. }
        jumpToAction $ ShowRetroAction retroId

    action EditItemAction { itemId } = autoRefresh do
        item <- fetch itemId
        createdBy <- fetchOneOrNothing $ get #createdBy item
        setModal EditView { .. }
        jumpToAction $ ShowRetroAction (get #retroId item)

    action UpdateItemAction { itemId } = do
        item <- fetch itemId
        item
            |> fill @["columnId","retroId","title","description","sortOrder"]
            |> ifValid \case
                Left item -> do
                    createdBy <- fetchOneOrNothing $ get #createdBy item
                    render EditView { .. }
                Right item -> do
                    item <- item |> updateRecord
                    redirectTo $ ShowRetroAction (get #retroId item)

    action CreateItemAction = do
        let item = newRecord @Item
        item
            |> buildItem
            |> ifValid \case
                Left item -> render NewView { .. } 
                Right item -> do
                    item <- item |> createRecord
                    redirectTo $ ShowRetroAction (get #retroId item)

    action DeleteItemAction { itemId } = do
        item <- fetch itemId
        deleteRecord item
        redirectTo $ ShowRetroAction (get #retroId item)

buildItem item = item
    |> fill @["columnId","retroId","createdBy","upvotes","title","description","sortOrder"]
