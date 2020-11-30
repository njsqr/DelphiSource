unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids,Db, ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    Edit2: TEdit;
    Label3: TLabel;
    Button3: TButton;
    Label4: TLabel;
    Edit3: TEdit;
    Label5: TLabel;
    Edit4: TEdit;
    Label6: TLabel;
    Edit5: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Panel2: TPanel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses DATA;

{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);
begin
  datamodule1.ADOTable1.Close;
  close;
end;

procedure TForm1.Button1Click(Sender: TObject);
var str:string;
begin
  datamodule1.ADOTable1.tableName:='table10';
  datamodule1.ADOTable1.Open ;  //比亚迪
 // Length(Edit1.Text)
      begin
        str:=edit1.Text;
        //showmessage(str);
        if datamodule1.ADOTable1.Locate('码值',str,[lopartialkey]) then
          begin
            label7.Visible:=true;
            label8.Visible:=false;
            windows.Beep(4000,1000); 

            showmessage('有重复的了'+#13+'!!!!!!!'+#13+'!!!!!!!!');
          end
        else
          begin
          //  datamodule1.ADOTable1.Close;
            datamodule1.ADOTable1.append;
            datamodule1.ADOTable1.FieldByName('码值').AsString := Trim(edit1.Text);
            datamodule1.ADOTable1.post;
            datamodule1.ADOTable1.Close;
            edit1.Text:='';
            label8.Visible:=true;
            label7.Visible:=false;
            edit2.Text:='';
            edit3.Text:='';
            edit4.Text:='';
            edit5.Text:='';
          end;
      end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  edit1.Clear;
  edit2.Clear;
  edit3.Clear;
  edit4.Clear;
  edit5.Clear;
  label7.Visible:=false;
  label8.Visible:=false;
  edit1.SetFocus;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    Button1Click(Sender);

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  edit1.Clear;
  edit2.Clear;
  edit3.Clear;
  edit4.Clear;
  edit5.Clear;
  label7.Visible:=false;
  label8.Visible:=false;
end;



procedure TForm1.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_space then
    Button3Click(Sender)
end;

end.
