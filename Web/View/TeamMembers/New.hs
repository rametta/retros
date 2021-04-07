module Web.View.TeamMembers.New where
import Web.View.Prelude

newtype NewView = NewView { teamMember :: TeamMember }

instance CanSelect User where
    type SelectValue User = Id User
    selectValue = get #id
    selectLabel = get #fullname

instance View NewView where
    html NewView { .. } = renderModal Modal
        { modalTitle = "New Team Member"
        , modalCloseUrl = pathTo $ EditTeamAction $ get #teamId teamMember
        , modalFooter = Nothing
        , modalContent = renderForm teamMember
        }

renderForm :: TeamMember -> Html
renderForm teamMember = formFor teamMember [hsx|
        {(hiddenField #teamId)}
        <label for="teamMember_user_email">Email</label>
        <div class="form-group">
            <input id="teamMember_user_email" name="email" type="email" class="form-control" placeholder="JaneDoe@gmail.com" autofocus required />
        </div>
        {renderError}
        <div class="flex justify-between">
            <div class="flex">
                <button class="mr-2 bg-green-500 hover:bg-green-600 text-white font-bold py-1 px-2 rounded transition duration-300">Add</button>
                <a href={EditTeamAction $ get #teamId teamMember} class="block btn-gray">Cancel</a>
            </div>
        </div>
    |]
    where
        renderError = case getValidationFailure #userId teamMember of
            Just text -> [hsx|<div class="invalid-feedback">{text}</div>|]
            Nothing -> mempty