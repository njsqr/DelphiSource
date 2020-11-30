unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
   Comobj, ExcelXP;
  //���Ҫʹ��CreateOleObject�İ취��WORD�ĵ����в�����Ӧ����uses
//����м���Comobj������WordXP����
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

   //����������������Ϊȫ�ֱ���
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
//���ȴ���������������쳣��������ʾ
try
FExcel := CreateOleObject('Excel.Application');
//WORD�����ִ���Ƿ�ɼ���ֵΪFalseʱ�����ں�ִ̨��
FExcel.Visible := False;
except
ShowMessage('����word����ʧ�ܣ�');
Exit;
end;

//���ڴ򿪵�Word�д���һ���µ�ҳ�棬Ȼ�������м���"Hello,"+�س���"World��"
try
FXls := FExcel.WorkBooks.Add;
FExcel.Cells[1,1].Value := '��һ�е�����';
FExcel.Selection.TypeParagraph;
FExcel.Cells[1,3].Value := '��һ�е�����';;

except
on e: Exception do
ShowMessage(e.Message);
end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//�ڳ���ر�ʱ���ļ����ݱ��浽��ǰĿ¼�У�����test.doc����
//ͬʱ�ر�WORD����

FXls.SaveAs(ExtractFilePath(application.ExeName) +'test.xls');
FExcel.Quit;
FExcel := Unassigned;
end;

end.
