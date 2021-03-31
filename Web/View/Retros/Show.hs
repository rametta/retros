module Web.View.Retros.Show where
import Web.View.Prelude

data ShowView = ShowView {
    retro :: Include "columns" Retro,
    columnsWithItems :: [Column' (Id' "retros") [Item]]
}

instance View ShowView where
    html ShowView { .. } =
        [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={RetrosAction}>Retros</a></li>
                <li class="breadcrumb-item active">Show Retro</li>
            </ol>
        </nav>
        <h1>{get #title retro}</h1>
        <div class="container-fluid">
            <div class="row">
                {forEach columns renderColumn}
            </div>
        </div>
        <p>{retro}</p>
        <code>{columns}</code>
        <p>{columnsWithItems}</p>
        |]
        where
            columns = retro |> get #columns

renderColumn :: Column -> Html
renderColumn column =
    [hsx|
    <div class="col-sm">
        <h2>{get #title column}</h2>
        <!-- {forEach items renderItem} -->
    </div>
    |]
    where
        items = column |> get #items
        

renderItem :: Item -> Html
renderItem item =
    [hsx|
        <div>{get #title item}</div>
    |]