unit DroneServiceInterface;

interface

uses
  uDrone,

  System.Generics.Collections;

type
  IDroneservice = interface
    ['{826218AF-900E-4C5A-BF3A-BC9D7FE4F711}']
    function Save(const ADrone: TDrone): IDroneService;

    function GetDroneList: TObjectList<TDrone>;
    function GetCountDrones: Integer;

  end;

implementation

end.
