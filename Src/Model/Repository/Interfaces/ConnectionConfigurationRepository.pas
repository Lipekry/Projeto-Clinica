unit ConnectionConfigurationRepository;

interface

uses ConnectionModel;

type

  IConnectionConfigurationRepository = interface
    ['{803A5AF4-CE17-4E4B-9BFC-9FFE692692DC}']
    function Get:TConnectionModel;
    procedure Save(aConexaoModel:TConnectionModel);
    function BuildFullFilePath:String;
  end;

implementation

end.
