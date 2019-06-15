{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module Handler.EchoSpec (spec) where

import TestImport

spec :: Spec
spec = withApp $ do

    describe "Echo" $ do
        it "loads the echo page and checks it looks right" $ do
          get (EchoR "Dimitrije")
          statusIs 200
          bodyContains "Dimitrije"
