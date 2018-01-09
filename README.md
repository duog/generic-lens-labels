master build: [![Build Status](https://travis-ci.org/duog/generic-lens-labels.svg?branch=master)](https://travis-ci.org/duog/generic-lens-labels)

develop build: [![Build Status](https://travis-ci.org/duog/generic-lens-labels.svg?branch=develop)](https://travis-ci.org/duog/generic-lens-labels)

develop branch
==================

I may rebase develop from time to time, let me know if that's causing you problems.

Summary
=======

This package provides the module `Data.Generic.Labels`, which provides an `IsLabel` instance
allowing one to use `OverloadedLabels` to access field lenses from the [generic-lens](https://github.com/kcsongor/generic-lens) library.

As the `IsLabel` instance provided is necessarily orphan, your code will break if you depend on
this library and any other library that provides an orphan `IsLabel` instance at the same
time. As such, this should be considered a toy.

Example:
========

```haskell
{-# LANGUAGE OverloadedLabels, DeriveGeneric #- }

module Example

import Data.Generics.Labels()
import GHC.Generics
import Control.Lens

data Foo = Foo {bar :: Int} deriving (Generic)

_bar :: Lens' Foo Int
_bar = #bar
```
