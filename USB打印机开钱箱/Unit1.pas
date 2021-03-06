unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,printers, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    PortEdit: TEdit;
    Button3: TButton;
    Button4: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TOutBufPassThrough = record
    nDataLen:word;
    sEscData:array [0..1024] of char;
  end;
  //调用windows.extEscape可以直接用extEscape(handle, PASSTHROUGH, sizeOf(outBuf), @outBuf, 0, nil)向设备发送esc命令


var
  Form1: TForm1;
  function setqx(szl:string):string;


implementation

{$R *.dfm}

function PrintOut(stext:string;sportname:string='LPT1'):boolean;
var filehandle:integer;
    tf:Textfile;
begin
  //showmessage('打印:'+stext);


  result:=false;
  filehandle:=fileopen(sportname,fmopenwrite);
  fileclose(filehandle);
  if filehandle>0 then
  begin
    try
      assignfile(tf,sportname);
      rewrite(tf);
      write(tf,stext);
      closefile(tf);
      result:=true;
    except
      on e:exception do
      begin
        showmessage('打印错误！'+e.Message);
        exit;
      end;
    end;
  end;
 
end;


function setqx(szl:string):string;
var s,str:string;
     sa:array[0..8] of string;
   len,i:integer;
begin
  s := szl;
  i:=0;
  while length(s)>0 do
  begin
    if pos(',',s)<>0 then
       sa[i]:=copy(s,1,pos(',',s)-1)
    else
    begin
       sa[i]:=s;
       break;
    end;
    s:=trim(copy(s,pos(',',s)+1,length(s)));
    i:=i+1;
  end;
  try str:=char(strtoint(sa[0]))   ;
  except
     str := ' ';
  end;
  for i:=1 to 7 do
  begin
    if sa[i]='' then break;
      str:=str+char(strtoint(sa[i]))  ;
  end;
  result:=str;
end;

/////////////////////////
procedure TForm1.Button1Click(Sender: TObject);
begin
    printer.begindoc;
    printer.enddoc;

end;

procedure TForm1.Button2Click(Sender: TObject);
var sMoneyBoxOpenCommand:string;
    prt:TPrinter;
    esc:TOutBufPassThrough;
begin
  if RadioButton1.Checked then
  begin
    sMoneyBoxOpenCommand:=setqx('27,112,0,128,128');
  end
  else
  begin
    sMoneyBoxOpenCommand:=#27+#112+#0+#128+#128;
  end;


  try    //驱动开
      prt:=printers.Printer;
      prt.beginDoc;               //没办法，必须的
      esc.nDataLen:=length(sMoneyBoxOpenCommand);
      strpCopy(esc.sEscData, sMoneyBoxOpenCommand);
      windows.ExtEscape(prt.Handle, PASSTHROUGH, sizeOf(esc), @esc, 0, nil);  ////PASSTHROUGH：允许程序直接发送数据到设备
      prt.endDoc;       //这里会导致打印机走一小段纸，也没找到好办法
  except
      on x:Exception do ;
  end;

end;

procedure TForm1.Button3Click(Sender: TObject);
var  sldata1:Tstringlist;
begin
  sldata1 := Tstringlist.Create;
  slData1.add('----');
  slData1.add('测试打印');
  slData1.add('====');
  PrintOut(sldata1.text,trim(PortEdit.Text));
  sldata1.Free;
end;

procedure TForm1.Button4Click(Sender: TObject);
var scashboxzl:string;
begin
    scashboxzl:=#27+#112+#0+#128+#128;

    PrintOut(scashboxzl,trim(PortEdit.Text));

end;

end.
