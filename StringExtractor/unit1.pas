unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);


  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.Button1Click(Sender: TObject);
var
  Res, elem: string;
  i, n: integer;
  number_1: real;
begin
  try
     Label5.Caption:=Edit1.Text;
     number_1:= StrToFloat(Edit1.Text);
     Res:=FloatToStr(number_1);
     n:=Length(Res);
     elem:='';
     for i:=1 to n do begin
         if i > 1 then begin
           elem:=elem + ', ';
         end;
         elem:=elem + Res[i];
     end;
     Label3.Caption:=elem;
     if Res[1] = '-' then begin
       Button1.Caption:=('Ошибка.');
       Label3.Caption:=('Ошибка.');
       showmessage('Необходимо ввести положительное число.')
     end;
  except
     Button1.Caption:=('Ошибка.');
     Label3.Caption:=('Ошибка.');
     showmessage('В поле необходимо ввести целое число.');
  end;
end;
end.

