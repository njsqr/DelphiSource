program barcode_print;

uses
  Forms,
  main in 'main.pas' {Form1},
  pici in 'pici.pas' {Form2},
  changjiamingcheng in 'changjiamingcheng.pas' {Form3},
  bujianmingcheng in 'bujianmingcheng.pas' {Form4},
  changjia in 'changjia.pas' {Form5},
  bujianxinxi in 'bujianxinxi.pas' {Form6},
  modiychangjia in 'modiychangjia.pas' {Form7},
  modiybujian in 'modiybujian.pas' {Form8};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Ãı–Œ¬Î¥Ú”°';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.Run;
end.
