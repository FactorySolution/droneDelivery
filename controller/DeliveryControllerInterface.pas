unit DeliveryControllerInterface;

interface

uses
  System.Generics.Collections,
  uDelivery;

type
  IDeliveryController = interface
  ['{243F5393-3AC6-42A3-B717-DAF44406FA46}']
    function Save(const ADelivery: TDelivery) : IDeliveryController;
    function GetDeliveryList: TObjectList<TDelivery>;
  end;


implementation

end.
