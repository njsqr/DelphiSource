unit UPrint;

interface

uses
  Windows,SysUtils,Graphics,ExtCtrls;
                         
Const intWidthCU=35;       //粗线和宽间隙宽度
      intWidthXI=12;       //细线和窄间隙宽度
Type
  TBCPrint=Class
  private
    strBarTable:array[0..39] of string;
    procedure InitBarTable;

  public
    procedure PrintBarCode(targetcanvas:TCanvas;BarCode:string;intXPos:integer=0;
      intYPos:integer=0;intPrintHeight:integer=20;blPrintText:longbool=true);
    Constructor Create;
  end;

implementation

Constructor TBCPrint.Create;
begin
  InitBarTable;
end;

procedure TBCPrint.InitBarTable;
begin
  strBarTable[0]:='001100100';     // 0
  strBarTable[1]:='100010100';     // 1
  strBarTable[2]:='010010100';     // 2
  strBarTable[3]:='110000100';     // 3
  strBarTable[4]:='001010100';     // 4
  strBarTable[5]:='101000100';     // 5
  strBarTable[6]:='011000100';     // 6
  strBarTable[7]:='000110100';     // 7
  strBarTable[8]:='100100100';     // 8
  strBarTable[9]:='010100100';     //9
  strBarTable[10]:='100010010';     // A
  strBarTable[11]:='010010010';     // B
  strBarTable[12]:='110000010';     // C
  strBarTable[13]:='001010010';     // D
  strBarTable[14]:='101000010';     // E
  strBarTable[15]:='011000010';     // F
  strBarTable[16]:='000110010';     // G
  strBarTable[17]:='100100010';     // H
  strBarTable[18]:='010100010';     // I
  strBarTable[19]:='001100010';     // J
  strBarTable[20]:='100010001';     // K
  strBarTable[21]:='010010001';     // L
  strBarTable[22]:='110000001';     // M
  strBarTable[23]:='001010001';     // N
  strBarTable[24]:='101000001';     // O
  strBarTable[25]:='011000001';     // P
  strBarTable[26]:='000110001';     // Q
  strBarTable[27]:='100100001';     // R
  strBarTable[28]:='010100001';     // S
  strBarTable[29]:='001100001';     // T
  strBarTable[30]:='100011000';     // U
  strBarTable[31]:='010011000';     // V
  strBarTable[32]:='110001000';     // W
  strBarTable[33]:='001011000';     // X
  strBarTable[34]:='101001000';     // Y
  strBarTable[35]:='011001000';     // Z
  strBarTable[36]:='000111000';     // -
  strBarTable[37]:='100101000';     // %
  strBarTable[38]:='010101000';     // $
  strBarTable[39]:='001101000';     // *
end;

procedure TBCPrint.PrintBarCode(targetcanvas:TCanvas;BarCode:string;intXPos:integer=0;
  intYPos:integer=0;intPrintHeight:integer=20;blPrintText:longbool=true);
var
  iloop,iloop1,iloop2,intIndex:integer;
  tmpstr:string;
  tmpchar:char;
  tmpint:integer;
begin
  SetMapMode(targetcanvas.Handle,MM_TWIPS);
  targetcanvas.Pen.Width:=1;
  targetcanvas.Font.Name:='System';
  BarCode:=UpperCase(BarCode);
  intXPos:=Round(intXPos/25.4*1440);
  intYPos:=Round(intYPos/25.4*1440);
  intPrintHeight:=Round(intPrintHeight/25.4*1440);
  //条码打印高度要减去下面的字符显示高度
  if blPrintText then
  begin
    tmpint:=targetcanvas.TextHeight(BarCode);
    intPrintHeight:=intPrintHeight-tmpint;
  end;
  if Copy(BarCode,1,1)<>'*' then BarCode:='*'+BarCode;  //添加起始字符
  if Copy(BarCode,strlen(PChar(BarCode)),1)<>'*' then BarCode:=BarCode+'*';   //添加结束字符
  for iloop:=1 to strlen(PChar(BarCode)) do
  begin
    tmpstr:=Copy(BarCode,iloop,1);
    tmpchar:=tmpstr[1];
    Case Ord(tmpchar) of      //确定当前字符在 strBarTable 中的索引
    $2a:intIndex:=39;
    $24:intIndex:=38;
    $25:intIndex:=37;
    $2d:intIndex:=36;
    $30..$39:intIndex:=strtoint(Copy(BarCode,iloop,1));
    $41..$5a:intIndex:=Ord(tmpchar)-Ord('A')+10;
    else exit;
    end;
    //是否在条形码下方打印人工识别字符
    if blPrintText then  targetcanvas.TextOut(intXPos,intYPos-intPrintHeight,Copy(BarCode,iloop,1));
    for iloop1:=1 to 5 do
    begin
      if Copy(strBarTable[intIndex],iloop1,1)='0' then    //画细线
      begin
        for iloop2:=0 to intWidthXI-1 do
        begin
          targetcanvas.MoveTo(intXPos+iloop2,0-intYPos);
          targetcanvas.LineTo(intXPos+iloop2,0-intPrintHeight);
        end;
        intXPos:=intXPos+intWidthXI;
      end
      Else
      begin                                             //画宽线
        for iloop2:=0 to intWidthCU-1 do
        begin
          targetcanvas.MoveTo(intXPos+iloop2,0-intYPos);
          targetcanvas.LineTo(intXPos+iloop2,0-intPrintHeight);
        end;
        intXPos:=intXPos+intWidthCU;
      end;
      if iloop1=5 then                                   //每个字符条码之间为窄间隙
      begin
        intXPos:=intXPos+intWidthXI*3-10;
        break;
      end;
      if Copy(strBarTable[intIndex],iloop1+5,1)='0' then   //窄间隙
        intXPos:=intXPos+intWidthXI*3-10
      else                                                  //宽间隙
        intXPos:=intXPos+intWidthCU*2-20;
    end;
  end;
end;

end.
