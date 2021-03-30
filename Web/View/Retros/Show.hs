module Web.View.Retros.Show where
import Web.View.Prelude

data ShowView = ShowView { retro :: Retro }

instance View ShowView where
    html ShowView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={RetrosAction}>Retros</a></li>
                <li class="breadcrumb-item active">Show Retro</li>
            </ol>
        </nav>
        <h1>Show Retro</h1>
        <p>{retro}</p>
    |]
