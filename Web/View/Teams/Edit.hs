module Web.View.Teams.Edit where
import Web.View.Prelude

data EditView = EditView { team :: Team }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={TeamsAction}>Teams</a></li>
                <li class="breadcrumb-item active">Edit Team</li>
            </ol>
        </nav>
        <h1>Edit Team</h1>
        {renderForm team}
    |]

renderForm :: Team -> Html
renderForm team = formFor team [hsx|
    {(textField #title)}
    {(textField #ownerId)}
    {submitButton}
|]
