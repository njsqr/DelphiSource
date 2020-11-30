unit AboutFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TAbout = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    lbPrinters: TListBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function ShowAbout(const ACaption : String;PrinterList : TStrings):Boolean;

implementation

{$R *.DFM}

function ShowAbout(const ACaption : String;PrinterList : TStrings):Boolean;
begin
  with TAbout.Create(Application) do
  try
    lbPrinters.Items.Assign(PrinterList);
    Caption := ACaption;
    Result := ShowModal = mrOK;
  finally
    Free;
  end;
end;

end.
