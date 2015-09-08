(* Mathematica Package *)

BeginPackage["ProtectedSymbols`"]
(* Exported symbols added here with SymbolName::usage *)  
t::usage="symbol for time in models"
eps::usage="symbol for stochastic variables in models"
eqvdIf::usage="eqvdif placeholder for EquationValDrv in substitutions";


myN::usage="myN[xx_]:=(N[xx/.{t-1->$tm1,t+1->$tp1}])/.{$tm1->t-1,$tp1->t+1}"

Protect[t,eps,eqvdIf,myN]
makeProtectedSymbol::usage="makeProtectedSymbol[symbName_String]  no context paths allowed"
Begin["`Private`"] (* Begin Private Context *) 
Unprotect[myN]
myN[xx_]:=(N[xx/.{t-1->$tm1,t+1->$tp1}])/.{$tm1->t-1,$tp1->t+1}
Protect[myN]

makeProtectedSymbol[symbName_String]:=
With[{symb=ToExpression["ProtectedSymbols`"<>symbName]},Protect[symb];symb]/;StringFreeQ[symbName,"`"];
makeProtectedSymbol[___]:=Print[makeProtectedSymbol::usage]

End[] (* End Private Context *)

EndPackage[]
