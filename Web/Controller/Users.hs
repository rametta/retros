module Web.Controller.Users where

import Web.Controller.Prelude
import Web.View.Users.New
import Web.View.Users.Edit

instance Controller UsersController where
    action NewUserAction = do
        let user = newRecord
        render NewView { .. }

    action EditUserAction { userId } = do
        user <- fetch userId
        render EditView { .. }

    action UpdateUserAction { userId } = do
        user <- fetch userId
        user
            |> buildUser
            |> ifValid \case
                Left user -> render EditView { .. }
                Right user -> do
                    user <- user |> updateRecord
                    setSuccessMessage "User updated"
                    redirectTo EditUserAction { .. }

    action CreateUserAction = do
        let user = newRecord @User
        user
            |> buildUser
            |> validateField #email nonEmpty
            |> validateField #fullname nonEmpty
            |> validateField #passwordHash nonEmpty
            |> validateField #email isEmail
            |> validateIsUnique #email
            >>= ifValid \case
                Left user -> render NewView { .. } 
                Right user -> do
                    hashed <- hashPassword (get #passwordHash user)
                    user <- user
                        |> set #passwordHash hashed
                        |> createRecord
                    redirectTo RetrosAction

buildUser user = user
    |> fill @["email", "fullname","passwordHash"]
