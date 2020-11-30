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
  prtstr := prtstr + '^PQ1^FS'; //��ӡ1��
  prtstr := prtstr + '^PRC^FS^XZ^FS^XA^EG^XZ'; //��ӡ����
  Memo1.lines.clear;
  Memo1.lines.Add(prtstr);
end;

{//* ^FDBL0000^SFAAdddd,1
  ע��
The print sequence on this series of labels is:
BL0000, BL0001,...BL0009, BL0010,... 
BL0099, BL0100,...BL9999, BM0000... 

^FDBL00-0^SFAAdd%d,1%1
 ע��
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
 ע��                           ��ߣ�

 PrtChnStr(10, 140, pchar(cbx2.Text), 14, 1, 2, pchar(Leftstr(Edit2.Text, 18)));
 ע��     x�ᣬy�ᣬ ����        ���ֺ�,�Ӵ�,�Ӵ�      �ַ���         ����ӡλ����

 ˵˵�й��ڰ��������ӡ��ZPL������Ը����ʹ�ðɣ�������ȸ�����ʵ����
 ^XA          ע��һ����ǩ�Ѿ�׼����
 ^LH50,30     ע������һ����ǩ�Ĵ�ӡԭ�㼴���ǩ��߾�Ϊ50DOT���ϱ߾�30DOT
 ^FO40,30^AD^FDZEBRA^FS
 ע�� ^FO40,30���þ��ӡԭ��Ϊ40��30�Ĵ�ӡλ�á�^ADѡ���ӡ����
          ^FDTEST��ӡ������ΪTEST��^FS���ֶδ�ӡ����
 ^FO70,60^B3^FDAAA001^FS
 ע��^B3��ѡ���ӡ�������ͣ�B3����Code 39�룬����ΪABC123
^XZ     ע��������ӡ����

�����ϵ�COPY��һ���ı��ĵ���TEST.TXT�ļ��ٽ���CMD���� print TEST.TXT ���� copy TEST.TXT  LPT1�Ϳ����� ��LPT1��ʾ���ڣ������Ҵ˷����������ڲ������д�ZPL���Ա�̵İ����ӡ����ӡ�˿��Ƿ�������ͨѶ


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
    showmessage('�򿪲��ڴ���');
  fileclose(filehandle);
end;

end.

