unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,winspool,printers;


{$IFNDEF WIN32}
  const MAX_PATH = 144;
{$ENDIF}

type
  TForm1 = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Memo1: TMemo;
    PrintDialog1: TPrintDialog;
    Button5: TButton;
    Button6: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button7: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
procedure WriteRawStringToPrinter(PrinterName:String; S:String);       // �õ�uses winspool,printers
var  Handle: THandle;
  N: DWORD;
  DocInfo1: TDocInfo1;
begin
  if not OpenPrinter(PChar(PrinterName), Handle, nil) then
  begin
    ShowMessage('error ' + IntToStr(GetLastError));
    Exit;
  end;
  with DocInfo1 do begin
   pDocName := PChar('test doc'); {�ڴ�ӡ�б�����ʾ�Ĵ�ӡ����}
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

procedure TForm1.Button1Click(Sender: TObject);
var 
  ZPL: string;
  slist: TStringList;
begin
  slist := TStringList.Create;
  slist.Clear; 
  slist.LoadFromFile('e:\ZPL.TXT');  {��ZPL���Է����ı��ļ��Ъ��������} 
  ZPL := slist.Text;
  WriteRawStringToPrinter(ComboBox1.Text,ZPL); {�˴�COMBOBOX1.TXTΪ��װ�����������
ZEBRA��ӡ�����ƪ�����ֹ����몣Ҳ���Զ���ȡ} 
end;



procedure TForm1.Button2Click(Sender: TObject);
var
  ZPL: string;
  sList: TStringList;
begin
  sList := TStringList.Create;
  try
    sList.Add('^XA^FO50,50^BCN,150^FD12345^FS^XZ');
    ZPL := sList.Text;
    WriteRawStringToPrinter(ComboBox1.Text, ZPL);    //�ҵĴ�ӡ����ComboBox1.Text
  finally
    sList.Free;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
    AppName : Array [0..256] of Char;    //�������ַ��� 
    KeyName : Array [0..256] of Char; //�������ַ��� 
    DefaultString : Array [0..256] of Char; //�ڼ���û�ҵ�ʱĬ�Ϸ��ص��ִ� 
    ReturnedString : Array [0..256] of Char; //�ڼ����ҵ�ʱ���ص��ִ� 
begin
    AppName := 'Windows';//������ 
    KeyName := 'device';    //������ 
    GetProfileString(AppName,KeyName,DefaultString,ReturnedString,Sizeof(ReturnedString));
    ShowMessage(ReturnedString);          //�ҵ���ȱʡ�Ĵ�ӡ��



end;

procedure TForm1.FormShow(Sender: TObject);
begin
   ShowMessage(Printer.Printers[0]);   // ��ʾ���ش�ӡ������

  combobox1.Clear;
      combobox1.Items.Assign(Printer.Printers);
      if combobox1.Items.Count = 0 then
      begin
          showmessage('û�а�װ��ӡ����');
      end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  pDevice : pChar;                  //   {$IFNDEF WIN32}   const MAX_PATH = 144;  {$ENDIF}
  pDriver : pChar;
  pPort   : pChar;
  hDMode : THandle;
begin
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
    Memo1.Lines.Add('Device := ' + StrPas(pDevice));
    Memo1.Lines.Add('Driver := ' + StrPas(pDriver));
    Memo1.Lines.Add('Port := ' + StrPas(pPort));

    if strpas(pport)='USB001' then
 //   if sametext('XPSPort:','XPSPORt:')=true then
    showmessage( StrPas(pDevice)+':'+strpas(pport));

    FreeMem(pDevice, cchDeviceName);
    FreeMem(pDriver, MAX_PATH);
    FreeMem(pPort, MAX_PATH);


   //  Printer.PrinterIndex :=-1;    //û���ã������⣺�������ΪΪ-1,��ΪϵͳĬ�ϴ�ӡ��;

  end;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  prtstr: string;

begin
  prtstr := '^XA^IA6^XZ^FS^XA^FS^BY2,2^LH20,23^FS';
  prtstr := prtstr + '^FO' + '15,12' +'^BC' + ',' + '140^AEN^FD';   //128code
  prtstr := prtstr +'^SN'+'12345678'+',,Y^FS' ;
  prtstr := prtstr + '^PQ'+'5'+'^FS'; //��ӡ1��
  prtstr := prtstr + '^PRC^FS^XZ^FS^XA^EG^XZ'; //��ӡ����


    WriteRawStringToPrinter(ComboBox1.Text, prtstr);    //�ҵĴ�ӡ����ComboBox1.Text
    

end;


function replacing(source:string;ch:char):string;

begin
   if copy(source,2,1)='0' then
     begin
       delete(source,2,1);
       insert(ch,source,2);
     end;
   replacing:=source;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  edit3.text:=inttostr(AnsiCompareStr(replacing(edit1.Text,'a'), edit2.Text));
  showmessage(edit1.Text+':'+ replacing(edit1.Text,'a'));
end;

procedure TForm1.Button7Click(Sender: TObject);
Var F:TextFile;
    Str:string;
Begin
  try
    Str:='^XA^FO50,50^BCN,100^FD123456789^FS^XZ';
    AssignFile(F, 'LPT1');
    Rewrite(F);
    Write(F, Str);
    CloseFile(F);
  Except
    Messagedlg('���ݷ���ʧ�ܣ�',mterror,[mbok],0);
  End;
end;

end.