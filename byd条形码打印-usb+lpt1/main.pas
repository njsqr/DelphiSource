unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB, ADODB,dateutils,
  printers,winspool;

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
    RadioGroup1: TRadioGroup;
    CheckBox1: TCheckBox;
    Edit2: TEdit;
    Label5: TLabel;
    Label8: TLabel;
    PrintDialog1: TPrintDialog;
    Edit3: TEdit;
    Edit4: TEdit;
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
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
  private
    { Private declarations }

    procedure printbarcode(var map,number:string);

  public
    { Public declarations }
  end;

  function GETFONTHEX(chnstr: string; fontname: string; orient: integer; height: integer; width: integer; bold: integer; italic: integer; hexbuf: string): integer; stdcall; external 'fnthex32.dll';
  function PrtChnStr(x, y: integer; fontname: string; height, xmf, ymf: integer; chnstr: string): string;

var
  Frm_main: TFrm_main;
  portflag:integer;

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

procedure WriteRawStringToPrinter(PrinterName:String; S:String);       // 用到uses winspool,printers
var  Handle: THandle;                                                //usb打印模块
  N: DWORD;
  DocInfo1: TDocInfo1;
begin
  if not OpenPrinter(PChar(PrinterName), Handle, nil) then
  begin
    ShowMessage('error ' + IntToStr(GetLastError));
    Exit;
  end;
  with DocInfo1 do begin
   pDocName := PChar('sqr'); {在打印列表中显示的打印内容}
    pOutputFile := nil;
    pDataType := 'RAW';            {关键数据类型必须是RAW这样打印机通过驱动程序
才能识别ZPL语言} 
  end;
  StartDocPrinter(Handle, 1, @DocInfo1); 
  StartPagePrinter(Handle);
  WritePrinter(Handle, PChar(S), Length(S), N); 
  EndPagePrinter(Handle); 
  EndDocPrinter(Handle);
  ClosePrinter(Handle);
end;


procedure TFrm_main.printbarcode(var map,number:string);
var prtstr:string;
    filehandle:integer;
begin
  prtstr := '^XA^IA6^XZ^FS^XA^FS^BY2,2^LH20,23^FS';
  prtstr := prtstr + '^FO' + '25,40' +'^BC' + ',' + '140^AEN^FD';   //128code
  prtstr := prtstr +'^SN'+trim(map)+',,Y^FS' ;
  prtstr := prtstr + '^PQ'+number+'^FS'; //打印1份
  prtstr := prtstr + '^PRC^FS^XZ^FS^XA^EG^XZ'; //打印结束
  //showmessage(prtstr);
  if portflag=1 then        //usb打印
    WriteRawStringToPrinter(edit3.Text, prtstr)
  else
    if portflag=2 then      //并口lpt1打印
      begin
        filehandle := fileopen('LPT1', fmOpenWrite);
        if filehandle > 0 then
          filewrite(filehandle, prtstr[1], length(prtstr))
        else
          begin
            portflag:=0;
            showmessage('打开并口错误！');
          end;
          fileclose(filehandle);
      end
    else
      showmessage('请选择打印机，打印出现错误！');
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
  portflag:=0;          //端口初始化
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

end;

procedure TFrm_main.ComboBox1Change(Sender: TObject);
begin
  AdoTable1.Close;
  AdoTable1.Open;
  if AdoTable1.Locate('mapid',Combobox1.Text,[lopartialkey]) then
    begin
      Label9.Caption:=AdoTable1.FieldValues['mapname'];
      edit2.Text:=AdoTable1.FieldValues['yesterday'];
      edit4.Text:=AdoTable1.FieldValues['today'];
      if checkbox1.Checked=true then
        begin
          edit2.Visible:=true;
          edit4.Visible:=false;
          DateTimePicker1.Date:=Yesterday;              //大夜班是上一天班
          label3.Caption:='昨天：';
        end
      else
        begin
          edit2.Visible:=false;
          edit4.Visible:=true;
          DateTimePicker1.Date:=Today;              //大夜班是上一天班
          label3.Caption:='今天：';
        end;
    end
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

