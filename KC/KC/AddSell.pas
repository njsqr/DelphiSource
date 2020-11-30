unit AddSell;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Mask;

type
  TAddSellFrm = class(TForm)
    Groupbox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label6: TLabel;
    Memo1: TMemo;
    MaskEdit1: TMaskEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ADOTable1: TADOTable;
    ADOTable2: TADOTable;
    ComboBox1: TComboBox;
    ADOTable3: TADOTable;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddSellFrm: TAddSellFrm;

implementation

uses Login;

{$R *.dfm}
procedure TAddSellFrm.FormCreate(Sender: TObject);
begin
  ADOtable1.Open;
  ADOtable1.first;
  while not ADOtable1.eof do
    begin
      combobox1.items.insert(-1,ADOtable1.fieldbyname('CustomerID').asstring);
      ADOtable1.Next;
    end;

  ADOtable2.Open;
  ADOtable2.first;
  while not ADOtable2.eof do
    begin
      combobox2.items.insert(-1,ADOtable2.fieldbyname('DepotID').asstring);
      ADOtable2.Next;
    end;

  {ADOtable3.Open;
  ADOtable3.first;
  while not ADOtable3.eof do
    begin
      combobox3.items.insert(-1,ADOtable3.fieldbyname('ProductID').asstring);
      ADOtable3.Next;
    end; }
end;

procedure TAddSellFrm.FormShow(Sender: TObject);
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

procedure TAddSellFrm.Button2Click(Sender: TObject);
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

procedure TAddSellFrm.Button3Click(Sender: TObject);
begin
     AddSellFrm.Hide;
     ADOtable1.Close;
     ADOtable2.Close;
     ADOtable3.Close;
end;

procedure TAddSellFrm.Button1Click(Sender: TObject);
var Payment,Quantity,str:string;
    SellID:integer;
begin
  if Combobox1.text='' then
    showmessage('请选择收货单位')
  else
    if Combobox2.text='' then
      showmessage('请选择仓库')
    else
      if Combobox3.text='' then
        showmessage('请选择出库货品')
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
        sql.add('select * from Storage where DepotID='+''''+Combobox2.text+''''+'and ProductID='+''''+Combobox3.text+'''');
        open;
        first;
        Quantity:=floattostr(fieldbyname('Quantity').AsFloat-strtofloat(Edit6.Text));
        if strtofloat(Quantity)<0 then
          showmessage('对不起，本类货品在此仓库中库存不够出库数量！')
        else
          begin
            //对库存信息表STORAGE中的数据进行更新
            edit;
            fieldvalues['Quantity']:=Quantity;
            post;
            //在出库信息表Sell增加一条出库数据记录
            close;
            sql.clear;
            sql.add('select * from Sell');
            open;
            if recordcount=0 then
              SellID:=0
            else
              begin
                last;
                SellID:=recordcount;
              end;
            inc(SellID);
            str:='Sell';
            str:=str+inttostr(SellID);
            appendrecord([str,combobox1.text,edit1.Text,combobox2.text,edit2.Text,combobox3.text,edit3.Text,edit4.Text,edit5.Text,edit6.Text,edit7.Text,payment,maskedit1.Text,memo1.Text]);

            showmessage('出库登记成功!') ;
          end;
      end;
  end;
end;

procedure TAddSellFrm.ComboBox1Change(Sender: TObject);
begin
  with LoginFrm.ADOQuery1 do
    begin
      close;
      sql.clear;
      sql.add('select * from Customer where CustomerID='+''''+combobox1.text+'''');
      open;
      edit1.text:=fieldbyname('CustomerName').asstring;
    end;
end;

procedure TAddSellFrm.ComboBox2Change(Sender: TObject);
var i:integer;
begin
  Combobox3.items.clear;
  combobox3.text:='';
  edit3.text:='';
  edit4.text:='';
  edit5.text:='';
  with LoginFrm.ADOQuery1 do
    begin
      close;
      sql.clear;
      sql.add('select * from Depot where DepotID='+''''+Combobox2.text+'''');
      open;
      edit2.text:=fieldbyname('DepotName').asstring;

      close;
      sql.clear;
      sql.add('select * from Storage where DepotID='+''''+Combobox2.text+'''');
      open;
      first;
      if recordcount=0 then
        showmessage('对不起，本仓库没有货品库存！')
      else
        showmessage(inttostr(recordcount));
        for i:=1 to recordcount do
          begin
            combobox3.items.insert(-1,Fieldbyname('ProductID').asstring);
            next;
          end;
    end;
end;



procedure TAddSellFrm.ComboBox3Change(Sender: TObject);
begin
     with LoginFrm.ADOQuery1 do
      begin
       close;
       sql.clear;
       sql.add('select * from Storage where DepotID='+''''+Combobox2.text+''''+'and ProductID='+''''+combobox3.text+'''');
       open;
       edit3.text:=fieldbyname('ProductName').asstring;
       edit4.text:=fieldbyname('Spec').asstring;
       edit5.text:=fieldbyname('Unit').asstring;
      end;
end;

end.
