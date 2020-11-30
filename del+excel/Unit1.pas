unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
   Comobj, ExcelXP;
  //如果要使用CreateOleObject的办法对WORD文档进行操作，应该在uses
//语句中加入Comobj声明和WordXP声明
type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

   //把这两个变量声明为全局变量
  FExcel: Variant;
  FXls: Variant;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
FExcel.Selection.TypeParagraph;
FExcel.Cells[1,4].Value := edit1.text;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
//首先创建对象，如果出现异常就作出提示
try
FExcel := CreateOleObject('Excel.Application');
//WORD程序的执行是否可见，值为False时程序在后台执行
FExcel.Visible := False;
except
ShowMessage('创建word对象失败！');
Exit;
end;

//先在打开的Word中创建一个新的页面，然后在其中键入"Hello,"+回车＋"World！"
try
FXls := FExcel.WorkBooks.Add;
FExcel.Cells[1,1].Value := '第一行第四列';
FExcel.Selection.TypeParagraph;
FExcel.Cells[1,3].Value := '第一行第四列';;

except
on e: Exception do
ShowMessage(e.Message);
end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//在程序关闭时把文件内容保存到当前目录中，并以test.doc命名
//同时关闭WORD程序

FXls.SaveAs(ExtractFilePath(application.ExeName) +'test.xls');
FExcel.Quit;
FExcel := Unassigned;
end;

end.
