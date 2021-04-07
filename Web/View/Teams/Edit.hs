module Web.View.Teams.Edit where
import Web.View.Prelude

data EditView = EditView { team :: Team, users :: [User] }

instance View EditView where
    html EditView { .. } = renderModal Modal
        { modalTitle = "Edit Team"
        , modalCloseUrl = pathTo $ ShowTeamAction $ get #id team
        , modalFooter = Nothing
        , modalContent = renderForm team users
        }

renderForm :: Team -> [User] -> Html
renderForm team users = formFor team [hsx|
        {(textField #title) {autofocus = True, placeholder = "Jane Doe's Team"}}
        {(hiddenField #ownerId)}
        <div class="flex justify-between items-center">
            <label>Members</label>
            <a class="block btn-gray text-xs">Add Member</a>
        </div>
        {usersOrEmpty}
        <div class="flex justify-between">
            <div class="flex">
                <button class="mr-2 bg-green-500 hover:bg-green-600 text-white font-bold py-1 px-2 rounded transition duration-300">Save</button>
                <a href={ShowTeamAction $ get #id team} class="block btn-gray">Cancel</a>
            </div>
            <a href={DeleteTeamAction $ get #id team} class="js-delete block bg-red-500 hover:bg-red-400 text-white font-bold py-1 px-2 rounded transition duration-300">Delete Team</a>
        </div>
    |]
    where
        usersOrEmpty :: Html
        usersOrEmpty =
            case length users of
                0 -> [hsx|
                        <div class="text-gray-400">There are no users in this team yet. Add some!</div>
                    |]
                _ -> forEach users renderUser


renderUser :: User -> Html
renderUser user =
    [hsx|
        <div>{get #fullname user}</div>
    |]