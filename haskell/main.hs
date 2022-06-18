module Main where

import System.IO
import AlpacaLexer
import AlpacaSyntaxer

main :: IO()
main = do
  text <- readFile "test.al"
  tokens <- return $ alexScanTokens text
  putStrLn $ show tokens
  tree <- return $ synt tokens
  putStrLn $ show $ tree
