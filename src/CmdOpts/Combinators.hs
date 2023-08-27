{-# LANGUAGE BlockArguments #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeApplications #-}

module CmdOpts.Combinators
  ( argument
  ) where

import CmdOpts.Parser

import Control.Lens hiding (argument)
import Data.Generics.Product.Any
import Data.Text (Text)

argument :: Parser Text
argument =
  Parser \s -> do
    case s ^. the @"remaining" of
      [] -> []
      Nothing : _ -> []
      Just a : t -> [(a, s & the @"remaining" .~ t)]
