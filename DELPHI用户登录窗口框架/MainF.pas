unit MainF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdHashMessageDigest;

type
  TfrmMain = class(TForm)
    btn1: TButton;
    ed1: TEdit;
    ed2: TEdit;
    ed3: TEdit;
    ed4: TEdit;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.btn1Click(Sender: TObject);
var
  MD5: TIdHashMessageDigest5;
begin
  MD5 := TIdHashMessageDigest5.Create;
  if  MD5.AsHex(MD5.HashValue(ed1.Text))=MD5.AsHex(MD5.HashValue('123456'))then
    ed2.Text:=MD5.AsHex(MD5.HashValue(ed1.Text));

  ed3.Text:=Copy(MD5.AsHex(MD5.HashValue('123456')),9,16);//��ȡ16λ�ַ���MD5

  ed4.Text:=md5.AsHex(md5.HashValue(TFileStream.Create('D:\sqr\delphi\DELPHI�û���¼���ڿ��\�ı��ĵ�.txt',fmOpenRead))); //�����ļ�MD5

  md5.Free;
end;

end.

