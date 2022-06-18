{-# OPTIONS_GHC -w #-}
module AlpacaSyntaxer where
import AlpacaLexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.11

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,136) ([32768,0,32768,0,0,0,0,2048,0,8,0,0,32768,0,0,0,0,512,0,9,0,4096,0,8192,0,588,0,520,0,1032,0,1024,0,16384,0,8,0,2,0,16,0,1612,0,0,0,96,0,384,0,0,0,512,0,524,0,588,0,9,0,0,0,0,0,1024,0,0,0,512,0,588,0,1612,0,588,0,588,0,588,0,588,0,1024,0,16384,0,0,0,588,0,512,0,0,0,8,0,2,0,512,0,0,0,1032,0,0,0,588,0,0,0,0,0,0,0,0,0,0,0,1024,0,0,0,1024,0,1612,0,0,0,1024,0,0,0,0,0,0,0,0,0,1024,0,16384,0,0,0,1032,0,1024,0,0,0,8,0,0,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_synt","Prog","Func","FuncDef","Args","Arg","RetTypes","FuncBody","Action","Exprs","Expr","Mult","Term","func","return","arrow","int","id","'='","'+'","'-'","'*'","'/'","'('","')'","'{'","'}'","';'","','","%eof"]
        bit_start = st * 32
        bit_end = (st + 1) * 32
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..31]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (16) = happyShift action_4
action_0 (4) = happyGoto action_5
action_0 (5) = happyGoto action_6
action_0 (6) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (16) = happyShift action_4
action_1 (5) = happyGoto action_2
action_1 (6) = happyGoto action_3
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyFail (happyExpListPerState 2)

action_3 (28) = happyShift action_9
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (20) = happyShift action_8
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (32) = happyAccept
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (16) = happyShift action_4
action_6 (4) = happyGoto action_7
action_6 (5) = happyGoto action_6
action_6 (6) = happyGoto action_3
action_6 _ = happyReduce_1

action_7 _ = happyReduce_2

action_8 (26) = happyShift action_14
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (17) = happyShift action_12
action_9 (20) = happyShift action_13
action_9 (10) = happyGoto action_10
action_9 (11) = happyGoto action_11
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (29) = happyShift action_29
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (30) = happyShift action_28
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (19) = happyShift action_24
action_12 (20) = happyShift action_25
action_12 (23) = happyShift action_26
action_12 (26) = happyShift action_27
action_12 (13) = happyGoto action_21
action_12 (14) = happyGoto action_22
action_12 (15) = happyGoto action_23
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (20) = happyShift action_19
action_13 (26) = happyShift action_20
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (20) = happyShift action_17
action_14 (27) = happyShift action_18
action_14 (7) = happyGoto action_15
action_14 (8) = happyGoto action_16
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (27) = happyShift action_47
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (31) = happyShift action_46
action_16 _ = happyReduce_8

action_17 (20) = happyShift action_45
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (18) = happyShift action_44
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (21) = happyShift action_43
action_19 _ = happyReduce_15

action_20 (19) = happyShift action_24
action_20 (20) = happyShift action_25
action_20 (23) = happyShift action_26
action_20 (26) = happyShift action_27
action_20 (27) = happyShift action_42
action_20 (12) = happyGoto action_40
action_20 (13) = happyGoto action_41
action_20 (14) = happyGoto action_22
action_20 (15) = happyGoto action_23
action_20 _ = happyFail (happyExpListPerState 20)

action_21 _ = happyReduce_19

action_22 (22) = happyShift action_38
action_22 (23) = happyShift action_39
action_22 _ = happyReduce_22

action_23 (24) = happyShift action_36
action_23 (25) = happyShift action_37
action_23 _ = happyReduce_25

action_24 _ = happyReduce_28

action_25 (26) = happyShift action_35
action_25 _ = happyReduce_30

action_26 (19) = happyShift action_32
action_26 (20) = happyShift action_33
action_26 (26) = happyShift action_34
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (19) = happyShift action_24
action_27 (20) = happyShift action_25
action_27 (23) = happyShift action_26
action_27 (26) = happyShift action_27
action_27 (13) = happyGoto action_31
action_27 (14) = happyGoto action_22
action_27 (15) = happyGoto action_23
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (17) = happyShift action_12
action_28 (20) = happyShift action_13
action_28 (10) = happyGoto action_30
action_28 (11) = happyGoto action_11
action_28 _ = happyReduce_13

action_29 _ = happyReduce_3

action_30 _ = happyReduce_14

action_31 (27) = happyShift action_62
action_31 _ = happyFail (happyExpListPerState 31)

action_32 _ = happyReduce_29

action_33 (26) = happyShift action_61
action_33 _ = happyReduce_31

action_34 (19) = happyShift action_24
action_34 (20) = happyShift action_25
action_34 (23) = happyShift action_26
action_34 (26) = happyShift action_27
action_34 (13) = happyGoto action_60
action_34 (14) = happyGoto action_22
action_34 (15) = happyGoto action_23
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (19) = happyShift action_24
action_35 (20) = happyShift action_25
action_35 (23) = happyShift action_26
action_35 (26) = happyShift action_27
action_35 (27) = happyShift action_59
action_35 (12) = happyGoto action_58
action_35 (13) = happyGoto action_41
action_35 (14) = happyGoto action_22
action_35 (15) = happyGoto action_23
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (19) = happyShift action_24
action_36 (20) = happyShift action_25
action_36 (23) = happyShift action_26
action_36 (26) = happyShift action_27
action_36 (14) = happyGoto action_57
action_36 (15) = happyGoto action_23
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (19) = happyShift action_24
action_37 (20) = happyShift action_25
action_37 (23) = happyShift action_26
action_37 (26) = happyShift action_27
action_37 (14) = happyGoto action_56
action_37 (15) = happyGoto action_23
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (19) = happyShift action_24
action_38 (20) = happyShift action_25
action_38 (23) = happyShift action_26
action_38 (26) = happyShift action_27
action_38 (13) = happyGoto action_55
action_38 (14) = happyGoto action_22
action_38 (15) = happyGoto action_23
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (19) = happyShift action_24
action_39 (20) = happyShift action_25
action_39 (23) = happyShift action_26
action_39 (26) = happyShift action_27
action_39 (13) = happyGoto action_54
action_39 (14) = happyGoto action_22
action_39 (15) = happyGoto action_23
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (27) = happyShift action_53
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (31) = happyShift action_52
action_41 _ = happyReduce_20

action_42 _ = happyReduce_18

action_43 (19) = happyShift action_24
action_43 (20) = happyShift action_25
action_43 (23) = happyShift action_26
action_43 (26) = happyShift action_27
action_43 (13) = happyGoto action_51
action_43 (14) = happyGoto action_22
action_43 (15) = happyGoto action_23
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (26) = happyShift action_50
action_44 _ = happyFail (happyExpListPerState 44)

action_45 _ = happyReduce_10

action_46 (20) = happyShift action_17
action_46 (7) = happyGoto action_49
action_46 (8) = happyGoto action_16
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (18) = happyShift action_48
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (26) = happyShift action_71
action_48 _ = happyFail (happyExpListPerState 48)

action_49 _ = happyReduce_9

action_50 (20) = happyShift action_69
action_50 (27) = happyShift action_70
action_50 (9) = happyGoto action_68
action_50 _ = happyFail (happyExpListPerState 50)

action_51 _ = happyReduce_16

action_52 (19) = happyShift action_24
action_52 (20) = happyShift action_25
action_52 (23) = happyShift action_26
action_52 (26) = happyShift action_27
action_52 (12) = happyGoto action_67
action_52 (13) = happyGoto action_41
action_52 (14) = happyGoto action_22
action_52 (15) = happyGoto action_23
action_52 _ = happyFail (happyExpListPerState 52)

action_53 _ = happyReduce_17

action_54 _ = happyReduce_24

action_55 _ = happyReduce_23

action_56 _ = happyReduce_27

action_57 _ = happyReduce_26

action_58 (27) = happyShift action_66
action_58 _ = happyFail (happyExpListPerState 58)

action_59 _ = happyReduce_34

action_60 (27) = happyShift action_65
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (19) = happyShift action_24
action_61 (20) = happyShift action_25
action_61 (23) = happyShift action_26
action_61 (26) = happyShift action_27
action_61 (27) = happyShift action_64
action_61 (12) = happyGoto action_63
action_61 (13) = happyGoto action_41
action_61 (14) = happyGoto action_22
action_61 (15) = happyGoto action_23
action_61 _ = happyFail (happyExpListPerState 61)

action_62 _ = happyReduce_36

action_63 (27) = happyShift action_76
action_63 _ = happyFail (happyExpListPerState 63)

action_64 _ = happyReduce_35

action_65 _ = happyReduce_37

action_66 _ = happyReduce_32

action_67 _ = happyReduce_21

action_68 (27) = happyShift action_75
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (31) = happyShift action_74
action_69 _ = happyReduce_11

action_70 _ = happyReduce_4

action_71 (20) = happyShift action_69
action_71 (27) = happyShift action_73
action_71 (9) = happyGoto action_72
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (27) = happyShift action_78
action_72 _ = happyFail (happyExpListPerState 72)

action_73 _ = happyReduce_5

action_74 (20) = happyShift action_69
action_74 (9) = happyGoto action_77
action_74 _ = happyFail (happyExpListPerState 74)

action_75 _ = happyReduce_6

action_76 _ = happyReduce_33

action_77 _ = happyReduce_12

action_78 _ = happyReduce_7

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Prog [happy_var_1]
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_2  4 happyReduction_2
happyReduction_2 (HappyAbsSyn4  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (let Prog x = happy_var_2 in Prog (happy_var_1 : x)
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happyReduce 4 5 happyReduction_3
happyReduction_3 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (Func happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_4 = happyReduce 7 6 happyReduction_4
happyReduction_4 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TId happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (FuncDef (FuncName $ Id happy_var_2) [] []
	) `HappyStk` happyRest

happyReduce_5 = happyReduce 8 6 happyReduction_5
happyReduction_5 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TId happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (FuncDef (FuncName $ Id happy_var_2) happy_var_4 []
	) `HappyStk` happyRest

happyReduce_6 = happyReduce 8 6 happyReduction_6
happyReduction_6 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TId happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (FuncDef (FuncName $ Id happy_var_2) [] happy_var_7
	) `HappyStk` happyRest

happyReduce_7 = happyReduce 9 6 happyReduction_7
happyReduction_7 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TId happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (FuncDef (FuncName $ Id happy_var_2) happy_var_4 happy_var_8
	) `HappyStk` happyRest

happyReduce_8 = happySpecReduce_1  7 happyReduction_8
happyReduction_8 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 ([happy_var_1]
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  7 happyReduction_9
happyReduction_9 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1 : happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_2  8 happyReduction_10
happyReduction_10 (HappyTerminal (TId happy_var_2))
	(HappyTerminal (TId happy_var_1))
	 =  HappyAbsSyn8
		 (Arg (Type $ Id happy_var_1) (VarName $ Id happy_var_2)
	)
happyReduction_10 _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  9 happyReduction_11
happyReduction_11 (HappyTerminal (TId happy_var_1))
	 =  HappyAbsSyn9
		 ([Type $ Id happy_var_1]
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  9 happyReduction_12
happyReduction_12 (HappyAbsSyn9  happy_var_3)
	_
	(HappyTerminal (TId happy_var_1))
	 =  HappyAbsSyn9
		 ((Type $ Id happy_var_1) : happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_2  10 happyReduction_13
happyReduction_13 _
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (FuncBody [happy_var_1]
	)
happyReduction_13 _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  10 happyReduction_14
happyReduction_14 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (let FuncBody as = happy_var_3 in FuncBody (happy_var_1 : as)
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_2  11 happyReduction_15
happyReduction_15 (HappyTerminal (TId happy_var_2))
	(HappyTerminal (TId happy_var_1))
	 =  HappyAbsSyn11
		 (VarDef (Type $ Id happy_var_1) (VarName $ Id happy_var_2) Nothing
	)
happyReduction_15 _ _  = notHappyAtAll 

happyReduce_16 = happyReduce 4 11 happyReduction_16
happyReduction_16 ((HappyAbsSyn13  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TId happy_var_2)) `HappyStk`
	(HappyTerminal (TId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (VarDef (Type $ Id happy_var_1) (VarName $ Id happy_var_2) (Just happy_var_4)
	) `HappyStk` happyRest

happyReduce_17 = happyReduce 4 11 happyReduction_17
happyReduction_17 (_ `HappyStk`
	(HappyAbsSyn12  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (Call $ FuncCall (FuncName $ Id happy_var_1) happy_var_3
	) `HappyStk` happyRest

happyReduce_18 = happySpecReduce_3  11 happyReduction_18
happyReduction_18 _
	_
	(HappyTerminal (TId happy_var_1))
	 =  HappyAbsSyn11
		 (Call $ FuncCall (FuncName $ Id happy_var_1) []
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_2  11 happyReduction_19
happyReduction_19 (HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (Return happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  12 happyReduction_20
happyReduction_20 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 ([happy_var_1]
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  12 happyReduction_21
happyReduction_21 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1 : happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  13 happyReduction_22
happyReduction_22 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (Sum happy_var_1 []
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  13 happyReduction_23
happyReduction_23 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (let Sum m ms = happy_var_3 in Sum happy_var_1 ((Plus, m):ms)
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  13 happyReduction_24
happyReduction_24 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (let Sum m ms = happy_var_3 in Sum happy_var_1 ((Minus, m):ms)
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_1  14 happyReduction_25
happyReduction_25 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 (Mult happy_var_1 []
	)
happyReduction_25 _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  14 happyReduction_26
happyReduction_26 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 (let Mult t ts = happy_var_3 in Mult happy_var_1 ((Times, t):ts)
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  14 happyReduction_27
happyReduction_27 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 (let Mult t ts = happy_var_3 in Mult happy_var_1 ((Divide, t):ts)
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  15 happyReduction_28
happyReduction_28 (HappyTerminal (TInteger happy_var_1))
	 =  HappyAbsSyn15
		 (ConstTermInt happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_2  15 happyReduction_29
happyReduction_29 (HappyTerminal (TInteger happy_var_2))
	_
	 =  HappyAbsSyn15
		 (ConstTermInt (-happy_var_2)
	)
happyReduction_29 _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_1  15 happyReduction_30
happyReduction_30 (HappyTerminal (TId happy_var_1))
	 =  HappyAbsSyn15
		 (TermVar $ VarName $ Id happy_var_1
	)
happyReduction_30 _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_2  15 happyReduction_31
happyReduction_31 (HappyTerminal (TId happy_var_2))
	_
	 =  HappyAbsSyn15
		 (TermVarMinus $ VarName $ Id happy_var_2
	)
happyReduction_31 _ _  = notHappyAtAll 

happyReduce_32 = happyReduce 4 15 happyReduction_32
happyReduction_32 (_ `HappyStk`
	(HappyAbsSyn12  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (TermCall $ FuncCall (FuncName $ Id happy_var_1) happy_var_3
	) `HappyStk` happyRest

happyReduce_33 = happyReduce 5 15 happyReduction_33
happyReduction_33 (_ `HappyStk`
	(HappyAbsSyn12  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TId happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (TermCallMinus $ FuncCall (FuncName $ Id happy_var_2) happy_var_4
	) `HappyStk` happyRest

happyReduce_34 = happySpecReduce_3  15 happyReduction_34
happyReduction_34 _
	_
	(HappyTerminal (TId happy_var_1))
	 =  HappyAbsSyn15
		 (TermCall $ FuncCall (FuncName $ Id happy_var_1) []
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happyReduce 4 15 happyReduction_35
happyReduction_35 (_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TId happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (TermCallMinus $ FuncCall (FuncName $ Id happy_var_2) []
	) `HappyStk` happyRest

happyReduce_36 = happySpecReduce_3  15 happyReduction_36
happyReduction_36 _
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (TermExpr happy_var_2
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happyReduce 4 15 happyReduction_37
happyReduction_37 (_ `HappyStk`
	(HappyAbsSyn13  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (TermExprMinus happy_var_3
	) `HappyStk` happyRest

happyNewToken action sts stk [] =
	action 32 32 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TFunc -> cont 16;
	TReturn -> cont 17;
	TArrow -> cont 18;
	TInteger happy_dollar_dollar -> cont 19;
	TId happy_dollar_dollar -> cont 20;
	TSym '=' -> cont 21;
	TSym '+' -> cont 22;
	TSym '-' -> cont 23;
	TSym '*' -> cont 24;
	TSym '/' -> cont 25;
	TSym '(' -> cont 26;
	TSym ')' -> cont 27;
	TSym '{' -> cont 28;
	TSym '}' -> cont 29;
	TSym ';' -> cont 30;
	TSym ',' -> cont 31;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 32 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
synt tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


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
  | TermExprMinus Expr deriving (Show)
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}







# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4











































{-# LINE 7 "<command-line>" #-}
{-# LINE 1 "/usr/lib/ghc/include/ghcversion.h" #-}















{-# LINE 7 "<command-line>" #-}
{-# LINE 1 "/tmp/ghc8336_0/ghc_2.h" #-}
































































































































































































{-# LINE 7 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 









{-# LINE 43 "templates/GenericTemplate.hs" #-}

data Happy_IntList = HappyCons Int Happy_IntList







{-# LINE 65 "templates/GenericTemplate.hs" #-}

{-# LINE 75 "templates/GenericTemplate.hs" #-}

{-# LINE 84 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 137 "templates/GenericTemplate.hs" #-}

{-# LINE 147 "templates/GenericTemplate.hs" #-}
indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 267 "templates/GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 333 "templates/GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
