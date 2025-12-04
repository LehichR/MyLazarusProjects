unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    ButtonClearEdit: TButton;
    ButtonAdd: TButton;
    ButtonClear: TButton;
    ButtonClearRes: TButton;
    ButtonResearch: TButton;
    EditName: TEdit;
    EditSurname: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ListBoxNS: TListBox;
    ListBoxRes: TListBox;
    procedure ButtonAddClick(Sender: TObject);
    procedure ButtonClearClick(Sender: TObject);
    procedure ButtonClearEditClick(Sender: TObject);
    procedure ButtonClearResClick(Sender: TObject);
    procedure ButtonResearchClick(Sender: TObject);
    procedure EditNameKeyPress(Sender: TObject; var Key: char);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
const ent = ' ';
var
  EnterName, EnterSurname: string;
  IsActive: boolean = False;
procedure TForm1.ButtonAddClick(Sender: TObject);
begin
   IsActive:=True;
   EnterName:= EditName.Text;
   EnterSurname:=EditSurname.Text;
   if (EnterName <> '') and (EnterSurname <> '') then
      ListBoxNS.Items.Add(EnterName+ent+EnterSurname)
   else
      showmessage('Поле для ввода не может быть пустым!');
end;

procedure TForm1.ButtonClearClick(Sender: TObject);
begin
   ListBoxNS.Clear();
   IsActive:=False;
end;

procedure TForm1.ButtonClearEditClick(Sender: TObject);
begin
  EditName.Text:='';
  EditSurname.Text:='';
end;

procedure TForm1.ButtonClearResClick(Sender: TObject);
begin
  ListBoxRes.Clear();
end;

var
  i, space, k: integer;
  substring, current_element: string;
  ResElements: array[1..128] of string;
  AllNames, ResearchIsSuccess: boolean;
procedure TForm1.ButtonResearchClick(Sender: TObject);
begin
  ResearchIsSuccess:=False;
  AllNames:=False;
  k:=0;
  if IsActive = True then begin
    if (EditSurname.Text <> '') and (EditName.Text <> '') then begin
      AllNames:=True;
      substring:=EditName.Text+ent+EditSurname.Text;
      for i := 0 to ListBoxNS.Items.Count - 1 do begin
        current_element:=ListBoxNS.items[i];
        if current_element = substring then begin
          ResearchIsSuccess:=True;
          ListBoxRes.Items.Add(current_element);
        end;
      end;
    end;
    if AllNames = False then begin
      if (EditName.Text <> '') then begin
        substring:=EditName.Text;
        for i := 0 to ListBoxNS.Items.Count - 1 do
        begin
          current_element:=ListBoxNS.items[i];
          space:=pos(ent, current_element);
          k:=k+1;
          ResElements[k]:=copy(current_element, 1, space-1);
          if ResElements[k] = substring then begin
            ListBoxRes.Items.Add(current_element);
            ResearchIsSuccess:=True;
          end;
        end;
      end;
      if (EditSurname.Text <> '') then begin
        substring:=EditSurname.Text;
        for i := 0 to ListBoxNS.Items.Count - 1 do
        begin
          current_element:=ListBoxNS.items[i];
          space:=pos(ent, current_element);
          k:=k+1;
          ResElements[k]:=copy(current_element, space+1, length(current_element)-space+1);
          if ResElements[k] = substring then begin
            ListBoxRes.Items.Add(current_element);
            ResearchIsSuccess:=True;
          end;
        end;
      end;
      if (EditName.Text = '') and (EditSurname.Text = '') then
          showmessage('Поле для ввода не может быть пустым!');
  end;
  if ResearchIsSuccess = True then
     ListBoxRes.Items.Add('--------------')
  else begin
     ListBoxRes.Items.Add('Совпадений не найдено');
     ListBoxRes.Items.Add('--------------');
  end;
  end
  else
    showmessage('Сначала необходимо заполнить список именами');
end;

procedure TForm1.EditNameKeyPress(Sender: TObject; var Key: char);
begin
  begin
  if not ( (Key >= 'a') and (Key <= 'z') or
           (Key >= 'A') and (Key <= 'Z') or
           (Key >= 'а') and (Key <= 'я') or
           (Key >= 'А') and (Key <= 'Я') or
           (Key = #8) or                    // space
           (Key = #13) )                    // Enter
      then
      Key := #0;
  end;
end;

end.

