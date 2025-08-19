unit ConnectionConfigurationRepositoryIni;

interface

uses ConnectionConfigurationRepository, ConnectionModel, System.SysUtils, System.IniFiles;

type
  TConnectionRepositoryIni = class(TInterfacedObject, IConnectionConfigurationRepository)
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

{ TConexaoRepository }

constructor TConnectionRepositoryIni.Create(aFolder: String = ''; aArchive: String = '');
begin
  inherited Create;
  Self.FFolder:=aFolder;
  Self.FArchive:=aArchive;
  if Self.FFolder='' then begin
    Self.FFolder := ExtractFilePath(ParamStr(0));
    Self.FFolder := ExpandFileName(Self.FFolder + '..\..\');
    Self.FFolder := IncludeTrailingPathDelimiter(Self.FFolder + 'Config');
  end;
  if Self.FArchive='' then Self.FArchive := 'Config.ini';
end;

function TConnectionRepositoryIni.BuildFullFilePath: String;
begin
  Result := IncludeTrailingPathDelimiter(Self.FFolder) + Self.FArchive;
end;

function TConnectionRepositoryIni.Get: TConnectionModel;
var iniFile: TIniFile;
begin
  iniFile:=TIniFile.Create(Self.BuildFullFilePath);
  try
    Result:=TConnectionModel.Create;
    Result.DriverName:=   iniFile.ReadString('Database', 'DriverName', '');
    Result.Server:=       iniFile.ReadString('Database', 'Server', '');
    Result.Port:=         iniFile.ReadString('Database', 'Port', '');
    Result.Database:=     iniFile.ReadString('Database', 'Database', '');
    Result.UserName:=     iniFile.ReadString('Database', 'UserName', '');
    Result.Password:=     iniFile.ReadString('Database', 'Password', '');
    Result.CharacterSet:= iniFile.ReadString('Database', 'CharacterSet', 'UTF8');
  finally
    iniFile.Free;
  end;
end;

procedure TConnectionRepositoryIni.Save(aConexaoModel: TConnectionModel);
var iniFile:TIniFile;
begin
  iniFile:=TIniFile.Create(Self.BuildFullFilePath);
  try
    iniFile.WriteString('Database', 'DriverName',   aConexaoModel.DriverName);
    iniFile.WriteString('Database', 'Server',       aConexaoModel.Server);
    iniFile.WriteString('Database', 'Port',         aConexaoModel.Port);
    iniFile.WriteString('Database', 'Database',     aConexaoModel.Database);
    iniFile.WriteString('Database', 'UserName',     aConexaoModel.UserName);
    iniFile.WriteString('Database', 'Password',     aConexaoModel.Password);
    iniFile.WriteString('Database', 'CharacterSet', aConexaoModel.CharacterSet);
  finally
    iniFile.Free;
  end;
end;

end.
