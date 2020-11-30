unit pici;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls,dateutils;

type
  TForm2 = class(TForm)
    MonthCalendar1: TMonthCalendar;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses main;

{$R *.dfm}

procedure TForm2.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  form1.edit4.Text:=datetostr(monthcalendar1.Date);
  close;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  monthcalendar1.date:=today;
  form1.edit4.Text:=datetostr(monthcalendar1.Date);
end;

end.
