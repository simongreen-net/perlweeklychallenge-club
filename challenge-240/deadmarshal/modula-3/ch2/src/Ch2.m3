MODULE Ch2 EXPORTS Main;

IMPORT IO;

VAR
  A1:ARRAY[0..5] OF INTEGER := ARRAY OF INTEGER{0,2,1,5,3,4};
  A2:ARRAY[0..5] OF INTEGER := ARRAY OF INTEGER{5,0,1,2,3,4};

PROCEDURE BuildArray(VAR A:ARRAY OF INTEGER) =
  VAR
    Ret:REF ARRAY OF INTEGER;
BEGIN
  Ret := NEW(REF ARRAY OF INTEGER,NUMBER(A));
  FOR I := FIRST(A) TO LAST(A) DO Ret[I] := A[A[I]] END;
  FOR I := FIRST(Ret^) TO LAST(Ret^) DO IO.PutInt(Ret[I]); IO.PutChar(' ') END;
  IO.Put("\n")
END BuildArray;

BEGIN
  BuildArray(A1);
  BuildArray(A2);
END Ch2.
