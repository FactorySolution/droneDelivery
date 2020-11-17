unit TripServiceImpl;

interface

uses

  System.Generics.Defaults,
  TripServiceInterface,
  System.Generics.Collections,

  uDrone,
  uDelivery,
  uSent;


type
  TTripService = class(TInterfacedObject, ITripService)
  private
    FEvent: TEventMsg;
    procedure orderDelivery(ADelivery: TObjectList<TDelivery>);
    procedure OrderDrone(ADrone: TObjectList<TDrone>);
    procedure delivery(const ADrone: TObjectList<TDrone>;
  const ADelivery: TObjectList<TDelivery>; ASent: TObjectList<TSent>;
  ATrip: Integer);
    procedure printDelivery(LSent: System.Generics.Collections.TObjectList<TSent>);
    function isExistsDelivery(const ADelivery: TObjectList<TDelivery>): Boolean;
    function isPossibleDelivery(const ADrone: TObjectList<TDrone>;
      const ADelivery: TObjectList<TDelivery>): Boolean;
    procedure printDeliveryNoSent(ADelivery: TObjectList<TDelivery>);
  public

    function GetEvent: TEventMsg;
    procedure SetEvent(const Value: TEventMsg);

    function Trip(const ADrone: TObjectList<TDrone>;
      const ADelivery: TObjectList<TDelivery>): ITripService;

    class function New: ITripService;

    constructor Create;
    destructor Destroy; override;

  end;

implementation

uses
  System.Math,
  System.SysUtils;

{ TTripService }

constructor TTripService.Create;
begin

end;

destructor TTripService.Destroy;
begin

  inherited;
end;


procedure TTripService.printDeliveryNoSent(ADelivery: TObjectList<TDelivery>);
var
  LDelivery: TDelivery;
begin
  for LDelivery in ADelivery do
  begin
    if not LDelivery.Sent then
      FEvent(Format('Undeliverable package(s)->  %s', [LDelivery.Location] ));
  end;
end;

procedure TTripService.printDelivery(LSent: TObjectList<TSent>);
var
  LDroneName: string;
  LTrip: Integer;
  LValue: TSent;
begin
  LDroneName := EmptyStr;
  LTrip := 0;
  for LValue in LSent do
  begin
    if not SameText(LDroneName, LValue.Drone.Name) then
    begin
      LDroneName := LValue.Drone.Name;
      FEvent(Format('[Drone # %s]', [LDroneName]));
    end;
    if LTrip <> LValue.Trip then
    begin
      LTrip := LValue.Trip;
      FEvent(Format('Trip # %d', [LTrip]));
    end;
    if Assigned(FEvent) then
    begin
      FEvent(Format('[Location # %s]', [LValue.Delivery.Location]));
    end;
  end;
end;

function TTripService.GetEvent: TEventMsg;
begin
  Result := FEvent;
end;

class function TTripService.New: ITripService;
begin
  Result := Self.Create;
end;

procedure TTripService.orderDelivery(ADelivery: TObjectList<TDelivery>);
begin
  ADelivery.Sort(TComparer<TDelivery>.Construct(
    function(const A, B: TDelivery) : Integer
    begin
      Result := CompareValue(A.PackageWeight, B.PackageWeight);
    end
  ));
end;

procedure TTripService.OrderDrone(ADrone: TObjectList<TDrone>);
begin
  ADrone.Sort(TComparer<TDrone>.Construct(
    function (const A, B: TDrone): Integer
    begin
      Result := CompareValue(B.MaximumWeight, A.MaximumWeight);
    end
  ));
end;

procedure TTripService.SetEvent(const Value: TEventMsg);
begin
  FEvent := Value;
end;


function TTripService.isExistsDelivery(
  const ADelivery: TObjectList<TDelivery>): Boolean;
var
  LDelivery: TDelivery;
begin
  Result := False;
  for LDelivery in ADelivery do
    if not LDelivery.Sent then Exit(True);
end;

function TTripService.isPossibleDelivery(const ADrone: TObjectList<TDrone>;
  const ADelivery: TObjectList<TDelivery>): Boolean;
var
  LDrone: TDrone;
  LDelivery: TDelivery;
begin
  Result := False;
  for LDrone in ADrone do
  begin
    for LDelivery in ADelivery do
    begin
      if not LDelivery.Sent then
      begin
        if LDrone.MaximumWeight >= LDelivery.PackageWeight then
          Exit(True);
      end;
    end;
  end;
end;

procedure TTripService.delivery(const ADrone: TObjectList<TDrone>;
  const ADelivery: TObjectList<TDelivery>; ASent: TObjectList<TSent>;
  ATrip: Integer);
var
  LDrone: TDrone;
  LWeight: Double;
  LDelivery: TDelivery;
begin
  for LDrone in ADrone do
  begin
    LWeight := 0;
    for LDelivery in ADelivery do
    begin
      if not LDelivery.Sent then
      begin
        LWeight := LWeight + LDelivery.PackageWeight;
        if LDrone.MaximumWeight >= LWeight then
        begin
          ASent.Add(TSent.Create(LDrone, LDelivery, ATrip));
          LDelivery.Sent := True;
        end else
          Break;
      end;
    end;
    Inc(ATrip);
  end;

  if isExistsDelivery(ADelivery) and isPossibleDelivery(ADrone, ADelivery) then
    delivery(ADrone, ADelivery, ASent, ATrip)
  else
    Exit;

end;

function TTripService.Trip(const ADrone: TObjectList<TDrone>;
  const ADelivery: TObjectList<TDelivery>): ITripService;
var
  LSent: TObjectList<TSent>;
begin
  Result := Self;
  LSent := TObjectList<TSent>.Create;
  try
    orderDelivery(ADelivery);
    OrderDrone(ADrone);

    delivery(ADrone, ADelivery, LSent, 1);

    if LSent.Count = 0 then
      raise Exception.Create('No deliveries');

    if not Assigned(FEvent) then Exit;

    printDelivery(LSent);

    printDeliveryNoSent(ADelivery);

  finally
    LSent.Free;
  end;
end;

end.
