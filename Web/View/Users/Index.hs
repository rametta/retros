module Web.View.Users.Index where
import Web.View.Prelude

newtype IndexView = IndexView { users :: [User] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        {renderNavbar Nothing mempty mempty}
        <main class="container mx-auto mt-3 text-white">
            <div class="w-full overflowx-auto">
                <table class="w-full">
                    <thead>
                        <tr>
                            <th class="text-left">ID</th>
                            <th class="text-left">Name</th>
                            <th class="text-left">Email</th>
                        </tr>
                    </thead>
                    <tbody>
                        {forEach users renderUser}
                    </tbody>
                </table>
            </div>
        </main>

    |]

renderUser :: User -> Html
renderUser user = [hsx|
    <tr>
        <td><code>{get #id user}</code></td>
        <td>{get #fullname user}</td>
        <td>{get #email user}</td>
    </tr>
|]
