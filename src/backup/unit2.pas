unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, database, unit4;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.Button1Click(Sender: TObject);
var db_name: array[0..9] of char;
    i: integer;
begin
      if Length(Edit1.text) <> 10 then begin
        Edit1.Text := 'Name not right length';
        exit;
      end;
      for i:=0 to 9 do begin
          db_name[i] := Edit1.text[i];
      end;
      for i:=0 to 9 do begin
          if db_name[i]='          ' then begin
            db_names[i]:=db_name;
            break;
          end;
          if i=9 then begin
            Edit1.text:='Too many databases';
            exit;
          end;
      end;
      createDatabase(db_name);
      form2.hide();
end;

end.

