unit Report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,RVClass,RVProj,RVCsStd, StdCtrls, DB, ADODB, RpCon, RpConDS,
  RpDefine, RpRave, RpBase, RpSystem;

type
  TReportFrm = class(TForm)
    RvProject1: TRvProject;
    RvDataSetConnection1: TRvDataSetConnection;
    ADOTable1: TADOTable;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    ADOTable2: TADOTable;
    RvDataSetConnection2: TRvDataSetConnection;
    RvSystem1: TRvSystem;
    RvDataSetConnection3: TRvDataSetConnection;
    RvDataSetConnection4: TRvDataSetConnection;
    RvDataSetConnection5: TRvDataSetConnection;
    RvDataSetConnection6: TRvDataSetConnection;
    RvDataSetConnection7: TRvDataSetConnection;
    ADOTable3: TADOTable;
    ADOTable4: TADOTable;
    ADOTable5: TADOTable;
    ADOTable6: TADOTable;
    ADOTable7: TADOTable;
    procedure Button1Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReportFrm: TReportFrm;
  MyPage: TRavePage;
  MyText: TRaveText;
implementation

{$R *.dfm}

procedure TReportFrm.Button1Click(Sender: TObject);
begin

    RvProject1.Open;
	  With RvProject1.ProjMan do
    begin
    MyPage := FindRaveComponent('ProductReport.MainPage',nil) as TRavePage;
    MyText := FindRaveComponent('Text9',MyPage) as TRaveText;
    MyText.Text :=Datetostr(Date);
    end;
    RvProject1.ExecuteReport('ProductReport');
    RvProject1.Close;
end;

procedure TReportFrm.Button8Click(Sender: TObject);
begin
   ReportFrm.hide;
end;

procedure TReportFrm.Button2Click(Sender: TObject);
begin

    RvProject1.Open;
	  With RvProject1.ProjMan do
    begin
    MyPage := FindRaveComponent('DepotReport.MainPage',nil) as TRavePage;
    MyText := FindRaveComponent('Text6',MyPage) as TRaveText;
    MyText.Text :=Datetostr(Date);
    end;
    RvProject1.ExecuteReport('DepotReport');
    RvProject1.Close;
end;

procedure TReportFrm.Button3Click(Sender: TObject);
begin

   RvProject1.Open;
	  With RvProject1.ProjMan do
    begin
    MyPage := FindRaveComponent('FeederReport.MainPage',nil) as TRavePage;
    MyText := FindRaveComponent('Text8',MyPage) as TRaveText;
    MyText.Text :=Datetostr(Date);
    end;
    RvProject1.ExecuteReport('FeederReport');
    RvProject1.Close;
end;

procedure TReportFrm.Button4Click(Sender: TObject);
begin

    RvProject1.Open;
	  With RvProject1.ProjMan do
    begin
    MyPage := FindRaveComponent('CustomerReport.MainPage',nil) as TRavePage;
    MyText := FindRaveComponent('Text8',MyPage) as TRaveText;
    MyText.Text :=Datetostr(Date);
    end;
    RvProject1.ExecuteReport('CustomerReport');
    RvProject1.Close;
end;

procedure TReportFrm.Button5Click(Sender: TObject);
begin

    RvProject1.Open;
	  With RvProject1.ProjMan do
    begin
    MyPage := FindRaveComponent('StockReport.MainPage',nil) as TRavePage;
    MyText := FindRaveComponent('Text11',MyPage) as TRaveText;
    MyText.Text :=Datetostr(Date);
    end;
    RvProject1.ExecuteReport('StockReport');
    RvProject1.Close;
end;

procedure TReportFrm.Button6Click(Sender: TObject);
begin

    RvProject1.Open;
	  With RvProject1.ProjMan do
    begin
    MyPage := FindRaveComponent('SellReport.MainPage',nil) as TRavePage;
    MyText := FindRaveComponent('Text11',MyPage) as TRaveText;
    MyText.Text :=Datetostr(Date);
    end;
    RvProject1.ExecuteReport('SellReport');
    RvProject1.Close;
end;

procedure TReportFrm.Button7Click(Sender: TObject);
begin
    
    RvProject1.Open;
	  With RvProject1.ProjMan do
    begin
    MyPage := FindRaveComponent('StorageReport.MainPage',nil) as TRavePage;
    MyText := FindRaveComponent('Text10',MyPage) as TRaveText;
    MyText.Text :=Datetostr(Date);
    end;
    RvProject1.ExecuteReport('StorageReport');
    RvProject1.Close;
end;

end.
