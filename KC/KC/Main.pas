unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls;

type
  TMainFrm = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    N41: TMenuItem;
    N42: TMenuItem;
    N7: TMenuItem;
    N43: TMenuItem;
    Label1: TLabel;
    StatusBar1: TStatusBar;
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N42Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure N43Click(Sender: TObject);
    procedure N34Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N36Click(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
   

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainFrm: TMainFrm;

implementation

uses AddProduct, ModifyProduct, Login, QueryProduct, AddDepot, ModifyDepot, QueryDepot, AddFeeder, ModifyFeeder,
  QueryFeeder, AddCustomer, ModifyCustomer, QueryCustomer, AddStock, ModifyStock, QueryStock, AddSell, ModifySell,
  QuerySell, QueryStorage, ShortProduct, OverProduct, ModifyPassword, AddUser, Help, Report;

{$R *.dfm}

procedure TMainFrm.N10Click(Sender: TObject);
begin
       AddProductFrm.show;
end;





procedure TMainFrm.N11Click(Sender: TObject);
begin
     ModifyProductFrm.show;
end;

procedure TMainFrm.N42Click(Sender: TObject);
begin
    if MessageDlg('确认要退出本系统吗吗？',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
     Application.terminate;
    end;

end;

procedure TMainFrm.N12Click(Sender: TObject);
begin
     QueryProductFrm.show;
end;

procedure TMainFrm.N13Click(Sender: TObject);
begin
    AddDepotFrm.show;
end;

procedure TMainFrm.N14Click(Sender: TObject);
begin
     ModifyDepotFrm.show;
end;

procedure TMainFrm.N15Click(Sender: TObject);
begin
     QueryDepotFrm.show;
end;

procedure TMainFrm.N16Click(Sender: TObject);
begin
    AddFeederFrm.show;
end;

procedure TMainFrm.N17Click(Sender: TObject);
begin
  ModifyFeederFrm.show;
end;

procedure TMainFrm.N18Click(Sender: TObject);
begin
  QueryFeederFrm.show;
end;

procedure TMainFrm.N19Click(Sender: TObject);
begin
  AddcustomerFrm.show;
end;

procedure TMainFrm.N20Click(Sender: TObject);
begin
     ModifyCustomerFrm.show;
end;

procedure TMainFrm.N21Click(Sender: TObject);
begin
    QueryCustomerFrm.show;
end;

procedure TMainFrm.N30Click(Sender: TObject);
begin
   AddStockFrm.show;
end;

procedure TMainFrm.N7Click(Sender: TObject);
begin
  ModifyStockFrm.show;
end;

procedure TMainFrm.N31Click(Sender: TObject);
begin
    QueryStockFrm.show;
end;

procedure TMainFrm.N33Click(Sender: TObject);
begin
   AddSellFrm.show;
end;

procedure TMainFrm.N43Click(Sender: TObject);
begin
   ModifySellFrm.show;
end;

procedure TMainFrm.N34Click(Sender: TObject);
begin
    QuerySellFrm.show;
end;

procedure TMainFrm.N23Click(Sender: TObject);
begin
     QueryStorageFrm.show;
end;

procedure TMainFrm.N25Click(Sender: TObject);
begin
    ShortProductFrm.show;
end;

procedure TMainFrm.N26Click(Sender: TObject);
begin
   OverProductFrm.show;
end;

procedure TMainFrm.N9Click(Sender: TObject);
begin
   if MessageDlg('确认要退出本系统吗吗？',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
     Application.terminate;
    end;
end;

procedure TMainFrm.N36Click(Sender: TObject);
begin
     ModifyPasswordFrm.Show;
end;

procedure TMainFrm.N37Click(Sender: TObject);
begin
     with LoginFrm.ADOQuery1 do
      begin
       close;
       sql.clear;
       sql.add('select * from login where username='+''''+loginFrm.edit1.text+''''+'and password='+''''+loginFrm.edit2.text+'''');
       open;
       first;
       if fieldbyname('class').asstring='系统管理员' then
         AddUserFrm.show
       else
         showmessage('对不起，您没有添加用户的权限！');
      end;

end;

procedure TMainFrm.N41Click(Sender: TObject);
begin
    HelpFrm.showmodal;
end;

procedure TMainFrm.N28Click(Sender: TObject);
begin
   ReportFrm.show;
end;

procedure TMainFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if MessageDlg('确认要退出本系统吗吗？',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
     Application.terminate;
    end;
    
end;

end.
