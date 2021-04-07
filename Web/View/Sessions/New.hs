module Web.View.Sessions.New where
import Web.View.Prelude
import IHP.AuthSupport.View.Sessions.New

instance View (NewView User) where
    html NewView { .. } = [hsx|
        {renderNavbar mempty mempty}
        <main class="w-100">
            <div class="mx-auto max-w-sm mb-5 bg-gray-800 rounded p-3 mt-12">
                <h5 class="text-xl text-white font-bold mb-3">Login</h5>
                {renderForm user}
            </div>
        </main>
    |]

renderForm :: User -> Html
renderForm user = [hsx|
    <form method="POST" action={CreateSessionAction}>
        <div class="form-group">
            <label for="email">Email</label>
            <input required autofocus id="email" name="email" value={get #email user} type="email" placeholder="JaneDoe@gmail.com" />
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input required id="password" name="password" type="password" placeholder="Password" />
        </div>
        <div class="flex items-center justify-between">
            <button type="submit" class="btn-gray">Login</button>
            <a href={NewUserAction} class="text-white hover:text-gray-500">Signup Instead?</a>
        </div>
    </form>
|]