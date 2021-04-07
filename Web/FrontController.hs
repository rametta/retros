module Web.FrontController where

import IHP.RouterPrelude
import IHP.LoginSupport.Middleware
import Web.Controller.Prelude
import Web.View.Layout (defaultLayout)

-- Controller Imports
import Web.Controller.Teams
import Web.Controller.Users
import Web.Controller.Comments
import Web.Controller.Items
import Web.Controller.Columns
import Web.Controller.Retros
import Web.Controller.Static
import Web.Controller.Sessions
instance FrontController WebApplication where
    controllers = 
        [ startPage TeamsAction 
        , parseRoute @SessionsController
        -- Generator Marker
        , parseRoute @TeamsController
        , parseRoute @UsersController
        , parseRoute @CommentsController
        , parseRoute @ItemsController
        , parseRoute @ColumnsController
        , parseRoute @RetrosController
        ]

instance InitControllerContext WebApplication where
    initContext = do
        setLayout defaultLayout
        initAutoRefresh
        initAuthentication @User
