module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import IHP.LoginSupport.Types
import Generated.Types


data WebApplication = WebApplication deriving (Eq, Show)


data StaticController = WelcomeAction deriving (Eq, Show, Data)

data RetrosController
    = ShowRetroAction { retroId :: !(Id Retro) }
    | CreateRetroAction
    | EditRetroAction { retroId :: !(Id Retro) }
    | UpdateRetroAction { retroId :: !(Id Retro) }
    | DeleteRetroAction { retroId :: !(Id Retro) }
    deriving (Eq, Show, Data)

data ColumnsController
    = NewColumnAction
    | NewRetroColumnAction { retroId :: !(Id Retro), sortOrder :: Int }
    | CreateColumnAction
    | EditColumnAction { columnId :: !(Id Column) }
    | UpdateColumnAction { columnId :: !(Id Column) }
    | DeleteColumnAction { columnId :: !(Id Column) }
    deriving (Eq, Show, Data)

data ItemsController
    = NewItemAction
    | NewColumnItemAction { retroId :: !(Id Retro), columnId :: !(Id Column), sortOrder :: Int }
    | CreateItemAction
    | EditItemAction { itemId :: !(Id Item) }
    | UpdateItemAction { itemId :: !(Id Item) }
    | DeleteItemAction { itemId :: !(Id Item) }
    deriving (Eq, Show, Data)

data CommentsController
    = CommentsAction
    | NewCommentAction
    | ShowCommentAction { commentId :: !(Id Comment) }
    | CreateCommentAction
    | EditCommentAction { commentId :: !(Id Comment) }
    | UpdateCommentAction { commentId :: !(Id Comment) }
    | DeleteCommentAction { commentId :: !(Id Comment) }
    deriving (Eq, Show, Data)

data SessionsController
    = NewSessionAction
    | CreateSessionAction
    | DeleteSessionAction
    deriving (Eq, Show, Data)

data UsersController
    = NewUserAction
    | CreateUserAction
    | EditUserAction { userId :: !(Id User) }
    | UpdateUserAction { userId :: !(Id User) }
    deriving (Eq, Show, Data)

instance HasNewSessionUrl User where
    newSessionUrl _ = "/NewSession"

type instance CurrentUserRecord = User

data TeamsController
    = TeamsAction
    | NewTeamAction
    | NewTeamMemberAction { teamId :: !(Id Team) }
    | NewTeamRetroAction { teamId :: !(Id Team) }
    | ShowTeamAction { teamId :: !(Id Team) }
    | CreateTeamAction
    | EditTeamAction { teamId :: !(Id Team) }
    | UpdateTeamAction { teamId :: !(Id Team) }
    | DeleteTeamAction { teamId :: !(Id Team) }
    deriving (Eq, Show, Data)

data TeamMembersController
    = CreateTeamMemberAction
    | DeleteTeamMemberAction { teamId :: !(Id Team), userId :: !(Id User) }
    deriving (Eq, Show, Data)
