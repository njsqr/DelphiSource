unit ModifyTxb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DBCtrls, ExtDlgs, ExtCtrls, Buttons,db,Adodb,Jpeg;
 //ADODB库有tadoblobstream.Create(tblobfield(DataM.tab_066.fieldbyname('图片')),bmread);
  // jpeg 库有tjpegimape;

type
  TModifyTxbFrm = class(TForm)
    SpeedButton1: TSpeedButton;
    RadioGroup1: TRadioGroup;
    Panel1: TPanel;
    Image1: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    Memo1: TMemo;
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
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    GroupBox2: TGroupBox;
    Label28: TLabel;
    Label27: TLabel;
    Label26: TLabel;
    Label25: TLabel;
    Label3: TLabel;
    Edit19: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    GroupBox1: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit9: TEdit;
    Edit8: TEdit;
    Edit7: TEdit;
    Edit6: TEdit;
    Edit5: TEdit;
    Edit4: TEdit;
    Edit3: TEdit;
    Edit25: TEdit;
    Edit24: TEdit;
    Edit2: TEdit;
    Edit11: TEdit;
    Edit10: TEdit;
    Edit1: TEdit;
    DBNavigator1: TDBNavigator;
    DateTimePicker1: TDateTimePicker;
    ComboBox2: TComboBox;
    ComboBox1: TComboBox;
    Button4: TButton;
    Button3: TButton;
    Button2: TButton;
    Button1: TButton;
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure Button4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }

    procedure show_picture;
    Procedure SaveData;
    Procedure SavePhoto;

  public
    { Public declarations }
  end;

var
  ModifyTxbFrm: TModifyTxbFrm;
   showext,ext:string;
implementation

uses Data, PreModifyTxb;

{$R *.dfm}

procedure TModifyTxbFrm.Button3Click(Sender: TObject);
begin
  DataM.txb_tab.Close;
  premodifytxbfrm.Close;
  close;
end;

procedure TModifyTxbFrm.Button2Click(Sender: TObject);
begin
  ModifyTxbFrm.Hide;
  DataM.txb_tab.Close;
  premodifytxbfrm.show;
end;

procedure TmodifyTxbFrm.show_picture;
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


Procedure TModifyTxbFrm.SaveData;
begin
  DataM.txb_tab.FieldByName('产品型号').AsString := Trim(edit1.Text);
  DataM.txb_tab.FieldByName('所配车型').AsString := Trim(edit2.Text);
  DataM.txb_tab.FieldByName('替代机型').AsString := Trim(edit11.Text);

  DataM.txb_tab.FieldByName('图纸状态').AsString := Trim(combobox1.Text);
  DataM.txb_tab.FieldByName('试制期限').AsVariant := datetimepicker1.Date;
  DataM.txb_tab.FieldByName('动盘').AsString := Trim(edit3.Text);
  DataM.txb_tab.FieldByName('静盘').AsString := Trim(edit4.Text);
  DataM.txb_tab.FieldByName('机壳毛坯').AsString := Trim(edit5.Text);
  DataM.txb_tab.FieldByName('机壳成品').AsString := Trim(edit6.Text);
  DataM.txb_tab.FieldByName('前盖毛坯').AsString := Trim(edit7.Text);
  DataM.txb_tab.FieldByName('前盖成品').AsString := Trim(edit8.Text);
  
  DataM.txb_tab.FieldByName('合盖方向').AsString := Trim(combobox2.Text);
  // 离合器
  DataM.txb_tab.FieldByName('45挡圈').AsString := Trim(edit9.Text);
  DataM.txb_tab.FieldByName('离合器').AsString := Trim(edit10.Text);
  DataM.txb_tab.FieldByName('离合器压线板').AsString := Trim(edit24.Text);
  //吸排气口
  DataM.txb_tab.FieldByName('吸气口密封塞').AsString := Trim(edit12.Text);
  DataM.txb_tab.FieldByName('排气口密封塞').AsString := Trim(edit13.Text);
  DataM.txb_tab.FieldByName('吸排气口压板').AsString := Trim(edit14.Text);
  DataM.txb_tab.FieldByName('吸排气口螺栓').AsString := Trim(edit15.Text);
   // 感温包
  DataM.txb_tab.FieldByName('感温包').AsString := Trim(edit19.Text);
  DataM.txb_tab.FieldByName('感温包压板').AsString := Trim(edit20.Text);
  DataM.txb_tab.FieldByName('感温包螺栓').AsString := Trim(edit21.Text);
  DataM.txb_tab.FieldByName('感温包出线方式').AsString := Trim(edit22.Text);
  DataM.txb_tab.FieldByName('感温包出线长度').AsString := Trim(edit23.Text);
   // 销套
  DataM.txb_tab.FieldByName('销套型号').AsString := Trim(edit16.Text);
  DataM.txb_tab.FieldByName('销套数量').AsString := Trim(edit17.Text);
  DataM.txb_tab.FieldByName('销套压入方式').AsString := Trim(edit18.Text);

  DataM.txb_tab.FieldByName('备注').AsString := Trim(edit25.Text);
  DataM.txb_tab.FieldByName('特殊说明').AsString := Trim(memo1.Text);

