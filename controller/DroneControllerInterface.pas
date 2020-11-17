unit DroneControllerInterface;

interface

uses
  uDrone,

  System.Generics.Collections;


type
  IDroneController = interface
  ['{D190686F-03C9-492E-ADB0-2FD4EE4A2F92}']
    function Save(const ADrone: TDrone) : IDroneController;

    function GetDroneList: TObjectList<TDrone>;
  end;

implementation

end.
