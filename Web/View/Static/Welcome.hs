module Web.View.Static.Welcome where
import Web.View.Prelude

data WelcomeView = WelcomeView

instance View WelcomeView where
    html WelcomeView = [hsx|
      {renderNavbar Nothing mempty mempty}
      <main class="container mx-auto my-3">
         <a href={pathTo $ TeamsAction} class="m-3 block text-lg bg-green-500 hover:bg-green-400 text-white font-bold py-1 px-2 rounded transition duration-300">View your Team's</a>
      </main>
   |]