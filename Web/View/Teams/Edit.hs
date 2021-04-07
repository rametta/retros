module Web.View.Teams.Edit where
import Web.View.Prelude

data EditView = EditView { team :: Team }

instance View EditView where
    html EditView { .. } = renderModal Modal
        { modalTitle = "Edit Team"
        , modalCloseUrl = pathTo $ ShowTeamAction $ get #id team
        , modalFooter = Nothing
        , modalContent = renderForm team
        }

renderForm :: Team -> Html
renderForm team = formFor team [hsx|
    {(textField #title) {autofocus = True, placeholder = "Jane Doe's Team"}}
    {(hiddenField #ownerId)}
    <div class="flex justify-between">
        <div class="flex">
            <button class="mr-2 bg-green-500 hover:bg-green-600 text-white font-bold py-1 px-2 rounded transition duration-300">Save</button>
            <a href={ShowTeamAction $ get #id team} class="block btn-gray">Cancel</a>
        </div>
        <a href={DeleteTeamAction $ get #id team} class="js-delete block bg-red-500 hover:bg-red-400 text-white font-bold py-1 px-2 rounded transition duration-300">Delete Team</a>
    </div>
|]
