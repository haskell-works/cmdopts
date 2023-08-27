module CmdOpts.Source
  ( Source(..)
  ) where

import Data.Text (Text)

newtype Source = Source
  { unSource :: Text
  } deriving (Eq, Show)
