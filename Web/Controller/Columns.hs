module Web.Controller.Columns where

import Web.Controller.Prelude
import Web.View.Columns.New
import Web.View.Columns.Edit
import Web.Controller.Retros

instance Controller ColumnsController where
    beforeAction = ensureIsUser

    action NewColumnAction = do
        let column = newRecord
        render NewView { .. }

    action NewRetroColumnAction { retroId, sortOrder } = do
        let column = newRecord
                        |> set #retroId retroId
                        |> set #sortOrder sortOrder
        setModal NewView { .. }
        jumpToAction $ ShowRetroAction retroId

    action EditColumnAction { columnId } = do
        column <- fetch columnId
        setModal EditView { .. }
        jumpToAction $ ShowRetroAction $ get #retroId column

    action UpdateColumnAction { columnId } = do
        column <- fetch columnId
        column
            |> buildColumn
            |> validateField #title nonEmpty
            |> emptyValueToNothing #cover
            |> ifValid \case
                Left column -> render EditView { .. }
                Right column -> do
                    column <- column |> updateRecord
                    setSuccessMessage "Column updated"
                    redirectTo $ ShowRetroAction (get #retroId column)

    action CreateColumnAction = do
        let column = newRecord @Column
        column
            |> buildColumn
            |> validateField #title nonEmpty
            |> emptyValueToNothing #cover
            |> ifValid \case
                Left column -> render NewView { .. } 
                Right column -> do
                    column <- column |> createRecord
                    setSuccessMessage "Column created"
                    redirectTo $ ShowRetroAction (get #retroId column)

    action DeleteColumnAction { columnId } = do
        column <- fetch columnId
        deleteRecord column
        setSuccessMessage "Column deleted"
        redirectTo $ ShowRetroAction (get #retroId column)

buildColumn column = column
    |> fill @["title","cover","retroId","sortOrder"]
