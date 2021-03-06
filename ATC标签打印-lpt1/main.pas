unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB, ADODB,dateutils;

type
  TFrm_main = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    s1: TMenuItem;
    c1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    F11: TMenuItem;
    N6: TMenuItem;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    ComboBox1: TComboBox;
    Label10: TLabel;
    Label11: TLabel;
    Image1: TImage;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    ADOQuery1: TADOQuery;
    Edit1: TEdit;
    Label16: TLabel;
    DateTimePicker1: TDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N5Click(Sender: TObject);
    procedure F11Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }

    procedure printbarcode(var number:string);

  public
    { Public declarations }
  end;

  function GETFONTHEX(chnstr: string; fontname: string; orient: integer; height: integer; width: integer; bold: integer; italic: integer; hexbuf: string): integer; stdcall; external 'fnthex32.dll';
  function PrtChnStr(x, y: integer; fontname: string; height, xmf, ymf: integer; chnstr: string): string;

var
  Frm_main: TFrm_main;

implementation

uses wl;

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

procedure TFrm_main.printbarcode(var number:string);
var prtstr:string;
    filehandle:integer;
begin
  prtstr := '^XA^IA6^XZ^FS^XA^FS^BY3,2^LH5,20^FS';
   //prtstr := prtstr + '^FO' + '170,40' +'^BA' + ',' + '110,N^FD';
  prtstr := prtstr +'$'+trim(Combobox1.Text)+'^FS' ;
  prtstr := prtstr + PrtChnStr(35, 70, '黑体', 25, 2, 3, '产品型号：');
  prtstr := prtstr + PrtChnStr(300, 45, '黑体', 40, 2, 3, pchar(Combobox1.Text));
  prtstr := prtstr + PrtChnStr(35, 200, '黑体', 25, 2, 3, '适用车型：');
  prtstr := prtstr + PrtChnStr(300, 215, '黑体', 15, 2, 3, pchar(Label9.Caption));
 // prtstr := prtstr + PrtChnStr(1, 275, '黑体', 23, 2, 2, '供应商：');
 // prtstr := prtstr + '^FO' + '170,260' +'^BA' + ',' + '110,N^FD';
 // prtstr := prtstr +'34443-'+trim(Edit2.Text)+'^FS' ;
 // prtstr := prtstr + PrtChnStr(30, 370, '黑体', 23, 2, 2,datetostr(DateTimePicker1.Date)+' 34443-'+Edit2.Text);
  prtstr := prtstr + '^PQ'+number+'^FS'; //打印1份
  prtstr := prtstr + '^PRC^FS^XZ^FS^XA^EG^XZ'; //打印结束
 // showmessage(prtstr);

  filehandle := fileopen('LPT1', fmOpenWrite);
  if filehandle > 0 then
    filewrite(filehandle, prtstr[1], length(prtstr))
  else
    showmessage('打开并口错误');
  fileclose(filehandle);
end;

procedure TFrm_main.FormCreate(Sender: TObject);
begin
  ADOConnection1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source=TXM.mdb;Jet OLEDB:Database password=sqr123;Persist Security Info=False';
  try
    begin
      ADOConnection1.LoginPrompt:=false;
      ADOConnection1.Open;
      ADOTable1.Connection:=ADOConnection1;
      ADOTable1.tableName:='tmap';
      ADOTable1.Active:=true;
      ADOQuery1.Connection:=ADOConnection1;

    end;
  Except
  On E:Exception Do
    MessageBox(Handle,'数据库访问失败，请检查设置。','警告',MB_OK or MB_ICONWARNING);
  end;
end;

procedure TFrm_main.N3Click(Sender: TObject);
begin
  frm_wl.ShowModal;
end;

procedure TFrm_main.FormShow(Sender: TObject);
begin
  DateTimePicker1.Date:=Today;
  ADOQuery1.Close;
  ADOQuery1.Open;
  Combobox1.Clear;
  ADOQuery1.First;
  while not ADOQuery1.eof do
    begin
      Combobox1.Items.Add(ADOQuery1.FieldByName('mapid').AsString);
      ADOQuery1.Next;
    end;
   Combobox1.SetFocus;
end;

procedure TFrm_main.ComboBox1Change(Sender: TObject);
begin
  AdoTable1.Close;
  AdoTable1.Open;
  if AdoTable1.Locate('mapid',Combobox1.Text,[lopartialkey]) then
    Label9.Caption:=AdoTable1.FieldValues['mapname']
  else
    Label9.Caption:='';
end;

procedure TFrm_main.Edit1Change(Sender: TObject);
var n:integer;
begin
  n:=strtointdef(Edit1.Text,MAXINT);
  if n=MAXINT then
    begin
      Edit1.text:='';
      Edit1.Setfocus;
    end;
end;

procedure TFrm_main.BitBtn1Click(Sender: TObject);
var n:string;
begin
  if Combobox1.text='' then
    showmessage('请选择-物料件号！')
  else
    if Edit1.text='' then
      showmessage('请输入-打印数量！')
    else
      begin
        n:=edit1.Text;
        printbarcode(n);
      end;
end;

procedure TFrm_main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  N5Click(Sender);
end;

procedure TFrm_main.N5Click(Sender: TObject);
begin
  if MessageDlg('确认要退出本系统吗吗？',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
     Application.terminate;
  end;
end;

procedure TFrm_main.F11Click(Sender: TObject);
begin
  Application.HelpFile:='HELP.HLP';     //Trim(ExtractFilePath(Application.ExeName))+
  Application.HelpCommand(help_finder,0) ;
end;

procedure TFrm_main.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_F1	 then
    f11Click(Sender);
end;

end.
