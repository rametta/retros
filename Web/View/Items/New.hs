module Web.View.Items.New where
import Web.View.Prelude

data NewView = NewView { item :: Item }

instance View NewView where
    html NewView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href={ItemsAction}>Items</a></li>
                <li class="breadcrumb-item active">New Item</li>
            </ol>
        </nav>
        <h1>New Item</h1>
        {renderForm item}
    |]

renderForm :: Item -> Html
renderForm item = formFor item [hsx|
    {(textField #retroId)}
    {(textField #columnId)}
    {(textField #title)}
    {(textField #description)}
    {(textField #sortOrder)}
    {submitButton}
|]
