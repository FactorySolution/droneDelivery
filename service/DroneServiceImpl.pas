unit DroneServiceImpl;

interface

uses
  AbstractList,
  DroneServiceInterface,
  uDrone,

  System.Generics.Collections;

type
  TDroneService = class(TAbstractList<TDrone>, IDroneService)
  private
  public
    function Save(const ADrone: TDrone): IDroneService;
    function GetDroneList: TObjectList<TDrone>;
    function GetCountDrones: Integer;

    function validate(const ADrone: TDrone): Boolean; override;

    class function New: IDroneservice;

    constructor Create;
    destructor Destroy; override;

  end;

implementation

uses
  System.SysUtils;

{ TDroneService }

constructor TDroneService.Create;
begin
  inherited Initialize(True);
end;

destructor TDroneService.Destroy;
begin

  inherited;
end;

function TDroneService.GetCountDrones: Integer;
begin
  Result := GetCountDrones;
end;

function TDroneService.GetDroneList: TObjectList<TDrone>;
begin
  Result := GetList;
end;

class function TDroneService.New: IDroneservice;
begin
  Result := Self.Create;
end;

function TDroneService.Save(const ADrone: TDrone): IDroneservice;
begin
  Result := self;
  SaveValue(ADrone);
end;

function TDroneService.validate(const ADrone: TDrone): Boolean;
begin
  Result := not (ADrone.Name.Trim.IsEmpty) and
            not (ADrone.MaximumWeight < 0); // For example negative Weight
end;

end.
