{-# LANGUAGE CPP, TypeFamilies, TypeApplications,ScopedTypeVariables
    , FlexibleInstances, MultiParamTypeClasses, UndecidableInstances #-}
{-# OPTIONS_GHC -Wno-orphans #-}
module Data.Generics.Labels
  () where

import Data.Generics.Product
import GHC.OverloadedLabels

{-
example:

data Foo = Foo {bar :: Int} deriving (Generic)

_bar :: Lens' Foo Int
_bar = #bar

-}

{-
This is the instance head that seems to give the best type inference.
-}

#if MIN_VERSION_generic_lens(0,5,0)
#if __GLASGOW_HASKELL__ < 802

instance (HasField x s t a b, Functor f, lens ~ ((a -> f b) -> s -> f t)) =>
  IsLabel x lens where
  fromLabel _ = field @ x

#else
-- __GLASGOW_HASKELL

instance (HasField x s t a b, Functor f, lens ~ ((a -> f b) -> s -> f t)) =>
  IsLabel x lens where
  fromLabel = field @ x

#endif
-- __GLASGOW_HASKELL

#else
-- MIN_VERSION_generic_lens

#if __GLASGOW_HASKELL < 802

instance (HasField x a s, Functor f, lens ~ ((a -> f a) -> s -> f s)) =>
  IsLabel x lens where
  fromLabel _ = field @ x

#else
-- __GLASGOW_HASKELL

instance (HasField x a s, Functor f, lens ~ ((a -> f a) -> s -> f s)) =>
  IsLabel x lens where
  fromLabel = field @ x

#endif
-- __GLASGOW_HASKELL

#endif
-- MIN_VERSION_generic_lens
