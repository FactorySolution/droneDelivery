unit DroneControllerImpl;

interface

uses
  DroneControllerInterface,
  uDrone,
  DroneServiceInterface, System.Generics.Collections;

type
  TDroneController = class(TInterfacedObject, IDroneController)
  private
    FDroneService: IDroneservice;
  public
    function Save(const ADrone: TDrone) : IDroneController;
    function GetDroneList: TObjectList<TDrone>;


    class function New(const ADroneservice: IDroneservice): IDroneController;

    constructor Create(const ADroneservice: IDroneservice);
    destructor Destroy; override;

  end;

implementation

{ TDroneController }

constructor TDroneController.Create(const ADroneservice: IDroneservice);
begin
  FDroneService := ADroneservice;
end;

destructor TDroneController.Destroy;
begin

  inherited;
end;

function TDroneController.GetDroneList: TObjectList<TDrone>;
begin
  Result := FDroneService.GetDroneList;
end;

class function TDroneController.New(const ADroneservice: IDroneservice): IDroneController;
begin
  Result := Self.Create(ADroneservice);
end;

function TDroneController.Save(const ADrone: TDrone) : IDroneController;
begin
  Result := Self;
  FDroneService.Save(ADrone);
end;

end.
