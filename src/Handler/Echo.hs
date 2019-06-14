{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}

module Handler.Echo where

import Import
import Effect.Echo

getEchoR :: Text -> Handler ()
getEchoR t = interpretEchoInHandler $ echoBot t
