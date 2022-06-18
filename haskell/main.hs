module Main where

import System.IO
import AlpacaLexer
import AlpacaSyntaxer
import Data.List

main :: IO()
main = do
  text <- readFile "test.al"
  tokens <- return $ alexScanTokens text
  tree <- return $ synt tokens
  output <- return $ compile tree
  writeFile "main.c" output
  putStrLn output

compile :: Prog -> String
compile (Prog fs) = inc ++ defs ++ "\n" ++ impls
  where
    inc = "#include <stdio.h>\n\n"
    defs = concat $ map (++ ";\n") $  map compileFuncDef fs
    impls = concat $ map ( ++ "\n") $ map compileFunc fs

compileFuncDef :: Func -> String
compileFuncDef (Func fd _) = intercalate " " [retType, fname, "(", cArgsStr, ")"]
  where
    FuncDef (FuncName (Id fname)) args retTypes = fd
    retType = getReturnType retTypes
    fArg (Arg (Type (Id t)) (VarName (Id v))) = (t, v)
    pArgs = map fArg args
    cArgs = map (\(t, v) -> converTypes t ++ " " ++ v ) pArgs
    cArgsStr = intercalate ", " cArgs

getReturnType :: [Type] -> String
getReturnType [] = "void"
getReturnType (Type (Id t) : _) = converTypes t

converTypes :: String -> String
converTypes "Int" = "int"
converTypes t = error ("unknown type: " ++ t)


compileFunc :: Func -> String
compileFunc f = compileFuncDef f ++ "\n{\n" ++ body ++ "}\n"
  where
    body = concat $ map ("  " ++ ) $ map ( ++ ";\n") $ map compileAction actions
    Func _ (FuncBody actions) = f

compileAction :: Action -> String
compileAction (VarDef (Type (Id t)) (VarName (Id v)) Nothing ) = res
  where
    res = converTypes t ++ " " ++ v;
compileAction (VarDef (Type (Id t)) (VarName (Id v)) (Just e) ) = res
  where
    res = converTypes t ++ " " ++ v ++ " = " ++ compileExpr e;
compileAction (Call fc) = compileCall fc
compileAction (Return e) = "return " ++ compileExpr e

compileCall :: FuncCall -> String
compileCall (FuncCall (FuncName (Id fn)) es ) = res
  where
    res = fn ++ "(" ++ (intercalate ", " $ map compileExpr es) ++ ")"

compileExpr :: Expr -> String
compileExpr (Sum m []) = compileMult m
compileExpr (Sum m ms) = compileMult m ++ other
  where
    other = concat $ map fMult ms
    fMult (Plus, mm) = "+" ++ compileMult mm
    fMult (Minus, mm) = "-" ++ compileMult mm


compileMult :: Mult -> String
compileMult (Mult t []) = compileTerm t
compileMult (Mult t ts) = compileTerm t ++ other
  where
    other = concat $ map fTerm ts
    fTerm (Times, tt) = "+" ++ compileTerm tt
    fTerm (Divide, tt) = "-" ++ compileTerm tt


compileTerm :: Term -> String
compileTerm (ConstTermInt i) = show i
compileTerm (TermVar (VarName (Id v))) = v
compileTerm (TermVarMinus (VarName (Id v))) = "-" ++ v
compileTerm (TermCall fc) = compileCall fc
compileTerm (TermCallMinus fc) = "-" ++ compileCall fc
compileTerm (TermExpr e) = "(" ++ compileExpr e ++ ")"
compileTerm (TermExprMinus e) = "-(" ++ compileExpr e ++ ")"
compileTerm (TermString s) = s
