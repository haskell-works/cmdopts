{-# LANGUAGE ApplicativeDo #-}
{-# LANGUAGE BlockArguments #-}

module CmdOpts.Parser
  ( Parser(..)
  ) where

import CmdOpts.Source

import Control.Selective
import Data.Bifunctor

newtype Parser a = Parser
  { unParser :: Source -> [(a, Source)]
  }

instance Functor Parser where
  fmap f p =
    Parser $ fmap (first f) . unParser p

instance Applicative Parser where
  pure a =
    Parser $ \s -> pure (a, s)

  pf <*> pa =
    Parser \s -> do
      (f, t) <- unParser pf s
      (a, u) <- unParser pa t
      pure (f a, u)

instance Selective Parser where
  select p q =
    Parser \s -> do
      (r, t) <- unParser p s
      case r of
        Left a -> do
          (f, u) <- unParser q t
          pure (f a, u)
        Right b -> pure (b, t)

instance Monad Parser where
  pa >>= f =
    Parser \s -> do
      (a, t) <- unParser pa s
      unParser (f a) t
 