unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls,dateutils,StrUtils,Registry;

type
  TF_main = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    Label7: TLabel;
    Edit3: TEdit;
    Label8: TLabel;
    ComboBox2: TComboBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure Label10Click(Sender: TObject);
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
  re_id,max:integer;

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
  prtstr := '^XA^IA6^XZ^FS^XA^FS^BY1.5,2.5^LH20,23^FS';
  prtstr := prtstr + '^FO' + '35,15' +'^BA' + ',' + '95,N'+'^AEN^FD';        //code 93
  prtstr := prtstr +trim(map)+'^FS' ;
  prtstr := prtstr + PrtChnStr(47, 110, '黑体', 16, 2, 2, pchar('*'+map+'*'));

  prtstr := prtstr + '^PQ'+number+'^FS'; //打印1份
  prtstr := prtstr + '^PRC^FS^XZ^FS^XA^EG^XZ'; //打印结束
//
// showmessage(prtstr);
//
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
var
  registerTemp:TRegistry;
  inputstr,get_id:string;
  dy,clickedok:boolean;
begin
  DateTimePicker1.Date:=today;
  max:=60;
  dy:=false;
  //软件是否到注册期、允许使用的标志；false是允许使用。
  registerTemp:=TRegistry.Create;//准备使用注册表
  with registerTemp do
    begin
      RootKey:=HKEY_LOCAL_MACHINE; //存放在此根下
      if OpenKey('Software\Microsoft\Windows\CurrentVersion\Mark\Chery',true) then
       //建立一目录，存放标志值。当然可放在已存在的目录下。怎么样，很难发现吧？
        begin
          if valueexists('gc_id') then
            //用gc_id的值作标志，先判断存在否？
            begin
              re_id:=readinteger('gc_id');//读gc_id的值
              if (re_id<>0)and (re_id<>max) then //如为0，则已注册
                //如不到max，即虽未注册，但次数未到，可用;
                begin
                  Label11.Caption:='试用期次数还剩： '+inttostr(max-re_id-1)+' 次,  Tel:   570';
                  inc(re_id);
                  Writeinteger('gc_id',re_id);//将更新的标志值写入注册表中
                  //程序往下执行
                end;
              if (re_id=max) then
                dy:=true;
            end
          else
            Writeinteger('gc_id',1); //建立标志，置初值

        end;
      if dy then
        begin
          inputstr:='';
          clickedok:=InputQuery('注册码输入框','您使用的是非注册软件,请输入注册码:',inputstr);
          if clickedok then
            begin
              get_id:=inttostr(27583756*2);//注册码为55167512；
              if get_id=inputstr then
                begin
                  Writeinteger('gc_id',0); //注册，置值0；
                  CloseKey;
                  Free;
                end
              else //如输入的注册码错
                if inputstr='作者制作的程序真好！！！谢谢！！！' then
                  begin
                    Writeinteger('gc_id',max-1); //置值1次，可以延长有效期；
                    CloseKey;
                    Free;
                  end
                else
                  begin
                    application.MessageBox('注册码错误！请与作者联系！02552717185-570','警告框',mb_ok);
                    CloseKey;
                    Free;
                    application.Terminate;//程序中止
                  end;
            end
          else //如不输入的注册码
            begin
              application.MessageBox('您没有输入注册码！请与作者联系！02552717185-570','警告框',mb_ok);
              CloseKey;
              Free;
              application.Terminate;//程序中止
            end;
        end;
    end;

end;

procedure TF_main.BitBtn1Click(Sender: TObject);
var
  code,n,s_code:string;
  i,j,k,s_CheckDigit:integer;
  y,m,d:string;
  y_Arr:array[0..30] of char;
  m_Arr:array[0..11] of char;
  d_Arr:array[0..30] of char;
//  xy_Arr:array[0..36] of char;
begin
  y_Arr:= '123456789ABCDEFGHJKLMNPRSTVWXY';
  m_Arr:= '123456789ABC';
  d_Arr:= '123456789ABCDEFGHJKLMNPRSTUVWXY';
 // xy_Arr:='0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
 // code:=edit1.Text+combobox2.Text+edit2.Text;
 // decodedate(DateTimePicker1.Date,y,m,d);
  y:=formatdatetime('yy',DateTimePicker1.date);
  m:=formatdatetime('mm',DateTimePicker1.date);
  d:=formatdatetime('dd',DateTimePicker1.date);
  if m='01' then m:='1';
  if m='02' then m:='2';
  if m='03' then m:='3';
  if m='04' then m:='4';
  if m='05' then m:='5';
  if m='06' then m:='6';
  if m='07' then m:='7';
  if m='08' then m:='8';
  if m='09' then m:='9';
  if m='10' then m:='A';
  if m='11' then m:='B';
  if m='12' then m:='C';

  //年月日
   code:=y+m+d;
   SHOWMESSAGE(code);
  if combobox2.ItemIndex=-1 then
    begin
      showmessage('追溯件组号不能为空！！！'+#13+#13+'请重新选择追溯件组号...');
      combobox2.SetFocus
    end
  else
    begin
      code:=code+edit1.Text+ edit2.Text+ combobox2.Text;
        begin
          for k:=1 to strtoint(edit3.Text) do
            begin
              if k mod 10=0 then sleep(100);

              n:='1';  //打印数量
              printbarcode(s_code,n);   //打印
            end;
        end;
    end;
end;

procedure TF_main.ComboBox2Change(Sender: TObject);
var i,flag:integer;
begin
  flag:=0;
 edit1.text:='001';
  for i:=0 to combobox2.Items.Count-1 do
    if combobox2.Text = combobox2.Items[i] then
      begin
        flag:=1;
        if combobox2.Items[i]='8104910P1072' then
          label9.Caption:='WXH-086-F55';

      end;
    if flag<>1 then
      begin
        showmessage('请重新选择物料编码！！！');
        combobox2.ItemIndex:=-1;
        combobox2.SetFocus;
      end;
end;

procedure TF_main.Label10Click(Sender: TObject);
var
  registerTemp:TRegistry;
begin
  registerTemp:=TRegistry.Create;//准备使用注册表
  with registerTemp do
    begin
      RootKey:=HKEY_LOCAL_MACHINE; //存放在此根下
      if OpenKey('Software\Microsoft\Windows\CurrentVersion\Mark\Chery',true) then
       //建立一目录，存放标志值。当然可放在已存在的目录下。
        if valueexists('gc_id') then
          //用gc_id的值作标志，先判断存在否？
          begin
            re_id:=readinteger('gc_id');//读gc_id的值
            if (re_id=max-1) then //
                //如到max-1，可延长用;
              begin
                Writeinteger('gc_id',1); //建立标志，置初值
                application.MessageBox('软件试用期已延长！要注册请联系02552717185-570','恭喜您！',mb_ok);
                CloseKey;
                Free;
              end;
          end;

    end;
end;

end.


