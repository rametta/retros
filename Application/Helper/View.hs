module Application.Helper.View where

import IHP.ViewPrelude
import Generated.Types
import Web.Controller.Prelude

renderNavbar :: AutoRoute SessionsController => AutoRoute RetrosController => Html -> Html -> Html
renderNavbar afterLogo beforSessionBtn =
  [hsx|
    <nav class="flex items-center justify-between flex-wrap bg-gray-800 p-2">
      <div class="flex items-center">
        <a href={RetrosAction} class="mr-2 block bg-green-500 hover:bg-green-400 text-white font-bold py-1 px-2 rounded transition duration-300">Retros</a>
        {afterLogo}
      </div>
      <div class="flex items-center">
        {beforSessionBtn}
        {loginLogoutButton}
      </div>
    </nav>
  |]
  where
    loginLogoutButton :: Html
    loginLogoutButton =
        case fromFrozenContext @(Maybe User) of
            Just user -> [hsx|<a class="js-delete js-delete-no-confirm btn-gray ml-2" href={DeleteSessionAction}>Logout</a>|]
            Nothing -> [hsx|<a class="btn-gray ml-2" href={NewSessionAction}>Login</a>|]