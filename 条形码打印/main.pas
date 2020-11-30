unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, DB, ADODB;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    BitBtn1: TBitBtn;
    Label11: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label12: TLabel;
    Edit6: TEdit;
    RadioGroup1: TRadioGroup;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    ADOTable1: TADOTable;
    ADOQuery4: TADOQuery;
    ADOTable2: TADOTable;
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
  private
    { Private declarations }
    procedure printbarcode(var map,batch,sn,number:string);

  public
    { Public declarations }
  end;

  function GETFONTHEX(chnstr: string; fontname: string; orient: integer; height: integer; width: integer; bold: integer; italic: integer; hexbuf: string): integer; stdcall; external 'fnthex32.dll';
  function PrtChnStr(x, y: integer; fontname: string; height, xmf, ymf: integer; chnstr: string): string;

var
  Form1: TForm1;
   rq_str,shift_str:string;
   xh_flag:integer;
implementation

uses pici, changjiamingcheng, bujianmingcheng;

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

procedure TForm1.printbarcode(var map,batch,sn,number:string);
var prtstr:string;
    filehandle:integer;
begin
  prtstr := '^XA^IA6^XZ^FS^XA^FS^BY2,2^LH20,23^FS';
  prtstr := prtstr + '^FO' + '30,15' +'^BC' + ',' + '120^AEN^FD';
  prtstr := prtstr +'^SN'+trim(map)+trim(batch)+trim(shift_str)+sn+',1,Y'+'^FS' ;
  prtstr := prtstr + '^PQ'+number+'^FS'; //打印1份
  prtstr := prtstr + '^PRC^FS^XZ^FS^XA^EG^XZ'; //打印结束
  showmessage(prtstr);

  filehandle := fileopen('LPT1', fmOpenWrite);
  if filehandle > 0 then
    filewrite(filehandle, prtstr[1], length(prtstr))
  else
    showmessage('打开并口错误');
  fileclose(filehandle);
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  form2.ShowModal;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  form3.ShowModal;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  if Combobox1.ItemIndex<>-1 then
  form4.ShowModal
  else
    MessageBox(Handle,'车厂信息不能为空，请检查设置。','警告',MB_OK or MB_ICONWARNING);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.Open;
  Combobox1.Clear;
  Combobox2.Clear;
  ADOQuery1.First;
  while not ADOQuery1.eof do
    begin
      Combobox1.Items.Add(ADOQuery1.FieldByName('factory').AsString+'-'+ADOQuery1.FieldByName('factoryName').AsString);
      ADOQuery1.Next;
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ADOConnection1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source=TXM.mdb;Jet OLEDB:Database password=sqr123;Persist Security Info=False';
  try
    begin
      ADOConnection1.LoginPrompt:=false;
      ADOConnection1.Open;
      ADOTable2.tableName:='tsettings';
      ADOTable2.Active:=true;

    end;
  Except
  On E:Exception Do
    MessageBox(Handle,'数据库访问失败，请检查设置。','警告',MB_OK or MB_ICONWARNING);
  end;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
var n:integer;
  str:string;
begin
  Combobox2.Clear;
  Label4.Caption:='WXH-';
  str:=Combobox1.Text;
  n:=pos('-',str);
  ADOQuery2.Close;
  ADOQuery2.SQL.Clear;
  ADOQuery2.SQL.Add('select * from tmap where factory=');
  ADOQuery2.SQL.Add(''''+copy(str,1,n-1)+'''');
  ADOQuery2.Open;
  ADOQuery2.First;
  while not ADOQuery2.eof do
    begin
      Combobox2.Items.Add(ADOQuery2.FieldByName('mapid').AsString);
      ADOQuery2.Next;
    end;
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
var
  day:Tdate;
  y,m,d,x:word;
begin
  ADOTable1.tableName:='tmap';
  ADOTable1.Active:=true;
  if AdoTable1.Locate('mapid',Combobox2.Text,[lopartialkey]) then
    begin
      Label4.Caption:=AdoTable1.FieldValues['mapname'];
    end;
   //*****日期******
  rq_str:='';
  day:=form2.monthcalendar1.Date;
  decodedate(day,y,m,d);
  //year
  x:=y mod 10; //x:=y-(y div 10)*10;
  rq_str:=rq_str+inttostr(x);
 //nonth
  case m of
    10: rq_str:=rq_str+'0';
    11: rq_str:=rq_str+'A';
    12: rq_str:=rq_str+'B';
    else rq_str:=rq_str+inttostr(m);
  end;
  //day
  if d<10 then
    rq_str:=rq_str+'0'+inttostr(d)
  else rq_str:=rq_str+inttostr(d);

  if AdoTable2.Locate('mapid;batchno',vararrayof([Combobox2.Text,rq_str]),[lopartialkey]) then
    begin
      Edit6.Text:=AdoTable2.FieldByName('sn').AsString;
      xh_flag:=1;
    end
  else
    begin
     Edit6.Text:='1';
     xh_flag:=0;
    end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  str1,str2,str3:string;
begin
  if Combobox1.text='' then
    showmessage('请选择车厂信息！')
  else
      if Combobox2.text='' then
        showmessage('请选择图号信息！')
      else
        begin
          if MessageBox(Handle,'班次确认了么？','提示',MB_YESNO or MB_ICONwarning)=7 then
            RadioGroup1.SetFocus
          else
            begin
               //shift
              case RadioGroup1.ItemIndex of
                1: shift_str:='5';
                2: shift_str:='8';
                else shift_str:='0';
              end;
               //print
             if MessageBox(Handle,'确认打印么？','提示',MB_YESNO or MB_ICONquestion)=7 then
               Edit5.SetFocus
             else
               begin
                 str1:=combobox2.Text;
                 case length(edit6.Text) of
                   1: str2:='000'+edit6.Text;
                   2: str2:='00'+edit6.Text;
                   3: str2:='0'+edit6.Text;
                   else str2:=edit6.Text;;
                 end;
                 str3:=edit5.Text;
                 printbarcode(str1,rq_str,str2,str3);
                 //showmessage(sttr);
                 //序号计数、记忆
                 if xh_flag=1 then
                   begin
                     ADOTable2.Edit;
                     ADOTable2.fieldvalues['sn']:=inttostr(strtoint(edit6.text)+strtoint(edit5.Text));
                     ADOTable2.post;
                     Edit6.Text:=AdoTable2.FieldByName('sn').AsString;
                   end
                 else
                   begin
                     ADOTable2.Append;
                     ADOTable2.fieldvalues['mapid']:=Combobox2.Text;
                     ADOTable2.fieldvalues['batchno']:=rq_str;
                     ADOTable2.fieldvalues['sn']:=inttostr(strtoint(edit6.text)+strtoint(edit5.Text));
                     ADOTable2.post;
                     Edit6.Text:=AdoTable2.FieldByName('sn').AsString;
                   end;
               end;
            end;
        end;
end;

procedure TForm1.Edit4Change(Sender: TObject);
begin
  ComboBox2Change(Sender);
end;

procedure TForm1.Edit5Change(Sender: TObject);
begin
  if pos('.',Edit5.Text)<>0 then
    begin
      Edit5.text:='1';
      Edit5.Setfocus;
    end;
end;

end.
