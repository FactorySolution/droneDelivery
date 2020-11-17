unit DeliveryServiceInterface;

interface

uses
  uDelivery,
  System.Generics.Collections;

type
  IDeliveryService =  interface
  ['{3B9E2EAA-F48C-4A41-AA9A-66AA5001A98D}']
    function Save(const ADelivery: TDelivery): IDeliveryService;

    function GetDeliveryList: TObjectList<TDelivery>;
    function GetCountDelivery: Integer;
  end;

implementation

end.
