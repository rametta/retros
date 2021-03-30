module Web.View.Items.Show where
import Web.View.Prelude

data ShowView = ShowView { item :: Item }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ItemsAction}>Items</a></li>
                <li class="breadcrumb-item active">Show Item</li>
            </ol>
        </nav>
        <h1>Show Item</h1>
        <p>{item}</p>
    |]
