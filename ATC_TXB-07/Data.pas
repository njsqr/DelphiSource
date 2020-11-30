unit Data;

interface

uses
  Windows,SysUtils,Messages, Classes, ADODB, DB,Forms;

type
  TDataM = class(TDataModule)
    ADOConnection2: TADOConnection;
    txb: TADOQuery;
    DataSource6: TDataSource;
    TXB_Tab: TADOTable;
    ADOConnection1: TADOConnection;
    Lhq_Tab: TADOTable;
    Lhq_Que: TADOQuery;
    DataSource1: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataM: TDataM;
   flag:integer;
implementation

uses preQuerryTxb;

{$R *.dfm}

procedure TDataM.DataModuleCreate(Sender: TObject);
var
  filename2,filename1:string;
begin
  filename2:=ExtractFilePath(ParamStr(0)) + 'MDB\TXB_DB.mdb';
 // filename1:=ExtractFilePath(ParamStr(0)) + 'MDB\lhq.xls';
  filename1:=ExtractFilePath(ParamStr(0)) + 'MDB\零件库存.ACCDB';

  flag:=0;
  if  FileExists(filename2) then
    begin
       //特性表数据库
      ADOConnection2.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='
      +filename2+';Persist Security Info=false;jet OLEDB:Database Password=sqr123;';

      ADOConnection2.LoginPrompt:=false;
      datam.TXB_Tab.Connection:=ADOConnection2;
      datam.txb.Connection:=ADOConnection2;

      //公司离合器库存表 XLS型式表
      if  FileExists(filename1) then
        begin
          ADOConnection1.ConnectionString:='Provider=Microsoft.ACE.OLEDB.12.0;Data Source='
        +filename1+';Jet OLEDB:Database Password=""; ';
          
          ADOConnection1.LoginPrompt:=false;
          Lhq_tab.Connection:=ADOConnection1;
         // Lhq_tab.TableName:='_138';
          Lhq_tab.TableName:='SQR';

          Lhq_que.Connection:=ADOConnection1;
          flag:=1;
        end
      else
        begin
          MessageBox(0,'库存表文件“MDB\零件库存.ACCDB” 找不到！', '奥特佳特性表系统', MB_OK);
          flag:=0;
        end;
    end
  else
    begin
      MessageBox(0,'数据库文件“TXB_DB.mdb” 找不到！', '奥特佳特性表系统', MB_OK);
      Application.terminate;
    end;
end;

end.
