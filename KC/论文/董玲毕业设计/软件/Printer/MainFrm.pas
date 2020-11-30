unit MainFrm;
interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, Grids, DBGrids, DB, DBTables, Menus, StdCtrls, Spin,
  Gauges, ExtCtrls, ComCtrls;

type
  TMainForm = class(TForm)
    DS_print_contents: TDataSource;
    DBGrid1: TDBGrid;
    lblColumns: TLabel;
    i_header: TEdit;
    lblHeader: TLabel;
    FontDialog: TFontDialog;
    Q_print_contents: TQuery;
    StringGrid1: TStringGrid;
    procedure B_header_fontClick(Sender: TObject);
    procedure B_printClick(Sender: TObject);
  private
    PixelsInInchx: integer;
    LineHeight: Integer;
   { Keeps track of vertical space in pixels, printed on a page }
    AmountPrinted: integer;
   { Number of pixels in 1/10 of an inch. This is used for line spacing }
    TenthsOfInchPixelsY: integer;
    procedure PrintLine(Items: TStringList);
    procedure PrintHeader;
    procedure PrintColumnNames;
  end;

var
  MainForm: TMainForm;

implementation
uses printers, AbortFrm;

{$R *.DFM}

procedure TMainForm.PrintLine(Items: TStringList);
var
  OutRect: TRect;
  Inches: double;
  i: integer;
begin
  // ȷ����ӡ�߿��С
  OutRect.Left := 0;
  OutRect.Top := AmountPrinted;
  OutRect.Bottom := OutRect.Top + LineHeight;
  With Printer.Canvas do
    for i := 0 to Items.Count - 1 do
    begin
      Inches := longint(Items.Objects[i]) * 0.1;
      // ȷ���ұ߽�
      OutRect.Right := OutRect.Left + round(PixelsInInchx*Inches);
      if not Printer.Aborted then
       // ��ӡ��Ԫ������
        TextRect(OutRect, OutRect.Left, OutRect.Top, Items[i]);
      // ���ӱ߽�
      OutRect.Left := OutRect.Right;
    end;
  //�����Ѵ�ӡ�ĸ߶�
  AmountPrinted := AmountPrinted + TenthsOfInchPixelsY*2;
end;

procedure TMainForm.PrintHeader;
var
  SaveFont: TFont;
begin
  //���ڱ��浱ǰ����
  SaveFont := TFont.Create;
  try
    Savefont.Assign(Printer.Canvas.Font);
    Printer.Canvas.Font.Assign(i_header.Font);
    // ��ӡ��ͷ
    with Printer do
    begin
      if not Printer.Aborted then
        Canvas.TextOut((PageWidth div 2)-(Canvas.TextWidth(i_header.Text)
                         div 2),0, i_header.Text);
     // �����Ѵ�ӡ���и�AmountPrinted
      AmountPrinted := AmountPrinted + LineHeight+TenthsOfInchPixelsY;
    end;
    // �ָ�ԭ�е�����
    Printer.Canvas.Font.Assign(SaveFont);
  finally
    SaveFont.Free;
  end;
end;

procedure TMainForm.PrintColumnNames;
var
  ColNames: TStringList;
  i:integer;
begin
  //ColNames���ڱ�������ӡ��Ϣ
  ColNames := TStringList.Create;
  try
    // �ô����»��ߴ�ӡ����
    Printer.Canvas.Font.Style := [fsBold, fsUnderline];

    with ColNames do
    begin
      // �������Ϳ��
      for i:=0 to Q_print_contents.FieldCount-1 do
      begin
        AddObject(StringGrid1.Cells[0,i],  pointer(StrToInt(StringGrid1.Cells[1,i])));
      end;
    end;

    PrintLine(ColNames);
    Printer.Canvas.Font.Style := [];  
  finally
    ColNames.Free;   // �ͷ�ColNames
  end;
end;

procedure TMainForm.B_header_fontClick(Sender: TObject);
begin
  //��ʼ����ѡ��Ի��������
  FontDialog.Font.Assign(i_header.Font);
  if FontDialog.Execute then
    //�޸ı�������
    i_header.Font.Assign(FontDialog.Font);
end;

procedure TMainForm.B_printClick(Sender: TObject);
var
  Items: TStringList;
  i:integer;
begin
  //Items���ڱ����ӡһ�еĸ�ʽ��Ϣ
  Items := TStringList.Create;
  try
    //ȷ��ˮƽ����ÿinch��������
    PixelsInInchx := GetDeviceCaps(Printer.Handle, LOGPIXELSX);
    TenthsOfInchPixelsY := GetDeviceCaps(Printer.Handle,
                            LOGPIXELSY) div 10;
    AmountPrinted := 0;
    MainForm.Enabled := false; // ����ӡ������Ч
    try
      Printer.BeginDoc;
      AbortForm.Show;
      Application.ProcessMessages;
      //�õ�ǰ�������һ���ı��ĸ߶�
      LineHeight := Printer.Canvas.TextHeight('X')+TenthsOfInchPixelsY;
      if i_header.Text <> '' then
        PrintHeader;
      PrintColumnNames;
      Q_print_contents.First;
      //��ÿ�����ݺͿ�ȱ�����Items��
      while (not Q_print_contents.Eof) or Printer.Aborted do
      begin

        Application.ProcessMessages;
        with Items do
        begin
          for i:=0 to Q_print_contents.FieldCount-1 do
          begin
            AddObject(Q_print_contents.Fields[0].AsString,
                        pointer(StrToInt(StringGrid1.Cells[1,i])));
          end;//end for
        end;

        PrintLine(Items);
        //�жϷ�ҳ
        if AmountPrinted + LineHeight > Printer.PageHeight then
        begin
          AmountPrinted := 0;
          if not Printer.Aborted then
            Printer.NewPage;
          PrintHeader;
          PrintColumnNames;
        end;
        Items.Clear;
        Q_print_contents.Next;
      end;//��¼��ӡ���
      AbortForm.Hide;
      if not Printer.Aborted then
        Printer.EndDoc;
    finally
      MainForm.Enabled := true;
    end;
  finally
    Items.Free;
  end;
end;

end.
