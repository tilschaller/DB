unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, database;

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
      if Length(Edit1.text) <> 10 then Edit1.Text := 'Name not right length'
      else begin
        for i:=0 to 9 do begin
           db_name[i] := Edit1.text[i];
        end;
        createDatabase(db_name);
      end;
end;

end.

