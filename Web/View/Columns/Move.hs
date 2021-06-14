module Web.View.Columns.Move where

import Web.View.Prelude

data MoveView = MoveView { column :: Column, retros :: [Retro] }

instance View MoveView where
  html MoveView {..} =
    renderModal
      Modal
        { modalTitle = "Move Column",
          modalCloseUrl = pathTo $ ShowRetroAction $ get #retroId column,
          modalFooter = Nothing,
          modalContent = renderForm column retros
        }

instance CanSelect Retro where
    type SelectValue Retro = Id Retro
    selectValue = get #id
    selectLabel = get #title

renderForm :: Column -> [Retro] -> Html
renderForm column retros =
  formFor'
    column
    (pathTo MoveColumnToRetroAction { currentRetroId = get #retroId column, columnId = get #id column })
    [hsx|
      {(selectField #retroId filteredRetros) { autofocus = True, required = True, fieldLabel = "Move this column to a different Retro board", labelClass = "mt-4" }}
      <div class="flex mb-0 py-1">
          <button type="submit" class="mr-2 bg-green-500 hover:bg-green-600 text-white font-bold py-1 px-2 rounded transition duration-300">Move column</button>
          <a href={ShowRetroAction $ get #retroId column} class="mr-2 block btn-gray">Cancel</a>
      </div>
    |]
  where
    filteredRetros = filter (\r -> get #id r /= get #retroId column) retros