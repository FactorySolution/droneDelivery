program Drone;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {FrmMain},
  uDrone in 'model\uDrone.pas',
  DroneControllerInterface in 'controller\DroneControllerInterface.pas',
  DroneControllerImpl in 'controller\DroneControllerImpl.pas',
  DroneServiceInterface in 'service\DroneServiceInterface.pas',
  DroneServiceImpl in 'service\DroneServiceImpl.pas',
  AbstractList in 'service\abstract\AbstractList.pas',
  uDelivery in 'model\uDelivery.pas',
  DeliveryServiceInterface in 'service\DeliveryServiceInterface.pas',
  DeliveryServiceImpl in 'service\DeliveryServiceImpl.pas',
  DeliveryControllerInterface in 'controller\DeliveryControllerInterface.pas',
  DeliveryControllerImpl in 'controller\DeliveryControllerImpl.pas',
  TripServiceInterface in 'service\TripServiceInterface.pas',
  TripServiceImpl in 'service\TripServiceImpl.pas',
  uSent in 'model\uSent.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
