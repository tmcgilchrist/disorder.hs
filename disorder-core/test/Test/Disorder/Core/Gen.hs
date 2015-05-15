{-# LANGUAGE TemplateHaskell #-}
module Test.Disorder.Core.Gen where

import           Disorder.Core.Gen
import           Disorder.Core.IO
import           Disorder.Core.OrdPair

import           Test.QuickCheck


prop_vectorOfSize :: (OrdPair (Positive Int)) -> (Positive Int) -> Property
prop_vectorOfSize (OrdPair (Positive x) (Positive y)) (Positive s) = testIO $ do
  l <- generate . resize s $ vectorOfSize x y (arbitrary :: Gen Int)
  return $ length l >= x .&. length l <= y

prop_chooseSize :: (OrdPair (Positive Int)) -> (Positive Int) -> Property
prop_chooseSize (OrdPair (Positive x) (Positive y)) (Positive s) = testIO $ do
  s' <- generate . resize s $ chooseSize x y
  return $ s' >= x .&. s' <= y



return []
tests :: IO Bool
tests = $quickCheckAll
