unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls,dateutils;

type
  TF_main = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    RadioGroup1: TRadioGroup;
    Label6: TLabel;
    ComboBox1: TComboBox;
    Edit5: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    RadioGroup2: TRadioGroup;
    Edit4: TEdit;
    Label7: TLabel;
    Edit3: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure printbarcode(var map,number:string);

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

procedure TF_main.printbarcode(var map,number:string);
var prtstr:string;
    filehandle:integer;
begin
  prtstr := '^XA^IA6^XZ^FS^XA^FS^BY2,2^LH20,23^FS';
  prtstr := prtstr + '^FO' + '40,10' +'^BC' + ',' + '120^AEN^FD';
  prtstr := prtstr +trim(map)+'^FS' ;
  prtstr := prtstr + '^PQ'+number+'^FS'; //打印1份
  prtstr := prtstr + '^PRC^FS^XZ^FS^XA^EG^XZ'; //打印结束
  //showmessage(prtstr);

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

procedure TF_main.FormCreate(Sender: TObject);
begin
  DateTimePicker1.Date:=today;
  edit4.Text:='0';
  edit4.ReadOnly:=true;
end;

procedure TF_main.RadioGroup2Click(Sender: TObject);
begin
  if RadioGroup2.ItemIndex=1 then
    begin
      edit4.ReadOnly :=false;
      edit4.SetFocus;
      if trim(edit4.Text)='0' then
        begin
          showmessage('返修次数应该大于零！！！');
          edit4.SetFocus;
        end;
    end
  else
    begin
      edit4.text:='0';
      edit4.ReadOnly :=true;
    end;
end;

procedure TF_main.BitBtn1Click(Sender: TObject);
var
  code,n:string;
  y,m,d:word;
  y_Arr:array[0..32] of char;
  m_Arr:array[0..11] of char;
  d_Arr:array[0..30] of char;
  xy_Arr:array[0..41] of char;  //图纸版本号
begin
   //DATA MARTIX   11X11MM
   //7位图纸零件号+1位图纸版本号(xy-code)+3位厂家代码"9DB"+3位年月日
   //+ 1位厂部代码"0“+1位班次”ABC”+4位流水号“0001”
  y_Arr:= 'XY123456789ABCDEFGHJKLMNPRSTVWXY';
  m_Arr:= 'ABCDEFGHJKLM';
  d_Arr:= '1234567890ABCDEFGHJKLMNPRSTVWXY';
  xy_Arr:='0123456789ABCDEFGHJKLMNPRSTUWXYZabdefghnqt';
  code:='BW010BC';
  code:=code+xy_arr[1]+'9DB';
  decodedate(DateTimePicker1.Date,y,m,d);
  //年月日
  code:=code+y_Arr[y-1999]+m_Arr[m-1]+d_Arr[d-1];
  if combobox1.ItemIndex=-1 then
    begin
      showmessage('零件号不能为空！！！'+#13+#13+'请重新选择零件代号...');
      combobox1.SetFocus
    end
  else
    begin
      if (MessageBox(Handle,'生产班次确认了么？','提示',MB_YESNO or MB_ICONwarning)=7) then
        Combobox1.SetFocus
      else
        begin
          //code:=code+combobox1.Text;  //车间
           //shift 班次
          case RadioGroup1.ItemIndex of
            1: code:=code+'B';
            2: code:=code+'C';
            else code:=code+'A';
          end;
          
          //返工码
          code:=code+edit4.Text;
          if MessageBox(Handle,'确认打印么？','提示',MB_YESNO or MB_ICONquestion)=7 then
             Combobox1.SetFocus
          else
            begin
              n:=edit3.Text;  //打印数量
              printbarcode(code,n);   //打印
            end;
        end;
    end;
end;

procedure TF_main.ComboBox1Change(Sender: TObject);
var i,flag:integer;
begin
  flag:=0;
  for i:=0 to combobox1.Items.Count-1 do
    if combobox1.Text = combobox1.Items[i] then
      flag:=1;
    if flag<>1 then
      begin
        showmessage('请重新选择车间代号！！');
        combobox1.ItemIndex:=-1;
        combobox1.SetFocus;
      end;
end;

procedure TF_main.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in['0'..'9','.',#8]) then
    begin
      key:=#0;
      messagebeep(1);
    end;
end;

end.


