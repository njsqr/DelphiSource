unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ADODB, StdCtrls;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    ADOConnection2: TADOConnection;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    OpenDialog1: TOpenDialog;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    SaveDialog1: TSaveDialog;
    ADODataSet1: TADODataSet;
    ADOTable1: TADOTable;
    Button3: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);
begin
  if not ADOConnection1.Connected then
    ADOConnection1.Connected := True;  //判断是否连接
  ADOquery1.Close;
  ADOquery1.Sql.Text := 'SELECT  * FROM sp';
  ADOquery1.Open;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  sFileName, sTableName: string;
  sl: TStringList;
  i, tol, j: integer;
begin
  j := 0;
  OpenDialog1.DefaultExt := 'xls';
  OpenDialog1.Filter := 'Microsoft Excel 文件  (*.xls)|*.xls';
  if not OpenDialog1.Execute then
    Exit;


  if not ADOConnection1.Connected then
    ADOConnection1.Connected := True;  //判断是否连接

  try
    sFileName := OpenDialog1.FileName;
    ADOConnection2.Connected := False;    //注意这里 连接 EXCEL 的参数                                                                //关键是这里
    ADOConnection2.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Password="";Data Source=' + sFileName + ';Extended Properties="Excel 8.0;IMEX=1";Persist Security Info=False';
    ADOConnection2.Connected := True;
  //
    sl := TStringList.Create;
    ADOConnection2.GetTableNames(sl); // 记住 Excel 文件的 底部 必须是 sheet1   否则不能导入
    sTableName := sl[0];
    if Pos('$', sTableName) > 0 then
      sTableName := '[' + sTableName + ']';

    ADOquery2.Close;
    ADOquery2.SQL.Clear;
    ADOquery2.SQL.Text := 'SELECT * FROM ' + sTableName;
    ADOquery2.Open;
    sl.Free;

    ADOquery1.Close;
    ADOquery1.Sql.Text := 'SELECT top 1 * FROM sp where 1=0';      //打开 空记录表....这里可以用 insert,不用append
    ADOquery1.Open;                                                           //根据自己习惯 做吧...

    if ADOquery2.RecordCount > 0 then
    begin
      tol := ADOquery2.RecordCount;
      ADOquery2.First;
      for i := 1 to ADOquery2.RecordCount do      //
      begin
        ADOTable1.Open;
        if ADOTable1.Locate('名称', ADOquery2.FieldValues['名称'], [loCaseInsensitive]) then
        begin
          ADOquery2.Next;
          ADOTable1.Close;
          j := j + 1;
          Continue;
        end;
        ADOquery1.Append;
        ADOquery1.FieldValues['编号'] := ADOquery2.FieldValues['编号'];
        ADOquery1.FieldValues['名称'] := ADOquery2.FieldValues['名称'];
        ADOquery1.FieldValues['价格'] := ADOquery2.FieldValues['价格'];
        ADOquery1.FieldValues['barend'] := ADOquery2.FieldValues['日期'];
        ADOquery1.Post;

        ADOquery2.Next;
      end;

    end;

    MessageBox(Handle, PAnsiChar('      导入完成！' + #13 + '共有 ' + InttoStr(tol - j) + ' 条记录导入，另有 ' + InttoStr(j) + '  条记录重复没有导入！'), '完成！', MB_OK + MB_ICONINFORMATION);
  except
    MessageBox(Handle, '失败！', '信息！', MB_OK + MB_ICONINFORMATION);

  end;

end;

procedure TForm1.Button3Click(Sender: TObject);
var
  s: TStringList;
  str,sFileName: string;
  i: Integer;
begin  
  //    lbl1.Caption:=DateTimeToStr(Now);
  str := '';
  dbgrid1.DataSource.DataSet.DisableControls;
  for i := 0 to dbgrid1.DataSource.DataSet.FieldCount - 1 do
    str := str + dbgrid1.DataSource.DataSet.fields[i].DisplayLabel + char(9);
  str := str + #13;
  dbgrid1.DataSource.DataSet.First;
  while not (dbgrid1.DataSource.DataSet.eof) do
  begin
    for i := 0 to dbgrid1.DataSource.DataSet.FieldCount - 1 do
      str := str + dbgrid1.DataSource.DataSet.Fields[i].AsString + char(9);

    str := str + #13;
    dbgrid1.DataSource.DataSet.next;
  
   
//          lbl3.Caption:=IntToStr(dbgrd1.DataSource.DataSet.RecNo);
//          Application.ProcessMessages;

  end; //end  while
//   showmessage(str);
  dbgrid1.DataSource.DataSet.EnableControls;
  SaveDialog1.DefaultExt := 'xls';
  SaveDialog1.Filter := 'Microsoft Excel 文件  (*.xls)|*.xls';
  if not SaveDialog1.Execute then
    Exit;

  sFileName := SaveDialog1.FileName;


  s := TStringList.Create;
  s.Add(str);
  s.SaveToFile(sFileName); //保存到c:temp.xls
  s.Free;  
  //      lbl2.Caption:=DateTimeToStr(Now);

end;

end.

