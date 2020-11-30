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

procedure WriteRawStringToPrinter(PrinterName:String; S:String);       // �õ�uses winspool,printers
var  Handle: THandle;                                                //usb��ӡģ��
  N: DWORD;
  DocInfo1: TDocInfo1;
begin
  if not OpenPrinter(PChar(PrinterName), Handle, nil) then
  begin
    ShowMessage('error ' + IntToStr(GetLastError));
    Exit;
  end;
  with DocInfo1 do begin
   pDocName := PChar('sqr'); {�ڴ�ӡ�б�����ʾ�Ĵ�ӡ����}
    pOutputFile := nil;
    pDataType := 'RAW';            {�ؼ����������ͱ�����RAW��������ӡ��ͨ����������
����ʶ��ZPL����} 
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
  prtstr := prtstr + '^PQ'+number+'^FS'; //��ӡ1��
  prtstr := prtstr + '^PRC^FS^XZ^FS^XA^EG^XZ'; //��ӡ����
  //showmessage(prtstr);
  if portflag=1 then        //usb��ӡ
    WriteRawStringToPrinter(edit3.Text, prtstr)
  else
    if portflag=2 then      //����lpt1��ӡ
      begin
        filehandle := fileopen('LPT1', fmOpenWrite);
        if filehandle > 0 then
          filewrite(filehandle, prtstr[1], length(prtstr))
        else
          begin
            portflag:=0;
            showmessage('�򿪲��ڴ���');
          end;
          fileclose(filehandle);
      end
    else
      showmessage('��ѡ���ӡ������ӡ���ִ���');
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
    MessageBox(Handle,'���ݿ����ʧ�ܣ��������á�','����',MB_OK or MB_ICONWARNING);
  end;
end;

procedure TFrm_main.N3Click(Sender: TObject);
begin
  frm_wl.ShowModal;
end;

procedure TFrm_main.FormShow(Sender: TObject);
begin
  portflag:=0;          //�˿ڳ�ʼ��
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
          DateTimePicker1.Date:=Yesterday;              //��ҹ������һ���
          label3.Caption:='���죺';
        end
      else
        begin
          edit2.Visible:=false;
          edit4.Visible:=true;
          DateTimePicker1.Date:=Today;              //��ҹ������һ���
          label3.Caption:='���죺';
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
      showmessage('ѹ�����ͺŲ���Ϊ�գ�����'+#13+#13+'������ѡ��ѹ�����ͺ�...');
      combobox1.SetFocus
    end
  else
    begin
      code:=label9.Caption ;
      if (MessageBox(Handle,'��μ��Ƿ��Ǵ�ҹ��ȷ����ô��','��ʾ',MB_YESNO or MB_ICONwarning)=7) then
        //datetimepicker1.SetFocus
        radiogroup1.SetFocus
      else
        begin

          decodedate(DateTimePicker1.Date,y,m,d);
            //�ֽ��ꡢ�¡���
          flag:=y-(y div 10)*10;
          code:=code+inttostr(flag)+m_Arr[m-1]+Format('%.2d',[d]);
               //shift ���
          case RadioGroup1.ItemIndex of
            1: code:=code+'B';
            2: code:=code+'C';
            else code:=code+'A';
          end;
          //���к�    //deteflagΪ 1�����죬 2���죬 3������죬4��������컻
          str1:=copy(edit2.Text,6,4);
          str2:=copy(edit4.Text,6,4);
          case AnsiCompareStr(replacing(code),replacing(edit2.Text))of
            -1: begin                                                      //��ӡ����С������
                  showmessage('�����ڣ��������غŵ������룡����');
                  exit;
                end;
            0:  begin                                  //��ӡ����С������
                  dateflag:=1;    //����С�ڽ���
                  str:=str1;
                  if AnsiCompareStr(replacing(edit2.Text),replacing(edit4.Text))=0 then   //������ڽ���
                    dateflag:=3;
                end;
            else                                                          //��ӡ���ڴ�������
                begin
                  if AnsiCompareStr(replacing(code),replacing(edit4.Text))<0 then    //��ӡ����С�ڽ���
                    begin
                      dateflag:=1;                                //deteflagΪ 1�����죬 2���죬 3������죬4��������컻��д����
                      str:='0';
                    end
                  else
                    if AnsiCompareStr(replacing(code),replacing(edit4.Text))=0 then  //��ӡ���ڵ��ڽ���
                      begin
                        str:=str2;
                        dateflag:=2;
                      end
                    else                 //��ӡ���ڴ��ڽ���
                      begin
                        str:='0';
                        dateflag:=4;
                      end;

                end;
          end;  //case��end��
          //----
          code:=code+Format('%.4d', [strtoint(str)+1]);             //���к�
          if MessageBox(Handle,'ȷ�ϴ�ӡô��','��ʾ',MB_YESNO or MB_ICONquestion)=7 then
             Combobox1.SetFocus
          else
            begin
              num:=edit1.Text;  //��ӡ����
              printbarcode(code,num);   //��ӡ


              //-------������Ҫ�����������к�
              if (portflag<>0)and(dateflag<>0) then
                begin                          //deteflagΪ 1�������죬 2�Ľ��죬 3������ͽ��죬4��������컻�󣬸�д����
                 // str2:=copy(code,9,5);
                 // edit2.Text:=str2+Format('%.4d',[strtoint(num)+strtoint(str)]);

                  if AdoTable1.Locate('mapid',Combobox1.Text,[lopartialkey]) then
                    begin
                      with ADOTable1 do
                        begin
                          open;
                          edit;
                           //  ��¼���к�
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
              //---------------�����Ǽ������к�
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
  if MessageDlg('ȷ��Ҫ�˳���ϵͳ����',mtConfirmation,[mbYes,mbNo],0)=mrYes then
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
        DateTimePicker1.Date:=Yesterday;              //��ҹ������һ���
        label3.Caption:='���죺';
      end
    else
      begin
        edit2.Visible:=false;
        edit4.Visible:=true;
        DateTimePicker1.Date:=Today;              //��ҹ������һ���
        label3.Caption:='���죺';
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
