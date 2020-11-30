unit QuerryTxb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DBCtrls, Mask, ExtCtrls,db,adodb,jpeg;

  //ADODB����tadoblobstream.Create(tblobfield(DataM.tab_066.fieldbyname('ͼƬ')),bmread);
  // jpeg ����tjpegimape;

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
  DBEdit27.DataField:='��Ʒ�ͺ�';
  DBEdit1.DataSource:= datam.DataSource6;
  DBEdit1.DataField:='���䳵��';
  DBEdit2.DataSource:= datam.DataSource6;
  DBEdit2.DataField:='�������';

  DBEdit24.DataSource:= datam.DataSource6;
  DBEdit24.DataField:='ͼֽ״̬';
  //��������    //
  DBEdit3.DataSource:= datam.DataSource6;
  DBEdit3.DataField:='����';
  DBEdit4.DataSource:= datam.DataSource6;
  DBEdit4.DataField:='����';
  DBEdit5.DataSource:= datam.DataSource6;
  DBEdit5.DataField:='����ë��';
  DBEdit6.DataSource:= datam.DataSource6;
  DBEdit6.DataField:='���ǳ�Ʒ';
  DBEdit7.DataSource:= datam.DataSource6;
  DBEdit7.DataField:='ǰ��ë��';
  DBEdit8.DataSource:= datam.DataSource6;
  DBEdit8.DataField:='ǰ�ǳ�Ʒ';
  DBEdit25.DataSource:= datam.DataSource6;
  DBEdit25.DataField:='�ϸǷ���';
  // �����
  DBEdit9.DataSource:= datam.DataSource6;
  DBEdit9.DataField:='45��Ȧ';
  DBEdit10.DataSource:= datam.DataSource6;
  DBEdit10.DataField:='�����';
  DBEdit11.DataSource:= datam.DataSource6;
  DBEdit11.DataField:='�����ѹ�߰�';
  // ��������
  DBEdit12.DataSource:= datam.DataSource6;
  DBEdit12.DataField:='�������ܷ���';
  DBEdit13.DataSource:= datam.DataSource6;
  DBEdit13.DataField:='�������ܷ���';
  DBEdit14.DataSource:= datam.DataSource6;
  DBEdit14.DataField:='��������ѹ��';
  DBEdit15.DataSource:= datam.DataSource6;
  DBEdit15.DataField:='����������˨';

  //���°�
  DBEdit16.DataSource:= datam.DataSource6;
  DBEdit16.DataField:='���°�';
  DBEdit17.DataSource:= datam.DataSource6;
  DBEdit17.DataField:='���°�ѹ��';
  DBEdit18.DataSource:= datam.DataSource6;
  DBEdit18.DataField:='���°���˨';
  DBEdit19.DataSource:= datam.DataSource6;
  DBEdit19.DataField:='���°����߷�ʽ';
  DBEdit20.DataSource:= datam.DataSource6;
  DBEdit20.DataField:='���°����߳���';
  // ����
  DBEdit21.DataSource:= datam.DataSource6;
  DBEdit21.DataField:='�����ͺ�';
  DBEdit22.DataSource:= datam.DataSource6;
  DBEdit22.DataField:='��������';
  DBEdit23.DataSource:= datam.DataSource6;
  DBEdit23.DataField:='����ѹ�뷽ʽ';

  DBEdit26.DataSource:= datam.DataSource6;
  DBEdit26.DataField:='��ע';
  DBmemo1.DataSource:= datam.DataSource6;
  DBmemo1.DataField:='����˵��';
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
  // Label4�ĸı�
  if dbedit24.Text='�ܿ�' then
    begin
      Label4.Caption:='�ܿ�����';
      datetimepicker1.Color:=clWindow;
    end
  else
    begin
      Label4.Caption:='��������';
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
   //��ʾ��ʾ
  if DataM.txb_tab.FieldValues['���䳵��']<>null then
    DBEdit1.Hint:=datam.Txb_Tab.FieldValues['���䳵��'];
  if DataM.txb_tab.FieldValues['�������']<>null then
    DBEdit2.Hint:=datam.Txb_Tab.FieldValues['�������'];
  if DataM.txb_tab.FieldValues['����']<>null then
    DBEdit3.Hint:=datam.Txb_Tab.FieldValues['����'];
  if DataM.txb_tab.FieldValues['����']<>null then
    DBEdit4.Hint:=datam.Txb_Tab.FieldValues['����'];
  if DataM.txb_tab.FieldValues['����ë��']<>null then
    DBEdit5.Hint:=datam.Txb_Tab.FieldValues['����ë��'];
  if DataM.txb_tab.FieldValues['���ǳ�Ʒ']<>null then
    DBEdit6.Hint:=datam.Txb_Tab.FieldValues['���ǳ�Ʒ'];
  if DataM.txb_tab.FieldValues['ǰ��ë��']<>null then
    DBEdit7.Hint:=datam.Txb_Tab.FieldValues['ǰ��ë��'];
  if DataM.txb_tab.FieldValues['ǰ�ǳ�Ʒ']<>null then
    DBEdit8.Hint:=datam.Txb_Tab.FieldValues['ǰ�ǳ�Ʒ'];
  if DataM.txb_tab.FieldValues['45��Ȧ']<>null then
    DBEdit9.Hint:=datam.Txb_Tab.FieldValues['45��Ȧ'];
  if DataM.txb_tab.FieldValues['�����']<>null then
    DBEdit10.Hint:=datam.Txb_Tab.FieldValues['�����'];
  if DataM.txb_tab.FieldValues['�����ѹ�߰�']<>null then
    DBEdit11.Hint:=datam.Txb_Tab.FieldValues['�����ѹ�߰�'];
  if DataM.txb_tab.FieldValues['�������ܷ���']<>null then
    DBEdit12.Hint:=datam.Txb_Tab.FieldValues['�������ܷ���'];
  if DataM.txb_tab.FieldValues['�������ܷ���']<>null then
    DBEdit13.Hint:=datam.Txb_Tab.FieldValues['�������ܷ���'];
  if DataM.txb_tab.FieldValues['��������ѹ��']<>null then
    DBEdit14.Hint:=datam.Txb_Tab.FieldValues['��������ѹ��'];
  if DataM.txb_tab.FieldValues['����������˨']<>null then
    DBEdit15.Hint:=datam.Txb_Tab.FieldValues['����������˨'];
  if DataM.txb_tab.FieldValues['���°�']<>null then
    DBEdit16.Hint:=datam.Txb_Tab.FieldValues['���°�'];
  if DataM.txb_tab.FieldValues['���°�ѹ��']<>null then
    DBEdit17.Hint:=datam.Txb_Tab.FieldValues['���°�ѹ��'];
  if DataM.txb_tab.FieldValues['���°���˨']<>null then
    DBEdit18.Hint:=datam.Txb_Tab.FieldValues['���°���˨'];
  if DataM.txb_tab.FieldValues['���°����߷�ʽ']<>null then
    DBEdit19.Hint:=datam.Txb_Tab.FieldValues['���°����߷�ʽ'];
  if DataM.txb_tab.FieldValues['���°����߳���']<>null then
    DBEdit20.Hint:=datam.Txb_Tab.FieldValues['���°����߳���'];
  if DataM.txb_tab.FieldValues['�����ͺ�']<>null then
    DBEdit21.Hint:=datam.Txb_Tab.FieldValues['�����ͺ�'];
  if DataM.txb_tab.FieldValues['��������']<>null then
    DBEdit22.Hint:=datam.Txb_Tab.FieldValues['��������'];
  if DataM.txb_tab.FieldValues['����ѹ�뷽ʽ']<>null then
    DBEdit23.Hint:=datam.Txb_Tab.FieldValues['����ѹ�뷽ʽ'];

  // DataM.txb.FieldByName('��������').AsVariant := datetimepicker1.Date;
  if DataM.txb_tab.FieldValues['��������']<>null then
    datetimepicker1.Date :=DataM.txb_tab.FieldValues['��������']
  else
    datetimepicker1.Date :=now;
  //ͼƬ��ʾ
  if (datam.TXB_Tab.FieldValues['��չ��']='.bmp') or (datam.Txb_Tab.FieldValues['��չ��']='.jpg')  then
    begin
      ext:=datam.Txb_Tab.FieldValues['��չ��'];
      show_picture;
      ext:='';
      panel1.Caption:='';
    end
  else
    begin
      image1.Picture.Graphic :=nil;
      panel1.Caption:='����ͼƬ';
    end;
end;

procedure TQuerryTxbFrm.show_picture;
var
  strm:tadoblobstream;
  bitmap:tbitmap;
  JPEGImage:TJPEGImage;
begin
  strm := tadoblobstream.Create(tblobfield(DataM.txb_tab.fieldbyname('ͼƬ')),bmread);
  // BMP��JPEG����ͼ�����ݱ���ֱ���
  try //try1
    strm.position:=0;
    image1.Picture.Graphic := nil; //���ͼ��
    
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
