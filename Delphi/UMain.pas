unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls,UPrint,QPrinters;

type
  Tfrmmain = class(TForm)
    btnview: TBitBtn;
    edtprint: TEdit;
    btnprint: TBitBtn;
    imgview: TImage;
    procedure btnviewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmmain: Tfrmmain;

implementation

{$R *.dfm}

procedure Tfrmmain.btnviewClick(Sender: TObject);
var
  BCPrint:TBCPrint;
begin
  BCPrint:=TBCPrint.Create;
  imgview.Picture.Assign(nil);
  BCPrint.PrintBarCode(imgview.Canvas,edtprint.Text,0,0);
  BCPrint.Free;
end;

end.
