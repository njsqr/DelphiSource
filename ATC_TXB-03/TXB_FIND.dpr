program TXB_FIND;

uses
  Forms,
  Main in 'Main.pas' {MainFrm},
  QuerryTxb in 'QuerryTxb.pas' {QuerryTxbFrm},
  ModifyTxb in 'ModifyTxb.pas' {ModifyTxbFrm},
  AddTxb in 'AddTxb.pas' {AddTxbFrm},
  Login in 'Login.pas' {LoginFrm},
  Data in 'Data.pas' {DataM: TDataModule},
  PreModifyTxb in 'PreModifyTxb.pas' {PreModifyTxbFrm},
  PreQuerryTxb in 'PreQuerryTxb.pas' {PreQuerryTxbFrm},
  PreAddTxb in 'PreAddTxb.pas' {PreAddTxbFrm},
  QuerryLhq in 'QuerryLhq.pas' {QuerryLhqFrm},
  StoreLhq in 'StoreLhq.pas' {StoreLhqFrm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '奥特佳特性表系统';
  Application.CreateForm(TLoginFrm, LoginFrm);
  Application.CreateForm(TMainFrm, MainFrm);
  Application.CreateForm(TModifyTxbFrm, ModifyTxbFrm);
  Application.CreateForm(TAddTxbFrm, AddTxbFrm);
  Application.CreateForm(TDataM, DataM);
  Application.CreateForm(TPreModifyTxbFrm, PreModifyTxbFrm);
  Application.CreateForm(TPreQuerryTxbFrm, PreQuerryTxbFrm);
  Application.CreateForm(TQuerryTxbFrm, QuerryTxbFrm);
  Application.CreateForm(TPreAddTxbFrm, PreAddTxbFrm);
  Application.CreateForm(TQuerryLhqFrm, QuerryLhqFrm);
  Application.CreateForm(TStoreLhqFrm, StoreLhqFrm);
  Application.Run;
end.
