unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    ButtonCheck: TButton;
    ButtonRandom: TButton;
    ButtonClean: TButton;
    ButtonMin: TButton;
    ButtonAdd: TButton;
    EditSize: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    StringGridEnter1: TStringGrid;
    StringGridEnter2: TStringGrid;
    StringGridRes: TStringGrid;
    procedure ButtonAddClick(Sender: TObject);
    procedure ButtonCheckClick(Sender: TObject);
    procedure ButtonCleanClick(Sender: TObject);
    procedure ButtonMinClick(Sender: TObject);
    procedure ButtonRandomClick(Sender: TObject);
    procedure EditSizeKeyPress(Sender: TObject; var Key: char);
    procedure StringGridEnter1KeyPress(Sender: TObject; var Key: char);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

procedure EdSize(Ed1, Ed2, Res: TStringGrid; EDS: TEdit; n: integer);
begin
  Ed1.ColCount := n;
  Ed1.RowCount := n;
  EDS.Text := IntToStr(n);
  Ed2.ColCount := n;
  Ed2.RowCount := n;
  Res.ColCount := n;
  Res.RowCount := n;
end;

type
  arr = array of array of integer;
var
  a, c: arr;
  n: integer;
procedure TForm1.ButtonAddClick(Sender: TObject);
begin
  n := StrToInt(EditSize.Text);
  if n < 1 then n := 1;
  if n > 32 then n := 32;
  if n < 32 then begin
    n := n + 1;
    EdSize(StringGridEnter1, StringGridEnter2, StringGridRes, EditSize, n);
  end
  else
    ShowMessage('Максимальная размерность матрицы: 32');
end;

procedure TForm1.ButtonMinClick(Sender: TObject);
begin
  n := StrToInt(EditSize.Text);
  if n > 1 then
  begin
    if n > 32 then n := 32;
    n := n - 1;
    EdSize(StringGridEnter1, StringGridEnter2, StringGridRes, EditSize, n);
  end
  else
    ShowMessage('Минимальная размерность матрицы: 1');
end;

function CountNegativeRows(matrix: arr; n: integer): integer;
var
  i, j: integer;
  allNegative: boolean;
begin
  Result := 0;
  for i := 0 to n - 1 do begin
    allNegative := true;
    for j := 0 to n - 1 do begin
      if matrix[i, j] >= 0 then begin
        allNegative := false;
        break;
      end;
    end;
    if allNegative then
      Inc(Result);
  end;
end;

procedure CopyMatrixToGrid(matrix: arr; grid: TStringGrid; n: integer);
var
  i, j: integer;
begin
  for i := 0 to n - 1 do
    for j := 0 to n - 1 do
      grid.Cells[j, i] := IntToStr(matrix[i, j]);
end;

procedure TForm1.ButtonRandomClick(Sender: TObject);
var
  i, j: integer;
begin
  try
    n := StrToInt(EditSize.Text);
    if (n <= 0) and (n > 32) then begin
      ShowMessage('Матрица должна быть правильной размерности! Max:32, Min:1.');
      Exit;
    end;
    SetLength(a, n, n);
    SetLength(c, n, n);
    Randomize;
    for i := 0 to n - 1 do
      for j := 0 to n - 1 do begin
          a[i, j] := random(200) - 100;
          c[i, j] := random(200) - 100;
      end;
    CopyMatrixToGrid(a, StringGridEnter1, n);
    CopyMatrixToGrid(c, StringGridEnter2, n);
  except
     ShowMessage('Матрица должна быть правильной размерности! Max:32, Min:1.');
  end;
end;

procedure TForm1.ButtonCheckClick(Sender: TObject);
var
  i, j: integer;
  countA, countC: integer;
begin
  n := StrToInt(EditSize.Text);
  if n <= 0 then begin
    ShowMessage('Размерность матрицы должна быть положительным числом!');
    Exit;
  end;

  SetLength(a, n, n);
  SetLength(c, n, n);

  try
    for i := 0 to n - 1 do
      for j := 0 to n - 1 do begin
        if StringGridEnter1.Cells[j, i] <> '' then
          a[i, j] := StrToInt(StringGridEnter1.Cells[j, i])
        else
          a[i, j] := 0;

        if StringGridEnter2.Cells[j, i] <> '' then
          c[i, j] := StrToInt(StringGridEnter2.Cells[j, i])
        else
          c[i, j] := 0;
      end;

    countA := CountNegativeRows(a, n);
    countC := CountNegativeRows(c, n);

    StringGridRes.Clean();

    if countA > countC then begin
      CopyMatrixToGrid(a, StringGridRes, n);
      ShowMessage('В первой матрице больше строк с отрицательными элементами: ' +
                  IntToStr(countA) + ' против ' + IntToStr(countC));
    end
    else if countC > countA then begin
      CopyMatrixToGrid(c, StringGridRes, n);
      ShowMessage('Во второй матрице больше строк с отрицательными элементами: ' +
                  IntToStr(countC) + ' против ' + IntToStr(countA));
    end
    else begin
      ShowMessage('Количество строк с отрицательными элементами одинаково: ' +
                  IntToStr(countA));
      CopyMatrixToGrid(a, StringGridRes, n);
    end;

  except
      ShowMessage('Матрица должна быть правильной размерности! Max:32, Min:1.');
  end;
end;

procedure TForm1.ButtonCleanClick(Sender: TObject);
begin
  StringGridEnter1.Clean();
  StringGridEnter2.Clean();
  StringGridRes.Clean();
end;

procedure TForm1.EditSizeKeyPress(Sender: TObject; var Key: char);
begin
  if not ( (Key >= '0') and (Key <= '9') or (Key = #8) ) then Key := #0;
end;

procedure TForm1.StringGridEnter1KeyPress(Sender: TObject; var Key: char);
begin
  if not ( (Key >= '0') and (Key <= '9') or
           (Key = '-') or
           (Key = '+') or
           (Key = #8) ) then  // backspace
    Key := #0;
end;

end.
