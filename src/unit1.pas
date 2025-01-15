unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids,
  ActnList, Menus, database,
  unit2, unit3, unit5, unit6;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  loadTablePntr : ^DB_TABLE;
  DBpntr : ^DB;
  DBName, TBLName: array[0..9] of char;


implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  //Öffne Form zum Erstellen einer Datenbank
  form2.Show();

end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem14Click(Sender: TObject);
begin
end;

procedure TForm1.MenuItem12Click(Sender: TObject);
begin
  //Öffne Form zum Einfügen von Inhalt in eine Zelle
  Form6.show();
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i:integer;
begin


  if Length(Edit2.text) <> 10 then begin
        Edit2.Text := 'Name not right length';
        exit;
      end;

  for i := 0 to 9 do
  begin
    DBName[i] := Edit2.Text[i+1];
  end;

  DBpntr := getDB(DBName);

  if DBpntr = nil then begin
        Edit2.text:= 'Database with this name does not exist';
        exit;
      end;
end;


//Table
procedure TForm1.Button1Click(Sender: TObject);
var
  i:integer;
begin
  for i:=0 to 9 do
  begin
    TBLName[i] := Edit1.Text[i+1];
  end;

  if Length(Edit1.text) <> 10 then begin
        Edit1.Text := 'Name not right length';
        exit;
      end;
  loadTablePntr := getTable(DBpntr, TBLName);

  if loadTablePntr = nil then
     begin
           Edit1.Text:= 'Table with this name does not exist';
           exit;
     end;

  StringGrid1.ColCount:= loadTablePntr^.num_column +1;
  StringGrid1.RowCount:= loadTablePntr^.num_row +1;
end;



procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  //Öffne Form zum Löschen einer Datenbank
  form3.show();
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
 //Öffne Form zum erstellen eines neuen Tables
 form5.show();
end;

procedure TForm1.MenuItem8Click(Sender: TObject);
begin

end;

end.

