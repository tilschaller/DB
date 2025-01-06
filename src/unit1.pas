unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, database;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
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
  types: array[0..1] of DB_TYPE;
  content: integer;
  op: ^Integer;
  output: integer;
begin
  createDatabase('Database 1');
  types[0] := DB_TYPE_INTEGER;
  createTable(getDB('Database 1'), 'Test Table', 1, 2, types);
  content := 696969;
  addContent(getTable(getDB('Database 1'), 'Test Table'), 0, 0, @content);
  content := 12345;
  addContent(getTable(getDB('Database 1'), 'Test Table'), 0, 1, @content);

  op:= getContent(getTable(getDB('Database 1'), 'Test Table'), 0, 0).content;
  output:=op^;
  Label1.Caption:=inttostr(output);

  op:= getContent(getTable(getDB('Database 1'), 'Test Table'), 0, 1).content;
  output:=op^;
  Label2.Caption:=inttostr(output);

end;

end.

