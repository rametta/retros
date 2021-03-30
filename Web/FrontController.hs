module Web.FrontController where

import IHP.RouterPrelude
import Web.Controller.Prelude
import Web.View.Layout (defaultLayout)

-- Controller Imports
import Web.Controller.Comments
import Web.Controller.Items
import Web.Controller.Columns
import Web.Controller.Retros
import Web.Controller.Static

instance FrontController WebApplication where
    controllers = 
        [ startPage WelcomeAction
        -- Generator Marker
        , parseRoute @CommentsController
        , parseRoute @ItemsController
        , parseRoute @ColumnsController
        , parseRoute @RetrosController
        ]

instance InitControllerContext WebApplication where
    initContext = do
        setLayout defaultLayout
        initAutoRefresh
