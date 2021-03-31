module Web.View.Retros.Show where
import Web.View.Prelude

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
        in
        [hsx|
        <main class="h-full flex flex-col">
            <div class="flex justify-between items-center p-2">
                <h1 class="text-4xl font-bold">{get #title retro}</h1>
                <div>
                    <a href={pathTo $ EditRetroAction retroId } class="btn">Edit Retro</a>
                    <a href={pathTo $ NewRetroColumnAction retroId } class="btn">New Column</a>
                </div>
            </div>
            
            <div class="w-full flex h-full overflow-auto">
                <div class="flex">
                    {forEach sortedColumns $ renderColumn items}
                </div>
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
        <div class="flex justify-between items-center">
            <h2 class="text-2xl">{get #title column}</h2>
            <div>
                <a href={EditColumnAction columnId} class="btn">Edit</a>
            </div>
        </div>
        <div class="flex-grow overflow-auto">
            {forEach items renderItem}
        </div>
        <div>
            <a href={NewColumnItemAction retroId columnId $ length items} class="btn block">+ Add another card</a>
        </div>
    </div>
    |]

renderItem :: Item -> Html
renderItem item =
    [hsx|
        <div class="rounded shadow bg-white p-2 my-2 flex justify-between">
            {get #title item} <a href={EditItemAction $ get #id item}>Edit</a>
        </div>
    |]