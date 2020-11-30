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
    // 打印第一页
    if not FileExists(vPath+'box.btw') then
    begin
      showMessage('打印标签不存在,请检查!');
      Exit;
    end;
    barApp := CreateOleObject('BarTender.Application.7');            //USES ComObj
    barApp.Visible := False;
    barFormat := barApp.formats.open(vPath+'box.btw', true, '');
    // 'TEXT'、'BARCODE'均为box.btw标签纸上的控件名称
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
    // 打印第一页
  //  showmessage(vPath+'格式1.btw');
    if not FileExists(vPath+'格式1.btw') then
    begin
      showMessage('打印标签不存在,请检查!');
      Exit;
    end;
    barApp := CreateOleObject('BarTender.Application.10');
    barApp.Visible := False;
    barFormat := barApp.formats.open(vPath+'格式1.btw', true, '');
    // 'TEXT'、'BARCODE'均为box.btw标签纸上的控件名称
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
      PrintOut(False, False); //这里设置成True的话,预览不出来.
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
    // 打印第一页
  //  showmessage(vPath+'格式11.btw');
    if not FileExists(vPath+'格式11.btw') then
    begin
      showMessage('打印标签不存在,请检查!');
      Exit;
    end;
    barApp := CreateOleObject('BarTender.Application.10');
    barApp.Visible := False;
    barFormat := barApp.formats.open(vPath+'格式11.btw', true, '');
    // 'TEXT'、'BARCODE'均为box.btw标签纸上的控件名称
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