end;

Procedure TModifyTxbFrm.SavePhoto;
var
  strm:tmemorystream;
 // ext:string; 定为全局变量
begin
  if image1.picture.Graphic <> nil then //避免image1中无图像保存出错
    begin
      ext:=AnsiLowerCase(extractfileext(openpicturedialog1.FileName )); //取出文件的扩展名
     //AnsiLowerCase将字符小写
     // showmessage(ext);//在没有打开图片存贮时，会出掉‘.bmp .jpg'!
      //则下一名处理，保证能够显示图片
      if not((ext='.bmp') or (ext='.jpg')) then
        ext:=showext;
    // showmessage(ext);

      strm := tmemorystream.Create ;
      try
        image1.Picture.Graphic.SaveToStream(strm);
        DataM.txb_tab.Edit ;
        strm.Position :=0;
        tblobfield(DataM.txb_tab.FieldByName('图片')).LoadFromStream(strm);
        DataM.txb_tab.Post;
      finally
        strm.Free ; //笔者发现如strm采用tblobstream类，程序运行到该语句会出现问题
      end;
    end;
end;


procedure TModifyTxbFrm.Button1Click(Sender: TObject);
var sel:integer;

begin
  sel:=MessageBox(0,'要个修改该产品特性记录吗？','装配车间查询系统V1.0',MB_YESNO+MB_ICONQUESTION);

  if sel = IDYES then
     with datam.txb_tab do
       begin
         edit;
         SaveData;
         post;

         SavePhoto;
         edit;

         FieldValues['扩展名']:=ext;
         post;
         messagebox(modifytxbFrm.handle,'产品特性信息已经成功修改!','恭喜',mb_ok);
    end;

end;

procedure TModifyTxbFrm.SpeedButton1Click(Sender: TObject);
begin
  if openpicturedialog1.Execute then
    image1.Picture.LoadFromFile(openpicturedialog1.FileName );

end;

