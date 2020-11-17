unit uSent;

interface

uses
  uDrone,
  uDelivery;

type
  TSent = class
  private
    FDrone: TDrone;
    FDelivery: TDelivery;
    FTrip: Integer;
    procedure SetDrone(const Value: TDrone);
    procedure SetDelivery(const Value: TDelivery);
    procedure SetTrip(const Value: Integer);
  public
    property Drone: TDrone read FDrone write SetDrone;
    property Delivery: TDelivery read FDelivery write SetDelivery;
    property Trip: Integer read FTrip write SetTrip;

    constructor Create(const ADrone: TDrone;
      const ADelivery: TDelivery; const Atrip: Integer );
    destructor Destroy; override;
  end;

implementation

{ TSent }

constructor TSent.Create(const ADrone: TDrone;
  const ADelivery: TDelivery; const Atrip: Integer );
begin
  FDrone := ADrone;
  FDelivery := ADelivery;
  FTrip := Atrip;
end;

destructor TSent.Destroy;
begin

  inherited;
end;

procedure TSent.SetDelivery(const Value: TDelivery);
begin
  FDelivery := Value;
end;

procedure TSent.SetDrone(const Value: TDrone);
begin
  FDrone := Value;
end;

procedure TSent.SetTrip(const Value: Integer);
begin
  FTrip := Value;
end;

end.
