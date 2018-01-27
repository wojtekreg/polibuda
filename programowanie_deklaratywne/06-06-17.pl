rozbij(0,[]):-!.
rozbij(X1,Lwy):-H is X1 mod 10, X2 is X1 div 10, rozbij(X2,T), append(T,[H],Lwy).

monotoniczne([X],[X]):-!.
monotoniczne([X1,X2],[X1,X2]):-X2>X1,!.
monotoniczne([X1,_],[X1]):-!.
monotoniczne([X1,X2|T1],[X1|T2]):-X2>X1,!,monotoniczne([X2|T1],T2).
monotoniczne([X1,_,X3|T1],[X1|T2]):-monotoniczne([X3|T1],T2).

polacz([],0):-!.
polacz([H1|T1],Res):-polacz(T1,Subres),length(T1,Dlugosc),Res is Subres+(H1*(10^Dlugosc)).

wstaw(X,[],[X]):-!.
wstaw(X,[H1|T1],[X,H1|T1]):-klucz(X,W1),klucz(H1,W2),W1=<W2,!.
wstaw(X,[H1|T1],[H1|T2]):-wstaw(X,T1,T2).

wstawSort([],[]):-!.
wstawSort([H1|T1],Result):-wstawSort(T1,Subres),wstaw(H1,Subres,Result).

klucz(Lwe,Klucz):-rozbij(Lwe,Lroz),monotoniczne(Lroz,Lmon),polacz(Lmon,Klucz).