module Web.Controller.Items where

import Data.Map (fromList)
import Web.Controller.Prelude
import Web.View.Items.New
import Web.View.Items.Edit
import Web.Controller.Retros

instance Controller ItemsController where
    beforeAction = ensureIsUser

    action NewItemAction = do
        let item = newRecord
        render NewView { .. }

    action DropAction { itemId } = do
        let columnId = Id (param @UUID "columnId")

        item <- fetch itemId
        columnItemsCount <- query @Item
                                |> filterWhere (#columnId, columnId)
                                |> fetchCount
        
        item
            |> set #columnId columnId
            |> set #sortOrder (columnItemsCount + 1)
            |> updateRecord

        renderPlain "success"

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

        item |> set #upvotes newUpvotesUUID |> updateRecord
        redirectTo $ EditItemAction itemId

    action EditItemAction { itemId } = autoRefresh do
        item <- fetch itemId
        createdBy <- fetchOneOrNothing $ get #createdBy item
        comments <- query @Comment
            |> filterWhere (#itemId, itemId)
            |> orderByAsc #createdAt
            |> fetch
        let unqiueCommentUserIds = nub $ map (get #createdBy) comments
        users <- fetch unqiueCommentUserIds
        let usersMap :: Map (Id User) User = fromList (map (\u -> (get #id u, u)) users)
        setModal EditView { .. }
        jumpToAction $ ShowRetroAction (get #retroId item)

    action UpdateItemAction { itemId } = do
        item <- fetch itemId
        item
            |> fill @["columnId","retroId","title","description","sortOrder"]
            |> ifValid \case
                Left item -> do
                    redirectTo $ EditItemAction itemId
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
