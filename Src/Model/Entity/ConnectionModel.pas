unit ConnectionModel;

interface

uses System.Classes, system.SysUtils;

type

  TConnectionModel = class
  public
    DriverName:String;
    Server:String;
    Port:String;
    Database:String;
    UserName:String;
    Password:String;
    CharacterSet:String;
    procedure Validate;
  end;

implementation

{ TConexaoModel }

procedure TConnectionModel.Validate;
var ListFails:TStringList;
begin
  ListFails:=TStringList.Create;
  try
    if Self.DriverName='' then ListFails.Add('O atributo "DriverName" n�o foi definido');
    if Self.Server='' then ListFails.Add('O atributo "Server" n�o foi definido');
    if Self.Port='' then ListFails.Add('O atributo "Port" n�o foi definido');
    if Self.Database='' then ListFails.Add('O atributo "Database" n�o foi definido');
    if Self.UserName='' then ListFails.Add('O atributo "UserName" n�o foi definido');
    if Self.Password='' then ListFails.Add('O atributo "Password" n�o foi definido');

    if ListFails.Count>0 then raise Exception.Create(ListFails.Text);
  finally
    ListFails.Free;
  end;
end;

end.
