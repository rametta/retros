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
        [hsx|
        <nav class="container mx-auto">
            <ol class="flex">
                <li class="breadcrumb-item"><a href={RetrosAction}>Back</a></li>
            </ol>
        </nav>
        <main class="container mx-auto">
            <div class="flex justify-between items-center">
                <h1 class="text-4xl font-bold">{get #title retro}</h1>
                <div>
                    <a href={pathTo NewColumnAction} class="btn btn-primary">New Column</a>
                </div>
            </div>
            <div class="container-fluid">
                <div class="row">
                    {forEach columns $ renderColumn items}
                </div>
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
    <div class="col-sm">
        <h2>{get #title column}</h2>
        <a href={EditColumnAction columnId} class="btn btn-primary btn-sm">Edit Column</a>
        <a href={NewColumnItemAction retroId columnId} class="btn btn-info btn-sm">Add New Item</a>
        {forEach items renderItem}
    </div>
    |]

renderItem :: Item -> Html
renderItem item =
    [hsx|
        <div>{get #title item} <a href={EditItemAction $ get #id item}>Edit Item</a></div>
    |]