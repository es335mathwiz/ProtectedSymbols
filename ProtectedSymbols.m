(* Mathematica Package *)

BeginPackage["ProtectedSymbols`"]
(* Exported symbols added here with SymbolName::usage *)  
t::usage="symbol for time in models"
eps::usage="symbol for stochastic variables in models"
eqvdIf::usage="eqvdif placeholder for EquationValDrv in substitutions";
e::usage="symbol for Format`"
xx::usage="variable for polynomials xx[nn]"
mom::usage="raw moments of errors for polynomials xx[ii], cum[ii,kk]"
NA::usage="NA for getVarDataNAs in "

myN::usage="myN[xx_]:=(N[xx/.{t-1->$tm1,t+1->$tp1}])/.{$tm1->t-1,$tp1->t+1}"
NA::usage="Na for emscsToMma.m"

sss::usage="s for contDisc calculations"    
zzz::usage="z for contDisc calculations"    
zzzInv::usage="z for contDisc calculations"    
hhh::usage="h for contDisc calculations"    


Protect[t,eps,eqvdIf,myN,e,xx,cum,NA,sss,zzz,zzzInv,hhh]
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
