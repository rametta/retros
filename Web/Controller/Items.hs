module Web.Controller.Items where

import Web.Controller.Prelude
import Web.View.Items.Index
import Web.View.Items.New
import Web.View.Items.Edit
import Web.View.Items.Show

instance Controller ItemsController where
    action ItemsAction = do
        items <- query @Item |> fetch
        render IndexView { .. }

    action NewItemAction = do
        let item = newRecord
        render NewView { .. }

    action NewColumnItemAction { retroId, columnId } = do
        let item = newRecord
                    |> set #retroId retroId
                    |> set #columnId columnId
        render NewView { .. }

    action ShowItemAction { itemId } = do
        item <- fetch itemId
        render ShowView { .. }

    action EditItemAction { itemId } = do
        item <- fetch itemId
        render EditView { .. }

    action UpdateItemAction { itemId } = do
        item <- fetch itemId
        item
            |> buildItem
            |> ifValid \case
                Left item -> render EditView { .. }
                Right item -> do
                    item <- item |> updateRecord
                    setSuccessMessage "Item updated"
                    redirectTo EditItemAction { .. }

    action CreateItemAction = do
        let item = newRecord @Item
        item
            |> buildItem
            |> ifValid \case
                Left item -> render NewView { .. } 
                Right item -> do
                    item <- item |> createRecord
                    setSuccessMessage "Item created"
                    redirectTo $ ShowRetroAction (get #retroId item)

    action DeleteItemAction { itemId } = do
        item <- fetch itemId
        deleteRecord item
        setSuccessMessage "Item deleted"
        redirectTo ItemsAction

buildItem item = item
    |> fill @["columnId","retroId","title","description","sortOrder"]
