{
module AlpacaLexer where
}

%wrapper "basic"

$digit = 0-9
$alpha = [a-zA-Z]

tokens :-

  $white                                        ;
  "#" .*                                        ;
  func                                          { \s -> TFunc }
  return                                        { \s -> TReturn }
  "->"                                          { \s -> TArrow }
  $digit+                                       { \s -> TInteger (read s)}
  [\=\+\-\*\/\(\)\{\}\;\,]                      { \s -> TSym (head s)}
  $alpha [$alpha $digit \_ ]*                   { \s -> TId s}

{
data Token =
  TFunc
  | TReturn
  | TArrow
  | TInteger Int
  | TSym Char
  | TId String deriving (Eq, Show)
}
