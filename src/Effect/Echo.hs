{-# LANGUAGE GADTs             #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module Effect.Echo where

import Control.Monad.Freer
import Import

data Echo a where
  SendReceivedText :: Text -> Echo ()

sendReceivedText :: Member Echo r => Text -> Eff r ()
sendReceivedText = send . SendReceivedText

echoReceivedText :: Member Echo r => Text -> Eff r ()
echoReceivedText t = sendReceivedText t
