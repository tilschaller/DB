unit Unit3;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, database, unit4;

type

  { TForm3 }

  TForm3 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form3: TForm3;

implementation

{$R *.lfm}

{ TForm3 }

procedure TForm3.Button1Click(Sender: TObject);
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
          if db_names[i] = db_name then db_names[i]:='          ';
          if i=9 then begin
            Edit1.text:= 'Database does not exist';
            exit;
          end;
      end;
      deleteDatabase(getDB(db_name));
end;

end.

