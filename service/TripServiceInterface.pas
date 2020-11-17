unit TripServiceInterface;

interface

uses
  System.Generics.Collections,
  uDelivery,
  uDrone;

type
  TEventMsg = procedure(AValue: string) of object;

  ITripService  = interface
  ['{061687F9-463B-42DD-AD52-F49651EE967C}']
    function Trip(const ADrone: TObjectList<TDrone>;
                  const ADelivery: TObjectList<TDelivery>): ITripService;
    procedure SetEvent(const Value: TEventMsg);
    function GetEvent: TEventMsg;

    property doEvent: TEventMsg read GetEvent write SetEvent;

  end;

implementation

end.
