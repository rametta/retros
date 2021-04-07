module Web.View.Teams.New where
import Web.View.Prelude

newtype NewView = NewView { team :: Team }

instance View NewView where
    html NewView { .. } = renderModal Modal
        { modalTitle = "New Team"
        , modalCloseUrl = pathTo TeamsAction
        , modalFooter = Nothing
        , modalContent = renderForm team
        }

renderForm :: Team -> Html
renderForm team = formFor team [hsx|
    {(textField #title) { autofocus = True, fieldLabel = "Name", placeholder = "Jane Doe's Team" }}
    {(hiddenField #ownerId)}
    <div class="flex justify-between">
        <div class="flex">
            <button class="mr-2 bg-green-500 hover:bg-green-600 text-white font-bold py-1 px-2 rounded transition duration-300">Save</button>
            <a href={TeamsAction} class="block btn-gray">Cancel</a>
        </div>
    </div>
|]
