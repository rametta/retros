module Web.View.Columns.Edit where
import Web.View.Prelude

data EditView = EditView { column :: Column }

instance View EditView where
    html EditView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ColumnsAction}>Columns</a></li>
                <li class="breadcrumb-item active">Edit Column</li>
            </ol>
        </nav>
        <h1>Edit Column</h1>
        {renderForm column}
    |]

renderForm :: Column -> Html
renderForm column = formFor column [hsx|
    {(textField #retroId)}
    {(textField #title)}
    {(textField #sortOrder)}
    {submitButton}
|]
