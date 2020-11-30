program Project1;

uses
  Forms,
  Windows,
  LoginF in 'LoginF.pas' {frmLogin},
  mainDM in 'mainDM.pas' {dmMain: TDataModule},
  MainF in 'MainF.pas' {frmMain},
  UWellcome in 'UWellcome.pas' {FWellcome};

{$R *.res}

var

  mymutex: THandle;

begin

  mymutex := CreateMutex(nil, True, 'Ӫ�������Լ�ϵͳ');
  if GetLastError <> ERROR_ALREADY_EXISTS then
  begin
    Application.Title := 'Ӫ�������Լ�ϵͳ';
    Application.Initialize;
    //��ʾ����
    Application.CreateForm(TFWellcome, FWellcome);
    FWellcome.Show;
    try
      //������Ҫ����Դ
    Application.CreateForm(TdmMain, dmMain);
//  Application.CreateForm(TfrmMain, frmMain);
  //...����
    finally
      Sleep(5000);//��ʱһ��
      FWellcome.Free;
    end;

    if LoginF.Login()  then  //���е�¼���ڣ�����һ�У��򵥰ɣ�
      Application.CreateForm(TfrmMain, frmMain);
    Application.Run;
  end
  else
    begin
      MessageBox(mymutex, '��������������', '��ʾ:Ӫ�������Լ�ϵͳ',  mb_IconInformation + mb_Ok);

    end;
end.
