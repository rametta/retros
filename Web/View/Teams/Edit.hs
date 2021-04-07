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
        {(textField #title) {autofocus = True, required = True, placeholder = "Jane Doe's Team"}}
        {(hiddenField #ownerId)}
        <div class="flex justify-between items-center">
            <label>Members</label>
            <a href={NewTeamMemberAction $ get #id team} class="block btn-gray text-xs">Add Member</a>
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
                        <div class="text-gray-400">There are no members in this team yet. Add some!</div>
                    |]
                _ -> forEach users $ renderUser team


renderUser :: Team -> User -> Html
renderUser team user =
    [hsx|
        <div class="flex text-white justify-between items-center bg-gray-600 py-1 px-2 text-sm rounded">
            <span>
                <span class="font-bold">{get #fullname user}</span> - <span class="italic">({get #email user})</span> {label}
            </span>
            <a class="js-delete bg-red-500 hover:bg-red-400 px-1 rounded transition duration-300" href={DeleteTeamMemberAction teamId userId}>Remove</a>
        </div>
    |]
    where
        teamId = get #id team
        ownerId = get #ownerId team
        userId = get #id user
        label :: String
        label = if ownerId == userId then
                    "(Team Owner)"
                else
                    ""