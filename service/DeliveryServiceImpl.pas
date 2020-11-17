unit DeliveryServiceImpl;

interface

uses
  AbstractList,
  uDelivery,
  DeliveryServiceInterface,
  System.Generics.Collections;

type
  TDeliveryService = class(TAbstractList<TDelivery>, IDeliveryService)
  public
    function GetCountDelivery: Integer;
    function GetDeliveryList: TObjectList<TDelivery>;
    function Save(const ADelivery: TDelivery): IDeliveryService;

    function validate(const ADelivery: TDelivery): Boolean; override;

    class function New: IDeliveryService;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils;

{ TDeliveryService }

constructor TDeliveryService.Create;
begin
  inherited Initialize(False);
end;

destructor TDeliveryService.Destroy;
begin

  inherited;
end;

function TDeliveryService.GetCountDelivery: Integer;
begin
  Result := GetListQuantity;
end;

function TDeliveryService.GetDeliveryList: TObjectList<TDelivery>;
begin
  Result := GetList;
end;

class function TDeliveryService.New: IDeliveryService;
begin
  Result := Self.Create
end;

function TDeliveryService.Save(const ADelivery: TDelivery): IDeliveryService;
begin
  Result := Self;
  SaveValue(ADelivery);
end;

function TDeliveryService.validate(const ADelivery: TDelivery): Boolean;
begin
  Result := not (ADelivery.Location.Trim.isEmpty) and
            not (ADelivery.PackageWeight < 0);
end;

end.
