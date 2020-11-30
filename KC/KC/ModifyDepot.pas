unit ModifyDepot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, DB, ADODB, Mask;

type
  TModifyDepotFrm = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    DBNavigator1: TDBNavigator;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ModifyDepotFrm: TModifyDepotFrm;

implementation

{$R *.dfm}

procedure TModifyDepotFrm.Button1Click(Sender: TObject);
begin
   if (dbedit1.text='') or(dbedit2.text='')or(dbedit3.text='')  then
     showmessage('仓库信息填写不全！')
   else
    begin
     with ADOTable1 do
       begin
        edit;
        fieldvalues['DepotName']:=dbedit1.Text;
        fieldvalues['Address']:=dbedit2.Text;
        fieldvalues['Principal']:=dbedit3.Text;
        post;
        update;
       end;
      showmessage('此条仓库信息已经成功修改！');
    end;
end;

procedure TModifyDepotFrm.Button2Click(Sender: TObject);
begin
    if MessageDlg('确定要删除此条仓库信息吗？',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
    ADOTable1.Delete;
    showmessage('此条仓库信息已经成功删除！');
    end;
end;

procedure TModifyDepotFrm.Button3Click(Sender: TObject);
begin
   ModifydepotFrm.hide;
end;

procedure TModifyDepotFrm.FormShow(Sender: TObject);
begin
     ADOTable1.Active:=False;
     ADOTable1.Active:=True;
     DBEdit1.Setfocus;
end;

procedure TModifyDepotFrm.FormCreate(Sender: TObject);
begin
    ADOTable1.Active:=True;
end;

end.
