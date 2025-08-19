unit ConnectionConfigurationRepositoryJSON;

interface

uses ConnectionConfigurationRepository, ConnectionModel, System.SysUtils, System.IniFiles;

type
  TConnectionRepositoryJSON = class(TInterfacedObject, IConnectionConfigurationRepository)
  private
    FFolder: String;
    FArchive: String;
  public
    constructor Create(aFolder:String='';aArchive:String='');
    function Get:TConnectionModel;
    procedure Save(aConexaoModel:TConnectionModel);
    function BuildFullFilePath:String;
  end;

implementation

{ TConnectionRepositoryJSON }

constructor TConnectionRepositoryJSON.Create(aFolder, aArchive: String);
begin

end;

function TConnectionRepositoryJSON.Get: TConnectionModel;
begin
  Result:=nil;
end;

function TConnectionRepositoryJSON.BuildFullFilePath: String;
begin

end;

procedure TConnectionRepositoryJSON.Save(aConexaoModel: TConnectionModel);
begin

end;

end.
