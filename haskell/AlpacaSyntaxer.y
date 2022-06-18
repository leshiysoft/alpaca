{
module AlpacaSyntaxer where
import AlpacaLexer
}

%name synt
%tokentype { Token }
%error { parseError }

%token
  string      { TString $$ }
  func        { TFunc }
  return      { TReturn }
  arrow       { TArrow }
  int         { TInteger $$ }
  id          { TId $$ }
  '='         { TSym '=' }
  '+'         { TSym '+' }
  '-'         { TSym '-' }
  '*'         { TSym '*' }
  '/'         { TSym '/' }
  '('         { TSym '(' }
  ')'         { TSym ')' }
  '{'         { TSym '{' }
  '}'         { TSym '}' }
  ';'         { TSym ';' }
  ','         { TSym ',' }

%%

Prog:
  Func                          { Prog [$1] }
  | Func Prog                   { let Prog x = $2 in Prog ($1 : x) }

Func:
  FuncDef '{' FuncBody '}'      { Func $1 $3 }

FuncDef:
  func id '(' ')' arrow '(' ')'                   { FuncDef (FuncName $ Id $2) [] [] }
  | func id '(' Args ')' arrow '(' ')'            { FuncDef (FuncName $ Id $2) $4 [] }
  | func id '(' ')' arrow '(' RetTypes ')'        { FuncDef (FuncName $ Id $2) [] $7 }
  | func id '(' Args ')' arrow '(' RetTypes ')'   { FuncDef (FuncName $ Id $2) $4 $8 }

Args:
  Arg                           { [$1] }
  | Arg ',' Args                { $1 : $3 }

Arg:
  id id                         { Arg (Type $ Id $1) (VarName $ Id $2) }

RetTypes:
  id                            { [Type $ Id $1] }
  | id ',' RetTypes             { (Type $ Id $1) : $3 }

FuncBody:
  Action ';'                    { FuncBody [$1] }
  | Action ';' FuncBody         { let FuncBody as = $3 in FuncBody ($1 : as) }

Action:
  id id                         { VarDef (Type $ Id $1) (VarName $ Id $2) Nothing }
  | id id '=' Expr              { VarDef (Type $ Id $1) (VarName $ Id $2) (Just $4) }
  | id '(' Exprs ')'            { Call $ FuncCall (FuncName $ Id $1) $3 }
  | id '(' ')'                  { Call $ FuncCall (FuncName $ Id $1) [] }
  | return Expr                 { Return $2 }

Exprs:
  Expr                          { [$1] }
  | Expr ',' Exprs              { $1 : $3 }

Expr:
  Mult                          { Sum $1 [] }
  | Mult '+' Expr               { let Sum m ms = $3 in Sum $1 ((Plus, m):ms) }
  | Mult '-' Expr               { let Sum m ms = $3 in Sum $1 ((Minus, m):ms) }

Mult:
  Term                          { Mult $1 [] }
  | Term '*' Mult               { let Mult t ts = $3 in Mult $1 ((Times, t):ts) }
  | Term '/' Mult               { let Mult t ts = $3 in Mult $1 ((Divide, t):ts) }

Term:
  int                           { ConstTermInt $1 }
  | '-' int                     { ConstTermInt (-$2) }
  | id                          { TermVar $ VarName $ Id $1  }
  | '-' id                      { TermVarMinus $ VarName $ Id $2 }
  | id '(' Exprs ')'            { TermCall $ FuncCall (FuncName $ Id $1) $3 }
  | '-' id '(' Exprs ')'        { TermCallMinus $ FuncCall (FuncName $ Id $2) $4 }
  | id '(' ')'                  { TermCall $ FuncCall (FuncName $ Id $1) [] }
  | '-' id '(' ')'              { TermCallMinus $ FuncCall (FuncName $ Id $2) [] }
  | '(' Expr ')'                { TermExpr $2 }
  | '-' '(' Expr ')'            { TermExprMinus $3 }
  | string                      { TermString $1 }


{
parseError :: [Token] -> a
parseError ts = error ("Parse error" ++ (show $ take 10 ts) )

data Prog = Prog [Func] deriving (Show)
data Func = Func FuncDef FuncBody deriving (Show)
data FuncDef = FuncDef FuncName [Arg] [Type] deriving (Show)
data FuncName = FuncName Id deriving (Show)
data Arg = Arg Type VarName deriving (Show)
data Type = Type Id deriving (Show)
data Id = Id String deriving (Show)
data FuncBody = FuncBody [Action] deriving (Show)
data Action =
  VarDef Type VarName (Maybe Expr)
  | Call FuncCall
  | Return Expr deriving (Show)
data FuncCall = FuncCall FuncName [Expr] deriving (Show)
data VarName = VarName Id deriving (Show)
data Expr = Sum Mult [(Sign, Mult)] deriving (Show)
data Sign = Plus | Minus deriving (Show)
data Mult = Mult Term [(MultOp, Term)] deriving (Show)
data MultOp = Times | Divide deriving (Show)
data Term =
  ConstTermInt Int
  | TermVar VarName
  | TermVarMinus VarName
  | TermCall FuncCall
  | TermCallMinus FuncCall
  | TermExpr Expr
  | TermExprMinus Expr
  | TermString String deriving (Show)


}
