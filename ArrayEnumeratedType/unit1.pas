unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    ButtonRandom: TButton;
    ButtonClearRes: TButton;
    ButtonCheck: TButton;
    ButtonClearM: TButton;
    Label1: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ListBox2: TListBox;
    ListBox1: TListBox;
    procedure ButtonRandomClick(Sender: TObject);
    procedure ButtonClearResClick(Sender: TObject);
    procedure ButtonCheckClick(Sender: TObject);
    procedure ButtonClearMClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
type
  name1 = (IVANOV, PETROV, KOBBOV, JAKOVLEV, CHERNOV, HITROV);
  name2 = (VASILY, URIY, IGOR, MIHAIL, OLEG, VICTOR);
var NIN2: array[name1] of name2;
  ESTTEZKY: boolean;
  a, b: name1;
  IsTrue: name2;
  IsActive: boolean = False;
  PrintRes1, PrintRes2:string;

procedure TForm1.ButtonRandomClick(Sender: TObject);
begin
  IsActive:=True;
  randomize;
  ListBox1.Items.Add('Составленный массив:');
  for a:=Low(NIN2) to High(NIN2) do begin
    NIN2[a]:=name2(Random(6));
    case ord(a) of
       0: PrintRes1:='Ivanov';
       1: PrintRes1:='Petrov';
       2: PrintRes1:='Kobbov';
       3: PrintRes1:='Jakovlev';
       4: PrintRes1:='Chernov';
       5: PrintRes1:='Hitrov';
    end;
    case ord(NIN2[a]) of
       0: PrintRes2:='Vasily';
       1: PrintRes2:='Uriy';
       2: PrintRes2:='Igor';
       3: PrintRes2:='Mihail';
       4: PrintRes2:='Oleg';
       5: PrintRes2:='Victor';
    end;
    ListBox1.Items.Add(PrintRes1 + '_' + PrintRes2);
  end;

end;




procedure TForm1.ButtonCheckClick(Sender: TObject);
begin
  if IsActive = False then
     showmessage('Сначала необходимо перемешать массив!')
  else begin
    ESTTEZKY:=False;
    ListBox2.Items.Add('Найденные совпадения:');
    for a:=IVANOV to CHERNOV do
       for b:=succ(a) to HITROV do begin
         if NIN2[a] = NIN2[b] then begin
            ESTTEZKY := True;
            IsTrue:=NIN2[a];
            case ord(IsTrue) of
               0: PrintRes2:='Vasily';
               1: PrintRes2:='Uriy';
               2: PrintRes2:='Igor';
               3: PrintRes2:='Mihail';
               4: PrintRes2:='Oleg';
               5: PrintRes2:='Victor';
            end;
            ListBox2.Items.Add(PrintRes2);
            Break;

         end
       end;

    if ESTTEZKY = False then
       ListBox2.Items.Add('Совпадений нет');

  end;

  ListBox2.Items.Add('--------------------');
  ListBox2.Items.Add('ESTTEZKY = ' + BoolToStr(ESTTEZKY, True));

end;

procedure TForm1.ButtonClearResClick(Sender: TObject);
begin
    ListBox2.Clear();
end;

procedure TForm1.ButtonClearMClick(Sender: TObject);
begin
  ListBox1.Clear();
end;

end.

