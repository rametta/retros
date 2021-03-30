module Web.View.Columns.Index where
import Web.View.Prelude

data IndexView = IndexView { columns :: [Column] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={ColumnsAction}>Columns</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewColumnAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Column</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach columns renderColumn}</tbody>
            </table>
        </div>
    |]


renderColumn column = [hsx|
    <tr>
        <td>{column}</td>
        <td><a href={ShowColumnAction (get #id column)}>Show</a></td>
        <td><a href={EditColumnAction (get #id column)} class="text-muted">Edit</a></td>
        <td><a href={DeleteColumnAction (get #id column)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
