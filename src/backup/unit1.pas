unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids,
  ActnList, Menus,
  unit2, unit3, unit5, unit6, unit7, unit8, unit9;

type

  { TForm1 }

  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
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
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

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
     Label5.Caption := Form2.NameDB;
end;

procedure TForm1.MenuItem12Click(Sender: TObject);
begin
  //Öffne Form zum Einfügen von Inhalt in eine Zelle
  Form6.show();
end;

procedure TForm1.MenuItem13Click(Sender: TObject);
begin
  //Öffne Form, um Content zu löschen
  form10.show();
end;

procedure TForm1.MenuItem10Click(Sender: TObject);
begin
  //Öffne Form zum löschen von Column
  form9.show();
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

procedure TForm1.MenuItem7Click(Sender: TObject);
begin
  //Öffne Form zum löschen eines Tables
  form7.show();
end;

procedure TForm1.MenuItem8Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem9Click(Sender: TObject);
begin
  //Neue Spalte erstellen
  form8.show();
end;

end.

