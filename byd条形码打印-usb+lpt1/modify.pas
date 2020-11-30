unit modify;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,Db;

type
  TFrm_modify = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_modify: TFrm_modify;

implementation

uses wl, main;

{$R *.dfm}

procedure TFrm_modify.FormShow(Sender: TObject);
begin
  with Frm_wl do
  begin
    AdoTable1.Locate(col.Field.FieldName,col.Field.Text,[lopartialkey]);
    Edit1.Text:=AdoTable1.FieldValues['mapid'];
    Edit2.Text:=AdoTable1.FieldValues['mapname'];
    Edit3.Text:=AdoTable1.FieldValues['yesterday'];
  end;
end;

procedure TFrm_modify.Button1Click(Sender: TObject);
begin
  if Edit1.text='' then
    begin
      showmessage('请输入-产品型号！');
      Edit1.SetFocus;
    end
  else
    if Edit2.text='' then
      begin
        showmessage('请输入-条码件号！');
        Edit2.SetFocus;
      end
    else
      begin
        with frm_wl.ADOTable1 do
          begin
            open;
            edit;
            fieldvalues['mapid']:=edit1.Text;
            fieldvalues['mapname']:=edit2.text;
            fieldvalues['yesterday']:='0';
            fieldvalues['today']:='0';
            post;
            update;
          end;
        frm_wl.FormShow(sender);
        frm_main.FormShow(sender);
        close;
      end;
end;

end.
