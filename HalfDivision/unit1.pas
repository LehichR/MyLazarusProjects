unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
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

{ TForm1 }

procedure TForm1.Button2Click(Sender: TObject);
begin
  ListBox1.Clear();
  Label10.Caption:='  ';
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  eps, a, b, x, f_a, f_b, f_x:real;
begin
  try
    eps:=StrToFloat(Edit1.Text);
    a:=StrToFloat(Edit2.Text);
    b:=StrToFloat(Edit3.Text);
    if a < b then
      if eps > 0 then begin
        repeat
          x:=(a+b)/2;
          f_a:=(a*a*a+a-1);
          f_x:=(x*x*x+x-1);
          f_b:=(b*b*b+b-1);
          if (f_a*f_b) < 0 then begin
            if (f_a*f_x) < 0 then
              b:=x;
            if (f_x*f_b) < 0 then
              a:=x;
          end
          else
          begin
              break;
          end;
        until abs(b - a) < eps;
        if (f_a*f_b) < 0 then
           ListBox1.Items.Add(FloatToStr(x))
        else begin
            ListBox1.Items.Add('Ошибка.');
            showmessage('Ошибка. На данном отрезке нет корней.');
        end;
        Label10.Caption:=FloatToStr(eps);
      end
    else
    begin
        ListBox1.Items.Add('Ошибка.');
        showmessage('Ошибка. Точность не может быть меньше 0 или равняться 0.');
    end
    else
    begin
        ListBox1.Items.Add('Ошибка.');
        showmessage('Ошибка. Левая граница отрезка должна быть меньше правой границы.');
    end;

  except
     ListBox1.Items.Add('Ошибка.');
     showmessage('Точность и границы отрезца должны принадлежать множеству действительных чисел.');
  end;

  end;

end.

