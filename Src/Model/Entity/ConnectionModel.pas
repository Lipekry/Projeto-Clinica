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
    if Self.DriverName='' then ListFails.Add('O atributo "DriverName" não foi definido');
    if Self.Server='' then ListFails.Add('O atributo "Server" não foi definido');
    if Self.Port='' then ListFails.Add('O atributo "Port" não foi definido');
    if Self.Database='' then ListFails.Add('O atributo "Database" não foi definido');
    if Self.UserName='' then ListFails.Add('O atributo "UserName" não foi definido');
    if Self.Password='' then ListFails.Add('O atributo "Password" não foi definido');

    if ListFails.Count>0 then raise Exception.Create(ListFails.Text);
  finally
    ListFails.Free;
  end;
end;

end.
