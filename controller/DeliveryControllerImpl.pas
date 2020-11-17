unit DeliveryControllerImpl;

interface

uses
  DeliveryControllerInterface,
  System.Generics.Collections,
  uDelivery,
  DeliveryServiceInterface;

type
  TDeliveryController = class(TInterfacedObject, IDeliveryController)
  private
    FDeliveryService: IDeliveryService;
  public
    function GetDeliveryList: TObjectList<TDelivery>;
    function Save(const ADelivery: TDelivery): IDeliveryController;

    class function New(const ADeliveryService: IDeliveryService): IDeliveryController;

    constructor Create(const ADeliveryService: IDeliveryService);
    destructor Destroy; override;
  end;

implementation

{ TDeliveryController }

constructor TDeliveryController.Create(
  const ADeliveryService: IDeliveryService);
begin
  FDeliveryService := ADeliveryService;
end;

destructor TDeliveryController.Destroy;
begin

  inherited;
end;

function TDeliveryController.GetDeliveryList: TObjectList<TDelivery>;
begin
  Result := FDeliveryService.GetDeliveryList;
end;

class function TDeliveryController.New(
  const ADeliveryService: IDeliveryService): IDeliveryController;
begin
  Result := self.Create(ADeliveryService);
end;

function TDeliveryController.Save(
  const ADelivery: TDelivery): IDeliveryController;
begin
  Result := Self;
  FDeliveryService.Save(ADelivery);
end;

end.
