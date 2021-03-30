module Web.View.Retros.New where
import Web.View.Prelude

data NewView = NewView { retro :: Retro }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={RetrosAction}>Retros</a></li>
                <li class="breadcrumb-item active">New Retro</li>
            </ol>
        </nav>
        <h1>New Retro</h1>
        {renderForm retro}
    |]

renderForm :: Retro -> Html
renderForm retro = formFor retro [hsx|
    {(textField #title)}
    {submitButton}
|]
