unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  Comobj, WordXP;

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
  FWord: Variant;
  FDoc: Variant;


implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  FWord.Selection.TypeParagraph;
  FWord.Selection.TypeText(Text := form1.Edit1.Text);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   //首先创建对象，如果出现异常就作出提示
  try
    FWord := CreateOleObject('Word.Application');
     //WORD程序的执行是否可见，值为False时程序在后台执行
    FWord.Visible := False;
  except
    ShowMessage('创建word对象失败！');
  Exit;
  end;

  //先在打开的Word中创建一个新的页面，然后在其中键入"Hello,"+回车＋"World！"
  try
    FDoc := FWord.Documents.Add;
    FWord.Selection.TypeText(Text := 'Hello，');
    FWord.Selection.TypeParagraph;
    FWord.Selection.TypeText(Text := 'World! ');

  except
    on e: Exception do
      ShowMessage(e.Message);
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   //在程序关闭时把文件内容保存到当前目录中，并以test.doc命名
   //同时关闭WORD程序
  FDoc.SaveAs(ExtractFilePath(application.ExeName) +'test.doc');
  FWord.Quit;
  FWord := Unassigned;
end;


end.
