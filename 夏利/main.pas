unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls,dateutils;

type
  TF_main = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label7: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure printbarcode(var map,number,dis:string);

  public
    { Public declarations }
  end;

  function GETFONTHEX(chnstr: string; fontname: string; orient: integer; height: integer; width: integer; bold: integer; italic: integer; hexbuf: string): integer; stdcall; external 'fnthex32.dll';
  function PrtChnStr(x, y: integer; fontname: string; height, xmf, ymf: integer; chnstr: string): string;


var
  F_main: TF_main;

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

procedure TF_main.printbarcode(var map,number,dis:string);
var prtstr:string;
    filehandle:integer;
begin
  prtstr := '^XA^IA6^XZ^FS^XA^FS^BY4.5,3,200^LH10,23^FS';
  prtstr := prtstr + '^FO' + inttostr(strtoint(dis))+',30' +'^AGR,250,250'+'^FDB^FS';
  prtstr := prtstr + '^FO' + inttostr(strtoint(dis)+40)+',350' +'^B3R,N,,Y'+'^AEN^FD';
  prtstr := prtstr +TRIM(MAP)+'^FS' ;
  prtstr := prtstr + '^PQ'+number+'^FS'; //打印1份
  prtstr := prtstr + '^PRC^FS^XZ^FS^XA^EG^XZ'; //打印结束
  

  filehandle := fileopen('LPT1', fmOpenWrite);
  if filehandle > 0 then
    filewrite(filehandle, prtstr[1], length(prtstr))
  else
    showmessage('打开并口错误');
  fileclose(filehandle);
end;

procedure TF_main.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TF_main.BitBtn1Click(Sender: TObject);
var
  code,n,di:string;
begin
    code:='LL1784322';
    di:=inttostr(strtoint(edit2.Text)*8);
    if strtoint(edit3.Text)=0 then
      n:='1'
    else
      n:=inttostr(strtoint(edit3.Text));
    printbarcode(code,n,di);   //打印
end;

procedure TF_main.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9',#8]) then
    begin
      key:=#0;
      messagebeep(1);
    end;
end;

procedure TF_main.FormShow(Sender: TObject);
begin
  edit3.SetFocus; 
end;

end.


