unit pyindex;

interface
  Function GetPYindexChar(str:string):string;
implementation
//******得到中文的拼音缩写的函数**************
Function GetPYindexChar(str:string):string;
var
  hzchar:string;
   n,j:integer;
begin
  for n:=0 to (length(str)div 2)-1 do
  begin
    j:=2*n+1;
    hzchar:=copy(str,j,2);
    case word(hzchar[1])shl 8 + word(hzchar[2]) of
      $B0A1..$B0C4: result :=result+'A';
      $B0C5..$B2C0: result :=result+'B';
      $B2C1..$B4ED: result :=result+'C';
      $B4EE..$B6E9: result :=result+'D';
      $B6EA..$B7A1: result :=result+'E';
      $B7A2..$B8C0: result :=result+'F';
      $B8C1..$B9FD: result :=result+'G';
      $B9FE..$BBF6: result :=result+'H';
      $BBF7..$BFA5: result :=result+'J';
      $BFA6..$C0AB: result :=result+'K';
      $C0AC..$C2E7: result :=result+'L';
      $C2E8..$C4C2: result :=result+'M';
      $C4C3..$C5B5: result :=result+'N';
      $C5B6..$C5BD: result :=result+'O';
      $C5BE..$C6D9: result :=result+'P';
      $C6DA..$C8BA: result :=result+'Q';
      $C8BB..$C8F5: result :=result+'R';
      $C8F6..$CBF9: result :=result+'S';
      $CBFA..$CDD9: result :=result+'T';
      $CDDA..$CEF3: result :=result+'W';
      $CEF4..$D1B8: result :=result+'X';
      $D1B9..$D4D0: result :=result+'Y';
      $D4D1..$D7F9: result :=result+'Z';
    else
      result:=result+char(0);
    end;
  end;
end;
end.
 