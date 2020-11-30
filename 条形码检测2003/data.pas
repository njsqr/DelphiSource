unit data;

interface

uses
  Windows,SysUtils, Classes, DB, ADODB,Messages,Forms;

type
  TDataModule1 = class(TDataModule)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADOTable1: TADOTable;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

procedure TDataModule1.DataModuleCreate(Sender: TObject);
var
  filename1:string;
begin
  filename1:=ExtractFilePath(ParamStr(0)) + 'MDB\条形码.MDB';

 // flag:=0;

  if  FileExists(filename1) then
    begin
      ADOConnection1.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='
            +filename1+';Persist Security Info=false;jet OLEDB:Database Password=sqr123;';

      ADOConnection1.LoginPrompt:=false;
      adotable1.Connection:=ADOConnection1;

      datasource1.DataSet:= adotable1;
    end
  else
    begin
      MessageBox(0,'数据库文件“MDB\条形码.ACCDB” 找不到！', '奥特佳条形码检测系统', MB_OK);
      Application.terminate;
    end;
end;

end.
