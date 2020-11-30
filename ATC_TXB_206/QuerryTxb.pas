unit QuerryTxb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DBCtrls, Mask, ExtCtrls,db,adodb,jpeg;

  //ADODB库有tadoblobstream.Create(tblobfield(DataM.tab_066.fieldbyname('图片')),bmread);
  // jpeg 库有tjpegimape;

type
  TQuerryTxbFrm = class(TForm)
    RadioGroup1: TRadioGroup;
    Panel1: TPanel;
    Image1: TImage;
    Label9: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    Label31: TLabel;
    Label30: TLabel;
    Label29: TLabel;
    Label21: TLabel;
    Label2: TLabel;
    Label16: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    Label1: TLabel;
    GroupBox3: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    GroupBox2: TGroupBox;
    Label28: TLabel;
    Label27: TLabel;
    Label26: TLabel;
    Label25: TLabel;
    Label3: TLabel;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    GroupBox1: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBMemo1: TDBMemo;
    DBEdit9: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit1: TDBEdit;
    DateTimePicker1: TDateTimePicker;
    Button3: TButton;
    Button2: TButton;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    procedure show_picture;
  public
    { Public declarations }
  end;

var
  QuerryTxbFrm: TQuerryTxbFrm;
           ext: string;

implementation

uses Data, PreQuerryTxb, StoreLhq;

{$R *.dfm}

procedure TQuerryTxbFrm.FormCreate(Sender: TObject);
begin
  datam.DataSource6.DataSet:=datam.txb_tab;
  DBNavigator1.DataSource:= datam.DataSource6;
  DBEdit27.DataSource:= datam.DataSource6;
  DBEdit27.DataField:='产品型号';
  DBEdit1.DataSource:= datam.DataSource6;
  DBEdit1.DataField:='所配车型';
  DBEdit2.DataSource:= datam.DataSource6;
  DBEdit2.DataField:='替代机型';

  DBEdit24.DataSource:= datam.DataSource6;
  DBEdit24.DataField:='图纸状态';
  //试制期限    //
  DBEdit3.DataSource:= datam.DataSource6;
  DBEdit3.DataField:='动盘';
  DBEdit4.DataSource:= datam.DataSource6;
  DBEdit4.DataField:='静盘';
  DBEdit5.DataSource:= datam.DataSource6;
  DBEdit5.DataField:='机壳毛坯';
  DBEdit6.DataSource:= datam.DataSource6;
  DBEdit6.DataField:='机壳成品';
  DBEdit7.DataSource:= datam.DataSource6;
  DBEdit7.DataField:='前盖毛坯';
  DBEdit8.DataSource:= datam.DataSource6;
  DBEdit8.DataField:='前盖成品';
  DBEdit25.DataSource:= datam.DataSource6;
  DBEdit25.DataField:='合盖方向';
  // 离合器
  DBEdit9.DataSource:= datam.DataSource6;
  DBEdit9.DataField:='45挡圈';
  DBEdit10.DataSource:= datam.DataSource6;
  DBEdit10.DataField:='离合器';
  DBEdit11.DataSource:= datam.DataSource6;
  DBEdit11.DataField:='离合器压线板';
  // 吸排气口
  DBEdit12.DataSource:= datam.DataSource6;
  DBEdit12.DataField:='吸气口密封塞';
  DBEdit13.DataSource:= datam.DataSource6;
  DBEdit13.DataField:='排气口密封塞';
  DBEdit14.DataSource:= datam.DataSource6;
  DBEdit14.DataField:='吸排气口压板';
  DBEdit15.DataSource:= datam.DataSource6;
  DBEdit15.DataField:='吸排气口螺栓';

  //感温包
  DBEdit16.DataSource:= datam.DataSource6;
  DBEdit16.DataField:='感温包';
  DBEdit17.DataSource:= datam.DataSource6;
  DBEdit17.DataField:='感温包压板';
  DBEdit18.DataSource:= datam.DataSource6;
  DBEdit18.DataField:='感温包螺栓';
  DBEdit19.DataSource:= datam.DataSource6;
  DBEdit19.DataField:='感温包出线方式';
  DBEdit20.DataSource:= datam.DataSource6;
  DBEdit20.DataField:='感温包出线长度';
  // 销套
  DBEdit21.DataSource:= datam.DataSource6;
  DBEdit21.DataField:='销套型号';
  DBEdit22.DataSource:= datam.DataSource6;
  DBEdit22.DataField:='销套数量';
  DBEdit23.DataSource:= datam.DataSource6;
  DBEdit23.DataField:='销套压入方式';

  DBEdit26.DataSource:= datam.DataSource6;
  DBEdit26.DataField:='备注';
  DBmemo1.DataSource:= datam.DataSource6;
  DBmemo1.DataField:='特殊说明';
