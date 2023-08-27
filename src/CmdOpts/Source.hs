module CmdOpts.Source
  ( Source(..)
  , mkSource
  ) where

import Data.Text (Text)

newtype Source = Source
  { original :: [Text]
  } deriving (Eq, Show)

mkSource :: [Text] -> Source
mkSource = Source