function replacing(source:string):string;
begin
   if  length(source)<10 then
     source:=copy(source,1,4)
   else
     source:=copy(source,9,4);
   if copy(source,2,1)='0' then
     begin
       delete(source,2,1);
       insert('a',source,2);
     end;
   replacing:=source;
end;

procedure TFrm_main.BitBtn1Click(Sender: TObject);
var code,num,str,str1,str2:string;
  y,m,d,flag:word;
  dateflag:integer;
  m_Arr:array[0..11] of char;
begin
  dateflag:=0;
  m_Arr:= '1234567890AB';
  if combobox1.Text='' then
    begin
      showmessage('压缩机型号不能为空！！！'+#13+#13+'请重新选择压缩机型号...');
      combobox1.SetFocus
    end
  else
    begin
      code:=label9.Caption ;
      if (MessageBox(Handle,'班次及是否是大夜班确认了么？','提示',MB_YESNO or MB_ICONwarning)=7) then
        //datetimepicker1.SetFocus
        radiogroup1.SetFocus
      else
        begin

          decodedate(DateTimePicker1.Date,y,m,d);
            //分解年、月、日
          flag:=y-(y div 10)*10;
          code:=code+inttostr(flag)+m_Arr[m-1]+Format('%.2d',[d]);
               //shift 班次
          case RadioGroup1.ItemIndex of
            1: code:=code+'B';
            2: code:=code+'C';
            else code:=code+'A';
          end;
          //序列号    //deteflag为 1：昨天， 2今天， 3昨天今天，4昨天与今天换
          str1:=copy(edit2.Text,6,4);
          str2:=copy(edit4.Text,6,4);
          case AnsiCompareStr(replacing(code),replacing(edit2.Text))of
            -1: begin                                                      //打印日期小于昨天
                  showmessage('此日期，可能有重号的条形码！！！');
                  exit;
                end;
            0:  begin                                  //打印日期小于昨天
                  dateflag:=1;    //昨天小于今天
                  str:=str1;
                  if AnsiCompareStr(replacing(edit2.Text),replacing(edit4.Text))=0 then   //昨天等于今天
                    dateflag:=3;
                end;
            else                                                          //打印日期大于昨天
                begin
                  if AnsiCompareStr(replacing(code),replacing(edit4.Text))<0 then    //打印日期小于今天
                    begin
                      dateflag:=1;                                //deteflag为 1：昨天， 2今天， 3昨天今天，4昨天与今天换后写今天
                      str:='0';
                    end
                  else
                    if AnsiCompareStr(replacing(code),replacing(edit4.Text))=0 then  //打印日期等于今天
                      begin
                        str:=str2;
                        dateflag:=2;
                      end
                    else                 //打印日期大于今天
                      begin
                        str:='0';
                        dateflag:=4;
                      end;

                end;
          end;  //case的end；
          //----
          code:=code+Format('%.4d', [strtoint(str)+1]);             //序列号
          if MessageBox(Handle,'确认打印么？','提示',MB_YESNO or MB_ICONquestion)=7 then
             Combobox1.SetFocus
          else
            begin
              num:=edit1.Text;  //打印数量
              printbarcode(code,num);   //打印


              //-------以下是要记忆最后的序列号
              if (portflag<>0)and(dateflag<>0) then
                begin                          //deteflag为 1：改昨天， 2改今天， 3改昨天和今天，4昨天与今天换后，改写今天
                 // str2:=copy(code,9,5);
                 // edit2.Text:=str2+Format('%.4d',[strtoint(num)+strtoint(str)]);

                  if AdoTable1.Locate('mapid',Combobox1.Text,[lopartialkey]) then
                    begin
                      with ADOTable1 do
                        begin
                          open;
                          edit;
                           //  记录序列号
                            if dateflag=1 then
                              begin
                                fieldvalues['yesterday']:=copy(code,9,5)+Format('%.4d',[strtoint(num)+strtoint(str)]);
                                edit2.Text:=copy(code,9,5)+Format('%.4d',[strtoint(num)+strtoint(str)]);
                              end;
                            if dateflag=2 then
                              begin
                                fieldvalues['today']:=copy(code,9,5)+Format('%.4d',[strtoint(num)+strtoint(str)]);
                                edit4.Text:=copy(code,9,5)+Format('%.4d',[strtoint(num)+strtoint(str)]);
                              end;
                            if dateflag=3 then
                              begin
                                fieldvalues['yesterday']:=copy(code,9,5)+Format('%.4d',[strtoint(num)+strtoint(str)]);
                                fieldvalues['today']:=copy(code,9,5)+Format('%.4d',[strtoint(num)+strtoint(str)]);
                                edit2.Text:=copy(code,9,5)+Format('%.4d',[strtoint(num)+strtoint(str)]);
                                edit4.Text:=copy(code,9,5)+Format('%.4d',[strtoint(num)+strtoint(str)]);
                              end;
                            if dateflag=4 then
                              begin
                                fieldvalues['yesterday']:=edit4.text;
                                fieldvalues['today']:=copy(code,9,5)+Format('%.4d',[strtoint(num)+strtoint(str)]);
                                edit2.Text:=edit4.Text;
                                edit4.Text:=copy(code,9,5)+Format('%.4d',[strtoint(num)+strtoint(str)]);
                              end;
                          post;
                          update;
                        end;
                      frm_wl.FormShow(sender);
                      ComboBox1.SetFocus;

                    end;
                end;
              //---------------以上是记忆序列号
            end;



          //--
        end;
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

procedure TFrm_main.CheckBox1Click(Sender: TObject);
begin
  if AdoTable1.Locate('mapid',Combobox1.Text,[lopartialkey]) then
    edit2.Text:=AdoTable1.FieldValues['yesterday'];
    edit4.Text:=AdoTable1.FieldValues['today'];
    if checkbox1.Checked=true then
      begin
        edit2.Visible:=true;
        edit4.Visible:=false;
        DateTimePicker1.Date:=Yesterday;              //大夜班是上一天班
        label3.Caption:='昨天：';
      end
    else
      begin
        edit2.Visible:=false;
        edit4.Visible:=true;
        DateTimePicker1.Date:=Today;              //大夜班是上一天班
        label3.Caption:='今天：';
      end;
end;

procedure TFrm_main.Edit3Click(Sender: TObject);
var
  pDevice : pChar;                  //   {$IFNDEF WIN32}   const MAX_PATH = 144;  {$ENDIF}
  pDriver : pChar;
  pPort   : pChar;
  hDMode : THandle;
begin
  portflag:=0;
  Edit3.Text:='';
  if PrintDialog1.Execute then
    begin
    GetMem(pDevice, cchDeviceName);
    GetMem(pDriver, MAX_PATH);
    GetMem(pPort, MAX_PATH);

    Printer.GetPrinter(pDevice, pDriver, pPort, hDMode);
    if lStrLen(pDriver) = 0 then begin
      GetProfileString('Devices', pDevice, '', pDriver, MAX_PATH);
      pDriver[pos(',', pDriver) - 1] := #0;
    end;
    if lStrLen(pPort) = 0 then begin
      GetProfileString('Devices', pDevice, '', pPort, MAX_PATH);
      lStrCpy(pPort,  @pPort[lStrLen(pPort)+2]);
    end;
 //   Memo1.Lines.Add('Device := ' + StrPas(pDevice));
 //   Memo1.Lines.Add('Driver := ' + StrPas(pDriver));
 //   Memo1.Lines.Add('Port := ' + StrPas(pPort));
    Edit3.Text:=StrPas(pDevice);
    if strpas(pport)='USB001' then
      portflag:=1;
     if strpas(pport)='LPT1' then
       portflag:=2;

    FreeMem(pDevice, cchDeviceName);
    FreeMem(pDriver, MAX_PATH);
    FreeMem(pPort, MAX_PATH);
  end;
end;

end.
