unit add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFrm_add = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_add: TFrm_add;

implementation

uses wl, main;

{$R *.dfm}

procedure TFrm_add.Button1Click(Sender: TObject);
begin
  if Edit1.text='' then
    begin
      showmessage('请输入-物料件号！');
      Edit1.SetFocus;
    end
  else
    if Edit2.text='' then
      begin
        showmessage('请输入-物料名称！');
        Edit2.SetFocus;
      end
    else
      begin
        with frm_wl.ADOTable1 do
          begin
            open;
            append;
            fieldvalues['mapid']:=edit1.Text;
            fieldvalues['mapname']:=edit2.text;
            fieldvalues['memo']:=edit3.text;
            post;
            update;
          end;
        frm_wl.FormShow(sender);
        frm_main.FormShow(sender);
        close;
      end;
end;

end.
