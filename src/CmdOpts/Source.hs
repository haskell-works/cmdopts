{-# LANGUAGE DeriveGeneric #-}

module CmdOpts.Source
  ( Source(..)
  , mkSource
  ) where

import Data.Text (Text)

import GHC.Generics

data Source = Source
  { original :: [Text]
  , remaining :: [Maybe Text]
  } deriving (Eq, Generic, Show)

mkSource :: [Text] -> Source
mkSource args = Source args (Just <$> args)
