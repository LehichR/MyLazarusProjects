unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Grids;

type

  { TForm1 }

  TForm1 = class(TForm)
    ButtonGo: TButton;
    ButtonClear: TButton;
    ButtonMin: TButton;
    ButtonAdd: TButton;
    EditSize: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    StringGridRes: TStringGrid;
    StringGridEnter: TStringGrid;
    procedure ButtonAddClick(Sender: TObject);
    procedure ButtonClearClick(Sender: TObject);
    procedure ButtonGoClick(Sender: TObject);
    procedure ButtonMinClick(Sender: TObject);
    procedure EditSizeKeyPress(Sender: TObject; var Key: char);
    procedure StringGridEnterKeyPress(Sender: TObject; var Key: char);

  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

var n: integer;
procedure TForm1.ButtonAddClick(Sender: TObject);
begin
  n := StrToInt(EditSize.Text);
  if n < 1 then n := 1;
  n := n + 1;
  StringGridEnter.ColCount := n;
  StringGridEnter.RowCount := n;
  EditSize.Text := IntToStr(n);
  StringGridRes.ColCount := n;
  StringGridRes.RowCount := n;
end;

procedure TForm1.ButtonMinClick(Sender: TObject);
begin
  n := StrToInt(EditSize.Text);
  if n > 1 then begin
    n := n - 1;
    StringGridEnter.ColCount := n;
    StringGridEnter.RowCount := n;
    EditSize.Text := IntToStr(n);
    StringGridRes.ColCount := n;
    StringGridRes.RowCount := n;
  end
  else
    ShowMessage('Минимальная размерность матрицы: 1');
end;

procedure TForm1.ButtonClearClick(Sender: TObject);
begin
  StringGridEnter.Clean;
  StringGridRes.Clean;
end;

var
  a, c: array of array of integer;
  i, j: integer;

procedure TForm1.ButtonGoClick(Sender: TObject);
begin
  n := StrToInt(EditSize.Text);
  if n <= 0 then
  begin
    ShowMessage('Размерность матрицы должна быть положительным числом!');
    Exit;
  end;
  SetLength(a, n, n);
  SetLength(c, n, n);
  try
    for i := 0 to n - 1 do begin
      for j := 0 to n - 1 do begin
        a[i, j] := StrToInt(StringGridEnter.Cells[j, i]);
      end;
    end;
    for i := 0 to n - 1 do begin
      for j := 0 to n - 1 do begin
        if j < i then begin
          c[i, j] := a[i, j];
        end
        else begin
          c[i, j] := (-1) * a[j, i];
        end;
        StringGridRes.Cells[j, i] := IntToStr(c[i, j]);
      end;
    end;

  except
    ShowMessage('Все ячейки матрицы должны быть числом!');
  end;
end;

procedure TForm1.EditSizeKeyPress(Sender: TObject; var Key: char);
begin
    if not ( (Key >= '0') and (Key <= '9') or (Key = #8) ) then Key := #0;
end;

procedure TForm1.StringGridEnterKeyPress(Sender: TObject; var Key: char);
begin
  begin
    if not ( (Key >= '0') and (Key <= '9') or
             (Key = '-') or
             (Key = '+') or
             (Key = #8) )                    // backspace
        then
        Key := #0;
    end;
end;


end.

