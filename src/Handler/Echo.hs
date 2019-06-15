{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE NoImplicitPrelude     #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}

module Handler.Echo where

import Control.Monad.Freer
import Effect.Echo (Echo (..), echoReceivedText)
import Import

echoReceivedTextToHandler :: Echo a -> Handler a
echoReceivedTextToHandler action =
  case action of
    SendReceivedText s -> sendResponse s

interpretEchoInHandler :: Eff '[Echo] a -> Handler a
interpretEchoInHandler = runM . translate echoReceivedTextToHandler

getEchoR :: Text -> Handler ()
getEchoR t = interpretEchoInHandler $ echoReceivedText t
