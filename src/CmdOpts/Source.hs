module CmdOpts.Source
  ( Source(..)
  , mkSource
  ) where

import Data.Text (Text)

data Source = Source
  { original :: [Text]
  , remaining :: [Maybe Text]
  } deriving (Eq, Show)

mkSource :: [Text] -> Source
mkSource args = Source args (Just <$> args)
