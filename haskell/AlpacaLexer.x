{
module AlpacaLexer where
}

%wrapper "basic"

$digit = 0-9
$alpha = [a-zA-Z]
@string  = $printable # [\"]

tokens :-

  $white                                        ;
  "#" .*                                        ;
  func                                          { \s -> TFunc }
  return                                        { \s -> TReturn }
  "->"                                          { \s -> TArrow }
  $digit+                                       { \s -> TInteger (read s)}
  [\=\+\-\*\/\(\)\{\}\;\,]                      { \s -> TSym (head s)}
  $alpha [$alpha $digit \_ ]*                   { \s -> TId s}
  \" @string* \"		                            { \s -> TString s}

{
data Token =
  TFunc
  | TReturn
  | TArrow
  | TInteger Int
  | TSym Char
  | TString String
  | TId String deriving (Eq, Show)
}
