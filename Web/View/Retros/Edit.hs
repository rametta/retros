module Web.View.Retros.Edit where
import Web.View.Prelude

data EditView = EditView { retro :: Retro }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={RetrosAction}>Retros</a></li>
                <li class="breadcrumb-item active">Edit Retro</li>
            </ol>
        </nav>
        <h1>Edit Retro</h1>
        {renderForm retro}
    |]

renderForm :: Retro -> Html
renderForm retro = formFor retro [hsx|
    {(textField #title)}
    {submitButton}
|]
