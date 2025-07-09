module Main (main) where

import Test.Hspec
import Test.QuickCheck
import TM
import Eval

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "TM" $ do
    it "should have correct data types" $ do
      R `shouldBe` R
      L `shouldBe` L
      B `shouldBe` B
      I `shouldBe` I
      O `shouldBe` O
      M `shouldBe` M
      H `shouldBe` H

  describe "Move operations" $ do
    it "should move left correctly" $ do
      let tape = ([I], B, [O])
      let moved = move L tape
      -- warningが出ても構いません
      moved `shouldBe` ([], I, [B, O])

  describe "Sample program" $ do
    it "should have correct sample program" $ do
      let (startState, delta) = p
      startState `shouldBe` M
      length delta `shouldBe` 3
