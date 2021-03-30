module Web.View.Retros.Index where
import Web.View.Prelude

data IndexView = IndexView { retros :: [Retro] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={RetrosAction}>Retros</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewRetroAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Retro</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach retros renderRetro}</tbody>
            </table>
        </div>
    |]


renderRetro retro = [hsx|
    <tr>
        <td>{retro}</td>
        <td><a href={ShowRetroAction (get #id retro)}>Show</a></td>
        <td><a href={EditRetroAction (get #id retro)} class="text-muted">Edit</a></td>
        <td><a href={DeleteRetroAction (get #id retro)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]
