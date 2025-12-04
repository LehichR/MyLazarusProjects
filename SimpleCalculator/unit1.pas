unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure ButtonClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.ButtonClick(Sender: TObject);
var
  x, z: real;
  Res: string;

begin
  try
    x := StrToFloat(Edit1.Text);
  except
    on E:EConvertError do showmessage('Переменная X может содержать только вещественные числа!');

  end;
  if x = -1 then
     begin
          showmessage('Знаменатель не может быть равен 0!');
          Button1.Caption := ('Ошибка!');
     end
  else
      begin
        z := (x/(1+(sqr(x))/(1+(3*sqr(x)/(1+x)))));
        Res := FloatToStr(z);
        Button1.Caption := Res;
      end
end;

end.