end;

procedure TQuerryTxbFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DataM.txb_tab.Close;
  prequerrytxbfrm.Close;

  storelhqfrm.hide;
  datam.lhq_que.Close;
end;

procedure TQuerryTxbFrm.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
    FormShow(Sender);
    if flag<>0 then
      storelhqfrm.FormShow(sender);
end;

procedure TQuerryTxbFrm.FormShow(Sender: TObject);
begin
  radiogroup1.ItemIndex:=preQuerryTxbFrm.radiogroup1.ItemIndex;
  // Label4的改变
  if dbedit24.Text='受控' then
    begin
      Label4.Caption:='受控日期';
      datetimepicker1.Color:=clWindow;
    end
  else
    begin
      Label4.Caption:='试制期限';
    //  showmessage(datetostr(datetimepicker1.Date));
     // showmessage(datetostr(now));
      if datetimepicker1.Date < now then
        begin
          datetimepicker1.Color:=clRed;
         // showmessage(datetostr(datetimepicker1.Date));
        end
      else
        datetimepicker1.Color:=clWindow;
    end;
   //显示提示
  if DataM.txb_tab.FieldValues['所配车型']<>null then
    DBEdit1.Hint:=datam.Txb_Tab.FieldValues['所配车型'];
  if DataM.txb_tab.FieldValues['替代机型']<>null then
    DBEdit2.Hint:=datam.Txb_Tab.FieldValues['替代机型'];
  if DataM.txb_tab.FieldValues['动盘']<>null then
    DBEdit3.Hint:=datam.Txb_Tab.FieldValues['动盘'];
  if DataM.txb_tab.FieldValues['静盘']<>null then
    DBEdit4.Hint:=datam.Txb_Tab.FieldValues['静盘'];
  if DataM.txb_tab.FieldValues['机壳毛坯']<>null then
    DBEdit5.Hint:=datam.Txb_Tab.FieldValues['机壳毛坯'];
  if DataM.txb_tab.FieldValues['机壳成品']<>null then
    DBEdit6.Hint:=datam.Txb_Tab.FieldValues['机壳成品'];
  if DataM.txb_tab.FieldValues['前盖毛坯']<>null then
    DBEdit7.Hint:=datam.Txb_Tab.FieldValues['前盖毛坯'];
  if DataM.txb_tab.FieldValues['前盖成品']<>null then
    DBEdit8.Hint:=datam.Txb_Tab.FieldValues['前盖成品'];
  if DataM.txb_tab.FieldValues['45挡圈']<>null then
    DBEdit9.Hint:=datam.Txb_Tab.FieldValues['45挡圈'];
  if DataM.txb_tab.FieldValues['离合器']<>null then
    DBEdit10.Hint:=datam.Txb_Tab.FieldValues['离合器'];
  if DataM.txb_tab.FieldValues['离合器压线板']<>null then
    DBEdit11.Hint:=datam.Txb_Tab.FieldValues['离合器压线板'];
  if DataM.txb_tab.FieldValues['吸气口密封塞']<>null then
    DBEdit12.Hint:=datam.Txb_Tab.FieldValues['吸气口密封塞'];
  if DataM.txb_tab.FieldValues['排气口密封塞']<>null then
    DBEdit13.Hint:=datam.Txb_Tab.FieldValues['排气口密封塞'];
  if DataM.txb_tab.FieldValues['吸排气口压板']<>null then
    DBEdit14.Hint:=datam.Txb_Tab.FieldValues['吸排气口压板'];
  if DataM.txb_tab.FieldValues['吸排气口螺栓']<>null then
    DBEdit15.Hint:=datam.Txb_Tab.FieldValues['吸排气口螺栓'];
  if DataM.txb_tab.FieldValues['感温包']<>null then
    DBEdit16.Hint:=datam.Txb_Tab.FieldValues['感温包'];
  if DataM.txb_tab.FieldValues['感温包压板']<>null then
    DBEdit17.Hint:=datam.Txb_Tab.FieldValues['感温包压板'];
  if DataM.txb_tab.FieldValues['感温包螺栓']<>null then
    DBEdit18.Hint:=datam.Txb_Tab.FieldValues['感温包螺栓'];
  if DataM.txb_tab.FieldValues['感温包出线方式']<>null then
    DBEdit19.Hint:=datam.Txb_Tab.FieldValues['感温包出线方式'];
  if DataM.txb_tab.FieldValues['感温包出线长度']<>null then
    DBEdit20.Hint:=datam.Txb_Tab.FieldValues['感温包出线长度'];
  if DataM.txb_tab.FieldValues['销套型号']<>null then
    DBEdit21.Hint:=datam.Txb_Tab.FieldValues['销套型号'];
  if DataM.txb_tab.FieldValues['销套数量']<>null then
    DBEdit22.Hint:=datam.Txb_Tab.FieldValues['销套数量'];
  if DataM.txb_tab.FieldValues['销套压入方式']<>null then
    DBEdit23.Hint:=datam.Txb_Tab.FieldValues['销套压入方式'];

  // DataM.txb.FieldByName('试制期限').AsVariant := datetimepicker1.Date;
  if DataM.txb_tab.FieldValues['试制期限']<>null then
    datetimepicker1.Date :=DataM.txb_tab.FieldValues['试制期限']
  else
    datetimepicker1.Date :=now;
  //图片显示
  if (datam.TXB_Tab.FieldValues['扩展名']='.bmp') or (datam.Txb_Tab.FieldValues['扩展名']='.jpg')  then
    begin
      ext:=datam.Txb_Tab.FieldValues['扩展名'];
      show_picture;
      ext:='';
      panel1.Caption:='';
    end
  else
    begin
      image1.Picture.Graphic :=nil;
      panel1.Caption:='暂无图片';
    end;
