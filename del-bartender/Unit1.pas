unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,ComObj;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function DoPrint:Boolean;
var
  barApp: Variant;
  barFormat: Variant;
  vPath: string;
begin
  Result := False;
  try
    vPath := ExtractFilePath(Forms.Application.ExeName);
    // ��ӡ��һҳ
    if not FileExists(vPath+'box.btw') then
    begin
      showMessage('��ӡ��ǩ������,����!');
      Exit;
    end;
    barApp := CreateOleObject('BarTender.Application.7');            //USES ComObj
    barApp.Visible := False;
    barFormat := barApp.formats.open(vPath+'box.btw', true, '');
    // 'TEXT'��'BARCODE'��Ϊbox.btw��ǩֽ�ϵĿؼ�����
    barFormat.SetNamedSubStringValue('TEXT', 'TEXTValue');
    barFormat.SetNamedSubStringValue('BARCODE', 'BARCODEValue');
    barFormat.printout(False,False);
    barFormat.close(1);
    barApp.quit(1);
  except
    on E: Exception do
    begin
      ShowMessage(E.ClassName + E.Message);
      Exit;
    end;
  end;
  Result := True;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  barApp: Variant;
  barFormat: Variant;
  vPath: string;
  Result : Boolean;
begin
  Result := False;
  try
    vPath := ExtractFilePath(Forms.Application.ExeName);
    // ��ӡ��һҳ
  //  showmessage(vPath+'��ʽ1.btw');
    if not FileExists(vPath+'��ʽ1.btw') then
    begin
      showMessage('��ӡ��ǩ������,����!');
      Exit;
    end;
    barApp := CreateOleObject('BarTender.Application.10');
    barApp.Visible := False;
    barFormat := barApp.formats.open(vPath+'��ʽ1.btw', true, '');
    // 'TEXT'��'BARCODE'��Ϊbox.btw��ǩֽ�ϵĿؼ�����
    barFormat.SetNamedSubStringValue('TEXT', 'TEXTValue');
    barFormat.SetNamedSubStringValue('BARCODE', 'BARCODEValue');
    barFormat.printout(False,False);
    barFormat.close(1);
    barApp.quit(1);
  except
    on E: Exception do
    begin
      ShowMessage(E.ClassName + E.Message);
      Exit;
    end;
  end;
  Result := True;
end;

 {
procedure TForm1.Button1Click(Sender: TObject);

   var
  AppPath: string;
  LebelPath: string;
  O: TApplication_Bar;
begin
  AppPath := ExtractFilePath(ParamStr(0));
  LebelPath := AppPath + '\aa.btw';
  O := TApplication_Bar.Create(nil);
  try
    with O.Formats.Open(LebelPath, True, '') do
    begin
      PrintOut(False, False); //�������ó�True�Ļ�,Ԥ��������.
      Close(btDoNotSaveChanges);
    end;
  finally
    O.Quit(btDoNotSaveChanges);
    O.Free;
  end;
end;
end; }

procedure TForm1.Button2Click(Sender: TObject);
var
  barApp: Variant;
  barFormat: Variant;
  vPath: string;
  Result : Boolean;
begin
  Result := False;
  try
    vPath := ExtractFilePath(Forms.Application.ExeName);
    // ��ӡ��һҳ
  //  showmessage(vPath+'��ʽ11.btw');
    if not FileExists(vPath+'��ʽ11.btw') then
    begin
      showMessage('��ӡ��ǩ������,����!');
      Exit;
    end;
    barApp := CreateOleObject('BarTender.Application.10');
    barApp.Visible := False;
    barFormat := barApp.formats.open(vPath+'��ʽ11.btw', true, '');
    // 'TEXT'��'BARCODE'��Ϊbox.btw��ǩֽ�ϵĿؼ�����
    barFormat.SetNamedSubStringValue('TEXT', edit1.Text);
    barFormat.SetNamedSubStringValue('BARCODE', edit2.Text);
    barFormat.printout(False,False);
    barFormat.close(1);
    barApp.quit(1);
  except
    on E: Exception do
    begin
      ShowMessage(E.ClassName + E.Message);
      Exit;
    end;
  end;
  Result := True;
end;

end.
