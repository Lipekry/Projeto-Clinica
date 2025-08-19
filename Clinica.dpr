program Clinica;

uses
  Vcl.Forms,
  LoginView in 'Src\View\LoginView.pas' {FLoginView},
  Data in 'Src\Infraestructure\Data\Data.pas' {DM: TDataModule},
  ConnectionView in 'Src\View\ConnectionView.pas' {FConnectionConfig},
  ConnectionModel in 'Src\Model\Entity\ConnectionModel.pas',
  ConnectionController in 'Src\Controller\ConnectionController.pas',
  ConnectionService in 'Src\Service\ConnectionService.pas',
  ConnectionConfigDTO in 'Src\DTO\ConnectionConfigDTO.pas',
  ConnectionConfigurationRepositoryIni in 'Src\Model\Repository\Implementations\ConnectionConfigurationRepositoryIni.pas',
  ConnectionConfigurationRepository in 'Src\Model\Repository\Interfaces\ConnectionConfigurationRepository.pas',
  ConnectionConfigurationRepositoryJSON in 'Src\Model\Repository\Implementations\ConnectionConfigurationRepositoryJSON.pas',
  LoginController in 'Src\Controller\LoginController.pas',
  LoginDTO in 'Src\DTO\LoginDTO.pas',
  DatabaseHealthChecker in 'Src\Infraestructure\Data\DatabaseHealthChecker.pas',
  UserDTO in 'Src\DTO\UserDTO.pas',
  EditHelper in 'Src\View\Helpers\EditHelper.pas',
  MessageHelper in 'Src\View\Helpers\MessageHelper.pas',
  LoginService in 'Src\Service\LoginService.pas',
  UserModel in 'Src\Model\Entity\UserModel.pas',
  SessionDTO in 'Src\DTO\SessionDTO.pas',
  CRUDRepository in 'Src\Model\Repository\Interfaces\CRUDRepository.pas',
  UserRepository in 'Src\Model\Repository\Implementations\UserRepository.pas',
  LoginRepository in 'Src\Model\Repository\Interfaces\LoginRepository.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  ReportMemoryLeaksOnShutdown:= True;
  Application.CreateForm(TConn, Conn);
  Application.CreateForm(TFLoginView, FLoginView);
  Application.CreateForm(TFConnectionConfig, FConnectionConfig);
  Application.Run;
end.
