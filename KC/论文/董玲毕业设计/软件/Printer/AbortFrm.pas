unit AbortFrm;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Gauges, StdCtrls, Buttons;

type

  TAbortForm = class(TForm)
    bbtnAbort: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AbortForm: TAbortForm;

implementation
uses Printers;

{$R *.DFM}


end.


