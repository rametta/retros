module Web.View.Users.New where
import Web.View.Prelude

newtype NewView = NewView { user :: User }

instance View NewView where
    html NewView { .. } = [hsx|
        {renderNavbar Nothing mempty mempty}
        <main class="w-100">
            <div class="mx-auto max-w-sm mb-5 bg-gray-800 rounded p-3 mt-12">
                <h5 class="text-xl text-white font-bold mb-3">Signup</h5>
                {renderForm user}
            </div>
        </main>
    |]

renderForm :: User -> Html
renderForm user = formFor user [hsx|
    {(textField #fullname) {fieldLabel = "Name", placeholder = "Jane Doe", required = True, autofocus = True}}
    {(emailField #email) {fieldLabel = "E-Mail", placeholder = "JaneDoe@gmail.com", required = True}}
    {(passwordField #passwordHash){fieldLabel = "Password", placeholder = "Password", required = True}}
    <div class="flex items-center justify-between">
        <button type="submit" class="btn-gray">Signup</button>
        <a href={NewSessionAction} class="text-white hover:text-gray-500">Login Instead?</a>
    </div>
|]