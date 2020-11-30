unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, strutils;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    cbx1: TComboBox;
    Edit2: TEdit;
    cbx2: TComboBox;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
function GETFONTHEX(chnstr: string; fontname: string; orient: integer; height: integer; width: integer; bold: integer; italic: integer; hexbuf: string): integer; stdcall; external 'fnthex32.dll';
function PrtChnStr(x, y: integer; fontname: string; height, xmf, ymf: integer; chnstr: string): string;

var
  Form1: TForm1;

implementation

{$R *.dfm}
function PrtChnStr(x, y: integer; fontname: string; height, xmf, ymf: integer; chnstr: string): string;
var
  buf, ret: string;
  count: integer;
begin
  result := '';
  setlength(buf, 21 * 1024);
  count := GETFONTHEX(chnstr, fontname, 0, height, 0, 1, 0, buf);
  if count > 0 then
  begin
    ret := Copy(buf, 1, count);
    result := ret + '^FO' + inttostr(x) + ',' + inttostr(y) + '^XGOUTSTR01,' + inttostr(xmf) + ',' + inttostr(ymf) + '^FS';
  end;
end;


procedure TForm1.Button1Click(Sender: TObject);
var
  prtstr, code: string;
begin
  if cbx1.Text = 'Code 11' then
    code := '^B1'
  else if cbx1.Text = 'Code 39' then
    code := '^B3'
  else if cbx1.Text = 'Code 49' then
    code := '^B4'
  else if cbx1.Text = 'Code 93' then
    code := '^BA'
  else if cbx1.Text = 'Code 128' then
    code := '^BC'
  else if cbx1.Text = 'EAN-8' then
    code := '^B8';
  prtstr := '^XA^IA6^XZ^FS^XA^FS^BY2,2^LH20,23^FS';
  prtstr := prtstr + '^FO' + '30,25' + code + ',' + '120^AEN^FD' + trim(Edit1.Text) + '^FS';
  prtstr := prtstr + PrtChnStr(10, 140, pchar(cbx2.Text), 14, 1, 2, pchar(Leftstr(Edit2.Text, 18)));
  prtstr := prtstr + '^PQ1^FS'; //打印1份
  prtstr := prtstr + '^PRC^FS^XZ^FS^XA^EG^XZ'; //打印结束
  Memo1.lines.clear;
  Memo1.lines.Add(prtstr);
end;

{//* ^FDBL0000^SFAAdddd,1
  注：
The print sequence on this series of labels is:
BL0000, BL0001,...BL0009, BL0010,... 
BL0099, BL0100,...BL9999, BM0000... 

^FDBL00-0^SFAAdd%d,1%1
 注：
The print sequence on this series of labels is: 
BL00-0, BL01-1, BL02-2,...BL09-9, 
BL11-0, BL12-1... 

   D or d ? Decimal numeric 0?9
   H or h ? Hexadecimal 0?9 plus a-f or A-F
   O or o ? Octal 0?7
   A or a ? Alphabetic a?z or A?Z
   N or n ? Alphanumeric 0?9 plus a?z or A?Z
        % ? Ignore character or skip 


 '^FO' + '30,25' + code + ',' + '170^FD' + trim(Edit1.Text) + '^FS';
 注：                           码高，

 PrtChnStr(10, 140, pchar(cbx2.Text), 14, 1, 2, pchar(Leftstr(Edit2.Text, 18)));
 注：     x轴，y轴， 字体        ，字号,加粗,加大，      字符串         ，打印位数；

 说说有关于斑马条码打印机ZPL编程语言该如何使用吧，下面就先给个简单实例：
 ^XA          注：一个标签已经准备好
 ^LH50,30     注：设置一个标签的打印原点即距标签左边距为50DOT，上边距30DOT
 ^FO40,30^AD^FDZEBRA^FS
 注： ^FO40,30设置距打印原点为40，30的打印位置。^AD选择打印字体
          ^FDTEST打印的内容为TEST，^FS该字段打印结束
 ^FO70,60^B3^FDAAA001^FS
 注：^B3，选择打印条码类型，B3代表Code 39码，内容为ABC123
^XZ     注：表明打印结束

把以上的COPY成一个文本文档如TEST.TXT文件再进入CMD输入 print TEST.TXT 或者 copy TEST.TXT  LPT1就可以了 （LPT1表示并口），而且此方法可适用于测试所有带ZPL语言编程的斑马打印机打印端口是否能正常通讯


}

procedure TForm1.Button2Click(Sender: TObject);
var
  prtstr: string;
  filehandle: integer;
begin
  prtstr := Memo1.Text;
  filehandle := fileopen('LPT1', fmOpenWrite);
  if filehandle > 0 then
    filewrite(filehandle, prtstr[1], length(prtstr))
  else
    showmessage('打开并口错误');
  fileclose(filehandle);
end;

end.

