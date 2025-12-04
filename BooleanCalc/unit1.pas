unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, CheckLst,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    CheckGroup1: TCheckGroup;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

//  заменить условным оператором логическое выражение A:= B and C or D and E и проверить
//  совпадение результатов для всех возможных сочетаний B, C, D и E.

{ TForm1 }


procedure TForm1.Button1Click(Sender: TObject);
begin
  ListBox1.Clear();
end;

procedure TForm1.Button2Click(Sender: TObject);
  var
  i:integer;
  ent:string;
  a, b, c, d, e:boolean;
begin
   b := CheckGroup1.Checked[0];
   c := CheckGroup1.Checked[1];
   d := CheckGroup1.Checked[2];
   e := CheckGroup1.Checked[3];
   ent:=' ';
   if (b and c) or (d and e) = True then
   begin
     a:=True;
   end
   else
   begin
     a:=False;
   end;
   ListBox1.Items.Add(BoolToStr(b, true)+ent+BoolToStr(c, true)+ent+BoolToStr(d, true)+ent+BoolToStr(e, true)+ent+BoolToStr(a, true));
end;

end.

