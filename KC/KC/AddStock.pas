unit AddStock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Mask;

type
  TAddStockFrm = class(TForm)
    GroupBox2: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ComboBox1: TComboBox;
    Groupbox1: TGroupBox;
    Label6: TLabel;
    Memo1: TMemo;
    ADOTable1: TADOTable;
    ADOTable2: TADOTable;
    ADOTable3: TADOTable;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label5: TLabel;
    Edit3: TEdit;
    Label10: TLabel;
    Edit4: TEdit;
    Label11: TLabel;
    Edit5: TEdit;
    Label12: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Button3: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddStockFrm: TAddStockFrm;

implementation

uses Login;

{$R *.dfm}

procedure TAddStockFrm.FormShow(Sender: TObject);
begin
    combobox1.text:='';
    combobox2.text:='';
    combobox3.text:='';
    edit1.text:='';
    edit2.text:='';
    edit3.text:='';
    edit4.text:='';
    edit5.text:='';
    edit6.text:='';
    edit7.text:='';
    Maskedit1.text:=formatdatetime('yyyy"-"mm"-"dd',Date);
    Memo1.Text:='';
    


end;

procedure TAddStockFrm.Button2Click(Sender: TObject);
begin
    combobox1.text:='';
    combobox2.text:='';
    combobox3.text:='';
    edit1.text:='';
    edit2.text:='';
    edit3.text:='';
    edit4.text:='';
    edit5.text:='';
    edit6.text:='';
    edit7.text:='';
    Memo1.Text:='';
    
end;

procedure TAddStockFrm.ComboBox1Change(Sender: TObject);
begin
      with LoginFrm.ADOQuery1 do
      begin
       close;
       sql.clear;
       sql.add('select * from Feeder where FeederID='+''''+combobox1.text+'''');
       open;
       edit1.text:=fieldbyname('FeederName').asstring;
      end;
end;

procedure TAddStockFrm.ComboBox2Change(Sender: TObject);

begin

     with LoginFrm.ADOQuery1 do
      begin
       close;
       sql.clear;
       sql.add('select * from Depot where DepotID='+''''+Combobox2.text+'''');
       open;
       edit2.text:=fieldbyname('DepotName').asstring;
     end;
end;

procedure TAddStockFrm.ComboBox3Change(Sender: TObject);
begin
   
   with LoginFrm.ADOQuery1 do
      begin
       close;
       sql.clear;
       sql.add('select * from Product where ProductID='+''''+Combobox3.text+'''');
       open;
       edit3.text:=fieldbyname('ProductName').asstring;
       edit4.text:=fieldbyname('Spec').asstring;
       edit5.text:=fieldbyname('Unit').asstring;
     end;
end;

procedure TAddStockFrm.Button1Click(Sender: TObject);
var Payment,Quantity,Str1,str2:string;
    StockID,StorageID:integer;
begin
  if Combobox1.text='' then
    showmessage('请选择供货单位')
  else
    if Combobox2.text='' then
      showmessage('请选择仓库')
    else
      if Combobox3.text='' then
        showmessage('请选择入库货品')
      else
        if edit6.text='' then
          showmessage('请输入货品数量')
        else
          if edit7.text='' then
            showmessage('请输入货品单价')
          else
  begin
    Payment:=floattostr(strtofloat(edit6.text)*strtofloat(edit7.text));
    with LoginFrm.ADOQuery1 do
      begin
        close;
        sql.clear;
        sql.Add('select * from Stock');
        open;
        if recordcount=0 then
          StockID:=0
        else
          begin
            last;
            StockID:=recordcount;
          end;
        inc(StockID);
        str1:='Stoc';
        str1:=str1+inttostr(StockID);
        appendrecord([str1,combobox1.text,edit1.Text,combobox2.text,edit2.Text,combobox3.text,edit3.Text,edit4.Text,edit5.Text,edit6.Text,edit7.Text,Payment,maskEdit1.Text,memo1.Text]);

        close;
        sql.clear;
        sql.add('select * from Storage where DepotID='+''''+Combobox2.text+''''+'and ProductID='+''''+Combobox3.text+'''');
        open;
      // first;
       if recordcount<>0 then
         begin

          Quantity:=floattostr(strtofloat(Edit6.Text)+fieldbyname('Quantity').asfloat);
          edit;
          fieldvalues['Quantity']:=Quantity;
          post;
          end
       else
          begin
            close;
       sql.clear;
        sql.add('select * from Storage');
           open;
            if recordcount=0 then
            StorageID:=0
          else
            begin
             last;
              StorageID:=recordcount;
            end;
          inc(StorageID);
          str2:='Stor';
          str2:=str2+inttostr(StorageID);
          appendrecord([str2,combobox2.text,edit2.Text,combobox3.text,edit3.Text,edit4.Text,edit5.Text,edit6.Text]);

          end;


       
       showmessage('入库登记成功!') ;

      end;
   end;
end;

procedure TAddStockFrm.Button3Click(Sender: TObject);
begin
    AddStockFrm.hide;
    ADOtable1.Close;
    ADOtable2.Close;
    ADOtable3.Close;
end;

procedure TAddStockFrm.FormCreate(Sender: TObject);
begin
   ADOtable1.Open;
   ADOtable1.first;
   while not ADOtable1.eof do
      begin
       combobox1.items.insert(-1,ADOtable1.fieldbyname('FeederID').asstring);
       ADOtable1.Next;
      end;
   ADOtable2.Open;
   ADOtable2.first;
   while not ADOtable2.eof do
      begin
       combobox2.items.insert(-1,ADOtable2.fieldbyname('DepotID').asstring);
       ADOtable2.Next;
      end;
   ADOtable3.Open;
   ADOtable3.first;
   while not ADOtable3.eof do
      begin
       combobox3.items.insert(-1,ADOtable3.fieldbyname('ProductID').asstring);
       ADOtable3.Next;
      end;
end;

end.