end;

procedure TQuerryTxbFrm.show_picture;
var
  strm:tadoblobstream;
  bitmap:tbitmap;
  JPEGImage:TJPEGImage;
begin
  strm := tadoblobstream.Create(tblobfield(DataM.txb_tab.fieldbyname('图片')),bmread);
  // BMP、JPEG两种图像数据必需分别处理
  try //try1
    strm.position:=0;
    image1.Picture.Graphic := nil; //清除图像
    
    bitmap := tbitmap.Create ;
    JPEGImage:=tJPEGImage.Create;
    try //try11
      if ext='.bmp' then
        begin
          bitmap.LoadFromStream(strm);
          image1.Picture.Graphic := bitmap;
        end
      else
        if ext='.jpg' then
          begin
            JPEGImage.LoadFromStream(strm);
            image1.Picture.Graphic :=JPEGImage;
          end
        else
          image1.Picture.Graphic :=nil;
    finally
      bitmap.Free;
      JPEGImage.Free;
    end;         //end try11

  finally
    strm.Free ;
  end;     //end try1
end;

procedure TQuerryTxbFrm.Button2Click(Sender: TObject);
begin
  QuerryTxbFrm.Hide;
  storelhqfrm.hide;
  DataM.txb_tab.Close;
  datam.lhq_que.Close;
  PreQuerryTxbFrm.show;
end;

procedure TQuerryTxbFrm.Button3Click(Sender: TObject);
begin
  storelhqfrm.close;
  DataM.txb_tab.Close;
  datam.lhq_que.Close;
  prequerrytxbfrm.Close;
  close;
end;

end.
