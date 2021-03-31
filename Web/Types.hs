module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types

data WebApplication = WebApplication deriving (Eq, Show)


data StaticController = WelcomeAction deriving (Eq, Show, Data)

data RetrosController
    = RetrosAction
    | NewRetroAction
    | ShowRetroAction { retroId :: !(Id Retro) }
    | CreateRetroAction
    | EditRetroAction { retroId :: !(Id Retro) }
    | UpdateRetroAction { retroId :: !(Id Retro) }
    | DeleteRetroAction { retroId :: !(Id Retro) }
    deriving (Eq, Show, Data)

data ColumnsController
    = ColumnsAction
    | NewColumnAction
    | ShowColumnAction { columnId :: !(Id Column) }
    | CreateColumnAction
    | EditColumnAction { columnId :: !(Id Column) }
    | UpdateColumnAction { columnId :: !(Id Column) }
    | DeleteColumnAction { columnId :: !(Id Column) }
    deriving (Eq, Show, Data)

data ItemsController
    = ItemsAction
    | NewItemAction
    | NewColumnItemAction { retroId :: !(Id Retro), columnId :: !(Id Column) }
    | ShowItemAction { itemId :: !(Id Item) }
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
