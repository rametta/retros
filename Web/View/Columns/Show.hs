module Web.View.Columns.Show where
import Web.View.Prelude

data ShowView = ShowView { column :: Column }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ColumnsAction}>Columns</a></li>
                <li class="breadcrumb-item active">Show Column</li>
            </ol>
        </nav>
        <h1>Show Column</h1>
        <p>{column}</p>
    |]