procedure TModifyTxbFrm.FormShow(Sender: TObject);
begin
  datam.DataSource6.DataSet:=datam.TXB_Tab;
  dbnavigator1.DataSource:=datam.DataSource6;

  edit1.Text :=DataM.txb_tab.FieldValues['产品型号'];
  radiogroup1.ItemIndex:=preModifyTxbFrm.radiogroup1.ItemIndex;

  if DataM.txb_tab.FieldValues['所配车型']<>null then
    edit2.Text :=DataM.txb_tab.FieldValues['所配车型']
  else  edit2.Text :='';

  if DataM.txb_tab.FieldValues['替代机型']<>null then
    edit11.Text :=DataM.txb_tab.FieldValues['替代机型']
  else edit11.Text :='';

  if DataM.txb_tab.FieldValues['图纸状态']='试制' then
    begin
      combobox1.ItemIndex:=0;
      Label4.Caption:='试制期限';
     // datetimepicker1.Visible:=true;
      end
  else
    if DataM.txb_tab.FieldValues['图纸状态']='受控' then
      begin
        combobox1.ItemIndex:=1;
        Label4.Caption:='受控日期';
      //  datetimepicker1.Visible:=false;
      end
    else
      combobox1.ItemIndex:=-1;
  if DataM.txb_tab.FieldValues['动盘']<>null then
    edit3.Text :=DataM.txb_tab.FieldValues['动盘']
  else  edit3.Text :='';
  if DataM.txb_tab.FieldValues['静盘']<>null then
    edit4.Text :=DataM.txb_tab.FieldValues['静盘']
  else  edit4.Text :='';
  if DataM.txb_tab.FieldValues['机壳毛坯']<>null then
    edit5.Text :=DataM.txb_tab.FieldValues['机壳毛坯']
  else  edit5.Text :='';
  if DataM.txb_tab.FieldValues['机壳成品']<>null then
  edit6.Text :=DataM.txb_tab.FieldValues['机壳成品']
  else  edit6.Text :='';
  if DataM.txb_tab.FieldValues['前盖毛坯']<>null then
    edit7.Text :=DataM.txb_tab.FieldValues['前盖毛坯']
  else  edit7.Text :='';
  if DataM.txb_tab.FieldValues['前盖成品']<>null then
  edit8.Text :=DataM.txb_tab.FieldValues['前盖成品']
    else  edit8.Text :='';
  if DataM.txb_tab.FieldValues['合盖方向']='向右' then
    combobox2.ItemIndex:=0
  else
    if DataM.txb_tab.FieldValues['合盖方向']='向左' then
      combobox2.ItemIndex:=1
    else
      if DataM.txb_tab.FieldValues['合盖方向']='向前' then
        combobox2.ItemIndex:=2
      else
        if DataM.txb_tab.FieldValues['合盖方向']='向后' then
          combobox2.ItemIndex:=3
        else
          combobox2.ItemIndex:=-1;
  if DataM.txb_tab.FieldValues['45挡圈']<>null then
    edit9.Text :=DataM.txb_tab.FieldValues['45挡圈']
  else  edit9.Text :='';
  if DataM.txb_tab.FieldValues['离合器']<>null then
    edit10.Text :=DataM.txb_tab.FieldValues['离合器']
  else  edit10.Text :='';
  if DataM.txb_tab.FieldValues['离合器压线板']<>null then
    edit24.Text :=DataM.txb_tab.FieldValues['离合器压线板']
  else  edit24.Text :='';
  //吸排气口
  if DataM.txb_tab.FieldValues['吸气口密封塞']<>null then
    edit12.Text :=DataM.txb_tab.FieldValues['吸气口密封塞']
  else  edit12.Text :='';
  if DataM.txb_tab.FieldValues['排气口密封塞']<>null then
    edit13.Text :=DataM.txb_tab.FieldValues['排气口密封塞']
  else  edit13.Text :='';
  if DataM.txb_tab.FieldValues['吸排气口压板']<>null then
    edit14.Text :=DataM.txb_tab.FieldValues['吸排气口压板']
  else  edit14.Text :='';
  if DataM.txb_tab.FieldValues['吸排气口螺栓']<>null then
    edit15.Text :=DataM.txb_tab.FieldValues['吸排气口螺栓']
  else  edit15.Text :='';

  // datetimepicker1.Date :=DataM.txb.FieldValues['试制期限'];
  if DataM.txb_tab.FieldValues['试制期限']<>null then
    datetimepicker1.Date :=DataM.txb_tab.FieldValues['试制期限']
  else
    datetimepicker1.Date :=now;
 //感温包
  if DataM.txb_tab.FieldValues['感温包']<>null then
    edit19.Text :=DataM.txb_tab.FieldValues['感温包']
  else  edit19.Text :='';
  if DataM.txb_tab.FieldValues['感温包压板']<>null then
    edit20.Text :=DataM.txb_tab.FieldValues['感温包压板']
  else  edit20.Text :='';
  if DataM.txb_tab.FieldValues['感温包螺栓']<>null then
  edit21.Text :=DataM.txb_tab.FieldValues['感温包螺栓']
  else  edit21.Text :='';
  if DataM.txb_tab.FieldValues['感温包出线方式']<>null then
   edit22.Text :=DataM.txb_tab.FieldValues['感温包出线方式']
  else
    edit22.Text :='';
  if DataM.txb_tab.FieldValues['感温包出线长度']<>null then
  edit23.Text :=DataM.txb_tab.FieldValues['感温包出线长度']
  else  edit23.Text :='';
 //销套
  if DataM.txb_tab.FieldValues['销套型号']<>null then
    edit16.Text :=DataM.txb_tab.FieldValues['销套型号']
  else  edit16.Text :='';
  if DataM.txb_tab.FieldValues['销套数量']<>null then
    edit17.Text :=DataM.txb_tab.FieldValues['销套数量']
  else  edit17.Text :='';
  if DataM.txb_tab.FieldValues['销套压入方式']<>null then
    edit18.Text :=DataM.txb_tab.FieldValues['销套压入方式']
  else  edit18.Text :='';

  if DataM.txb_tab.FieldValues['备注']<>null then
    edit25.Text :=DataM.txb_tab.FieldValues['备注']
  else  edit25.Text :='';
  if DataM.txb_tab.FieldValues['特殊说明']<>null then
    memo1.Text :=DataM.txb_tab.FieldValues['特殊说明']
  else  memo1.Text :='';

  //清空扩展名
  ext:='';

  if (datam.TXB_Tab.FieldValues['扩展名']='.bmp') or (datam.Txb_Tab.FieldValues['扩展名']='.jpg') then
    begin

      ext:=datam.Txb_Tab.FieldValues['扩展名'];
    //  showmessage(ext);
      show_picture;
      showext:=ext;
     // showmessage(showext);
      panel1.Caption:='';
    end
  else
    begin
      image1.Picture.Graphic :=nil;
      panel1.Caption:='暂无图片';
    end;
end;

procedure TModifyTxbFrm.FormCreate(Sender: TObject);
begin
 // datam.DataSource6.DataSet:=datam.TXB_Tab;
 // dbnavigator1.DataSource:=datam.DataSource6;
end;

procedure TModifyTxbFrm.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  FormShow(Sender);
end;

procedure TModifyTxbFrm.Button4Click(Sender: TObject);
begin
  if MessageDlg('确定要删除此条零件信息吗？',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    begin
    datam.txb_Tab.Delete;
    showmessage('此条特性表已经成功删除！');
    FormShow(Sender);
    end;
end;

procedure TModifyTxbFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DataM.txb_tab.Close;
  premodifytxbfrm.Close;
end;

procedure TModifyTxbFrm.ComboBox1Change(Sender: TObject);
begin
  if combobox1.ItemIndex=1 then
    begin
      Label4.Caption:='受控日期';
      datetimepicker1.SetFocus;
    end
  else
    begin
      Label4.Caption:='试制期限';
      datetimepicker1.SetFocus;
    end;
end;

end.
