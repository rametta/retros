module Web.View.Columns.New where
import Web.View.Prelude

data NewView = NewView { column :: Column }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ColumnsAction}>Columns</a></li>
                <li class="breadcrumb-item active">New Column</li>
            </ol>
        </nav>
        <h1>New Column</h1>
        {renderForm column}
    |]

renderForm :: Column -> Html
renderForm column = formFor column [hsx|
    {(textField #retroId)}
    {(textField #title)}
    {(textField #sortOrder)}
    {submitButton}
|]
