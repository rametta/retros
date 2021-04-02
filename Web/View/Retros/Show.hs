module Web.View.Retros.Show where
import Web.View.Prelude
import GHC.Base (Semigroup)

data ShowView = ShowView {
    retro :: Retro,
    columns :: [Column],
    items :: [Item],
    comments :: [Comment]
}

instance View ShowView where
    html ShowView { .. } =
        let
            retroId = get #id retro
            sortedColumns = columns |> sortOn (get #sortOrder)
            count = length columns

            viewColumns = case count of
                0 -> [hsx|<div class="w-full p-4 text-center text-gray-600">There are no columns yet. Add some by clicking "New Column"!</div>|]
                _ -> [hsx|<div class="flex">{forEach sortedColumns $ renderColumn items}</div>|]
        in
        [hsx|
        <main class="h-full flex flex-col">
            <div class="flex justify-between items-center p-2">
                <h1 class="text-4xl font-bold">{get #title retro}</h1>
                <div class="flex flex-wrap">
                    <a href={pathTo $ EditRetroAction retroId } class="btn-gray mr-1 block text-sm">Edit Retro</a>
                    <a href={pathTo $ NewRetroColumnAction retroId count } class="block btn-gray text-sm">New Column</a>
                </div>
            </div>
            
            <div class="w-full flex h-full overflow-auto">
                {viewColumns}
            </div>
        </main>
        |]

renderColumn :: [Item] -> Column ->  Html
renderColumn allItems column =
    let
        retroId = get #retroId column
        columnId = get #id column
        items = allItems
                    |> filter ((== columnId) . get #columnId)
                    |> sortOn (get #sortOrder)
    in
    [hsx|
    <div style="min-width: 18rem" class="p-2 w-72 m-2 rounded bg-gray-200 flex flex-col justify-between">
        <div class="flex justify-between">
            <h2 class="text-2xl">{get #title column}</h2>
            <div>
                <a href={EditColumnAction columnId} class="btn-gray text-sm">Edit</a>
            </div>
        </div>
        <div class="flex-grow overflow-auto">
            {forEach items renderItem}
        </div>
        <div>
            <a href={NewColumnItemAction retroId columnId $ length items} class="block bg-indigo-500 hover:bg-indigo-400 text-white font-bold py-1 px-2 border-b-4 border-indigo-700 hover:border-indigo-500 rounded transition duration-300 transform hover:scale-105">+ Add another card</a>
        </div>
    </div>
    |]

renderItem :: Item -> Html
renderItem item =
    let
        itemId = get #id item
    in
    [hsx|
        <a href={EditItemAction itemId} class="block rounded shadow bg-white hover:bg-gray-100 transition duration-200 p-2 my-2">
            {get #title item}
        </a>
    |]