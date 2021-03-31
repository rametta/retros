module Web.Controller.Columns where

import Web.Controller.Prelude
import Web.View.Columns.Index
import Web.View.Columns.New
import Web.View.Columns.Edit
import Web.View.Columns.Show

instance Controller ColumnsController where
    action ColumnsAction = do
        columns <- query @Column |> fetch
        render IndexView { .. }

    action NewColumnAction = do
        let column = newRecord
        render NewView { .. }

    action ShowColumnAction { columnId } = do
        column <- fetch columnId
        render ShowView { .. }

    action EditColumnAction { columnId } = do
        column <- fetch columnId
        render EditView { .. }

    action UpdateColumnAction { columnId } = do
        column <- fetch columnId
        column
            |> buildColumn
            |> ifValid \case
                Left column -> render EditView { .. }
                Right column -> do
                    column <- column |> updateRecord
                    setSuccessMessage "Column updated"
                    redirectTo EditColumnAction { .. }

    action CreateColumnAction = do
        let column = newRecord @Column
        column
            |> buildColumn
            |> ifValid \case
                Left column -> render NewView { .. } 
                Right column -> do
                    column <- column |> createRecord
                    setSuccessMessage "Column created"
                    redirectTo ColumnsAction

    action DeleteColumnAction { columnId } = do
        column <- fetch columnId
        deleteRecord column
        setSuccessMessage "Column deleted"
        redirectTo ColumnsAction

buildColumn column = column
    |> fill @["title","retroId","sortOrder"]