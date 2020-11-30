program Project1;

uses
  Forms,
  Login in 'Login.pas' {LoginFrm},
  Main in 'Main.pas' {MainFrm},
  AddProduct in 'AddProduct.pas' {AddProductFrm},
  ModifyProduct in 'ModifyProduct.pas' {ModifyProductFrm},
  QueryProduct in 'QueryProduct.pas' {QueryProductFrm},
  AddDepot in 'AddDepot.pas' {AddDepotFrm},
  ModifyDepot in 'ModifyDepot.pas' {ModifyDepotFrm},
  QueryDepot in 'QueryDepot.pas' {QueryDepotFrm},
  AddFeeder in 'AddFeeder.pas' {AddFeederFrm},
  ModifyFeeder in 'ModifyFeeder.pas' {ModifyFeederFrm},
  QueryFeeder in 'QueryFeeder.pas' {QueryFeederFrm},
  AddCustomer in 'AddCustomer.pas' {AddCustomerFrm},
  ModifyCustomer in 'ModifyCustomer.pas' {ModifyCustomerFrm},
  QueryCustomer in 'QueryCustomer.pas' {QueryCustomerFrm},
  AddStock in 'AddStock.pas' {AddStockFrm},
  ModifyStock in 'ModifyStock.pas' {ModifyStockFrm},
  QueryStock in 'QueryStock.pas' {QueryStockFrm},
  AddSell in 'AddSell.pas' {AddSellFrm},
  ModifySell in 'ModifySell.pas' {ModifySellFrm},
  QuerySell in 'QuerySell.pas' {QuerySellFrm},
  QueryStorage in 'QueryStorage.pas' {QueryStorageFrm},
  ShortProduct in 'ShortProduct.pas' {ShortProductFrm},
  OverProduct in 'OverProduct.pas' {OverProductFrm},
  ModifyPassword in 'ModifyPassword.pas' {ModifyPasswordFrm},
  AddUser in 'AddUser.pas' {AddUserFrm},
  Help in 'Help.pas' {HelpFrm},
  Report in 'Report.pas' {ReportFrm},
  Welcome in 'Welcome.pas' {WelcomeFrm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TWelcomeFrm, WelcomeFrm);
  Application.CreateForm(TLoginFrm, LoginFrm);
  Application.CreateForm(TMainFrm, MainFrm);
  Application.CreateForm(THelpFrm, HelpFrm);
  Application.CreateForm(TAddUserFrm, AddUserFrm);
  Application.CreateForm(TModifyPasswordFrm, ModifyPasswordFrm);
  Application.CreateForm(TAddProductFrm, AddProductFrm);
  Application.CreateForm(TModifyProductFrm, ModifyProductFrm);
  Application.CreateForm(TQueryProductFrm, QueryProductFrm);
  Application.CreateForm(TAddDepotFrm, AddDepotFrm);
  Application.CreateForm(TModifyDepotFrm, ModifyDepotFrm);
  Application.CreateForm(TQueryDepotFrm, QueryDepotFrm);
  Application.CreateForm(TAddFeederFrm, AddFeederFrm);
  Application.CreateForm(TModifyFeederFrm, ModifyFeederFrm);
  Application.CreateForm(TQueryFeederFrm, QueryFeederFrm);
  Application.CreateForm(TAddCustomerFrm, AddCustomerFrm);
  Application.CreateForm(TModifyCustomerFrm, ModifyCustomerFrm);
  Application.CreateForm(TQueryCustomerFrm, QueryCustomerFrm);
  Application.CreateForm(TAddStockFrm, AddStockFrm);
  Application.CreateForm(TModifyStockFrm, ModifyStockFrm);
  Application.CreateForm(TQueryStockFrm, QueryStockFrm);
  Application.CreateForm(TAddSellFrm, AddSellFrm);
  Application.CreateForm(TModifySellFrm, ModifySellFrm);
  Application.CreateForm(TQuerySellFrm, QuerySellFrm);
  Application.CreateForm(TQueryStorageFrm, QueryStorageFrm);
  Application.CreateForm(TShortProductFrm, ShortProductFrm);
  Application.CreateForm(TOverProductFrm, OverProductFrm);
  Application.CreateForm(TReportFrm, ReportFrm);
  Application.Run;
end.
