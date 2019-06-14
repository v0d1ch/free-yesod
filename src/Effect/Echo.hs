{-# LANGUAGE GADTs             #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module Effect.Echo where

import Control.Monad.Freer
import Import

data Echo a where
  PutLine :: Text -> Echo ()

putLine :: Member Echo r => Text -> Eff r ()
putLine = send . PutLine

echoBot :: Member Echo r => Text -> Eff r ()
echoBot t = putLine t

echoToHandler :: Echo a -> Handler a
echoToHandler action =
  case action of
    PutLine s -> sendResponse s

interpretEchoInHandler :: Eff '[Echo] a -> Handler a
interpretEchoInHandler = runM . translate echoToHandler
