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
        in
        [hsx|
        <nav class="container mx-auto">
            <ol class="flex">
                <li class="breadcrumb-item"><a href={RetrosAction}>Back</a></li>
            </ol>
        </nav>
        <main class="container mx-auto h-full flex flex-col">
            <div class="flex justify-between items-center">
                <h1 class="text-4xl font-bold">{get #title retro}</h1>
                <div>
                    <a href={pathTo $ NewRetroColumnAction retroId } class="btn">New Column</a>
                </div>
            </div>
            <div class="w-full flex h-full overflow-auto">
                {forEach columns $ renderColumn items}
            </div>
        </main>
        |]

renderColumn :: [Item] -> Column ->  Html
renderColumn allItems column =
    let
        retroId = get #retroId column
        columnId = get #id column
        items = allItems |> filter ((== columnId) . get #columnId)
    in
    [hsx|
    <div style="min-width: 18rem" class="p-2 w-72 mr-3 my-3 rounded bg-gray-200 flex flex-col justify-between">
        <div>
            <h2 class="text-2xl">{get #title column}</h2>
            <a href={EditColumnAction columnId} class="btn">Edit Column</a>
            <div>
                {forEach items renderItem}
            </div>
        </div>
        <a href={NewColumnItemAction retroId columnId} class="btn">+ Add another card</a>
    </div>
    |]

renderItem :: Item -> Html
renderItem item =
    [hsx|
        <div class="rounded shadow bg-white p-2 my-2 flex justify-between">
            {get #title item} <a href={EditItemAction $ get #id item}>Edit</a>
        </div>
    |]