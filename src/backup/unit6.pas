unit Unit6;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Spin,
  ExtCtrls, database;

type

  { TForm6 }

  TForm6 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Row: TSpinEdit;
    Column: TSpinEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form6: TForm6;
  dbName, tableName: array[0..9] of char;
  DB_PNTR: ^DB;
  TBL_PNTR: ^DB_Table;
  choosenRow, choosenColumn: integer;
implementation

{$R *.lfm}

{ TForm6 }

procedure TForm6.FormCreate(Sender: TObject);
begin
  GroupBox1.Hide;
  GroupBox2.Hide;
end;

procedure TForm6.Button1Click(Sender: TObject);
var
  i:integer;
begin
  for i:=0 to 9 do
  begin
    dbName[i] := Edit1.Text[i+1];
  end;

  DB_PNTR := getDB(dbName);

  if DB_PNTR = nil then begin
        Edit1.text:= 'Database with this name does not exist';
        exit;
      end;




end;

procedure TForm6.Button4Click(Sender: TObject);
var
  i:integer;
begin
     for i:=0 to 9 do
     begin
       tableName[i] := Edit3.Text[i+1];
     end;

     TBL_PNTR := getTable(DB_PNTR, tableName);

     if TBL_PNTR = nil then
     begin
           Edit3.Text:= 'Table with this name does not exist';
           exit;
     end;

     column.MaxValue:= TBL_PNTR^.num_column;

     GroupBox1.Show;
end;

procedure TForm6.Button2Click(Sender: TObject);
begin
  choosenRow:= row.value;
  choosenColumn := column.value;

  GroupBox2.Show;
end;

procedure TForm6.Button3Click(Sender: TObject);
begin
  addContent(nil, column.Value, row.Value, nil);
end;



end.

