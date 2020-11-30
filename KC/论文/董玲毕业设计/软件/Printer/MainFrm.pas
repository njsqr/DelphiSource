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
  // 确定打印边框大小
  OutRect.Left := 0;
  OutRect.Top := AmountPrinted;
  OutRect.Bottom := OutRect.Top + LineHeight;
  With Printer.Canvas do
    for i := 0 to Items.Count - 1 do
    begin
      Inches := longint(Items.Objects[i]) * 0.1;
      // 确定右边界
      OutRect.Right := OutRect.Left + round(PixelsInInchx*Inches);
      if not Printer.Aborted then
       // 打印单元格内容
        TextRect(OutRect, OutRect.Left, OutRect.Top, Items[i]);
      // 连接边界
      OutRect.Left := OutRect.Right;
    end;
  //增加已打印的高度
  AmountPrinted := AmountPrinted + TenthsOfInchPixelsY*2;
end;

procedure TMainForm.PrintHeader;
var
  SaveFont: TFont;
begin
  //用于保存当前字体
  SaveFont := TFont.Create;
  try
    Savefont.Assign(Printer.Canvas.Font);
    Printer.Canvas.Font.Assign(i_header.Font);
    // 打印表头
    with Printer do
    begin
      if not Printer.Aborted then
        Canvas.TextOut((PageWidth div 2)-(Canvas.TextWidth(i_header.Text)
                         div 2),0, i_header.Text);
     // 增加已打印的行高AmountPrinted
      AmountPrinted := AmountPrinted + LineHeight+TenthsOfInchPixelsY;
    end;
    // 恢复原有的字体
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
  //ColNames用于保存标题打印信息
  ColNames := TStringList.Create;
  try
    // 用粗体下划线打印标题
    Printer.Canvas.Font.Style := [fsBold, fsUnderline];

    with ColNames do
    begin
      // 保存标题和宽度
      for i:=0 to Q_print_contents.FieldCount-1 do
      begin
        AddObject(StringGrid1.Cells[0,i],  pointer(StrToInt(StringGrid1.Cells[1,i])));
      end;
    end;

    PrintLine(ColNames);
    Printer.Canvas.Font.Style := [];  
  finally
    ColNames.Free;   // 释放ColNames
  end;
end;

procedure TMainForm.B_header_fontClick(Sender: TObject);
begin
  //初始字体选择对话框的字体
  FontDialog.Font.Assign(i_header.Font);
  if FontDialog.Execute then
    //修改标题字体
    i_header.Font.Assign(FontDialog.Font);
end;

procedure TMainForm.B_printClick(Sender: TObject);
var
  Items: TStringList;
  i:integer;
begin
  //Items用于保存打印一行的格式信息
  Items := TStringList.Create;
  try
    //确定水平方向每inch的像素数
    PixelsInInchx := GetDeviceCaps(Printer.Handle, LOGPIXELSX);
    TenthsOfInchPixelsY := GetDeviceCaps(Printer.Handle,
                            LOGPIXELSY) div 10;
    AmountPrinted := 0;
    MainForm.Enabled := false; // 主打印窗体无效
    try
      Printer.BeginDoc;
      AbortForm.Show;
      Application.ProcessMessages;
      //用当前字体计算一行文本的高度
      LineHeight := Printer.Canvas.TextHeight('X')+TenthsOfInchPixelsY;
      if i_header.Text <> '' then
        PrintHeader;
      PrintColumnNames;
      Q_print_contents.First;
      //将每行内容和宽度保存在Items中
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
        //判断分页
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
      end;//记录打印完毕
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
