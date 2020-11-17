unit uDelivery;

interface

type
  TDelivery = class
  private
    FLocation: string;
    FPackageWeight: Double;
    FSent: Boolean;
    procedure SetLocation(const Value: string);
    procedure SetPackageWeight(const Value: Double);
    procedure SetSent(const Value: Boolean);
  public
    property Location: string read FLocation write SetLocation;
    property PackageWeight: Double read FPackageWeight write SetPackageWeight;
    property Sent: Boolean read FSent write SetSent default False;
  end;

implementation

{ TDelivery }

procedure TDelivery.SetLocation(const Value: string);
begin
  FLocation := Value;
end;

procedure TDelivery.SetPackageWeight(const Value: Double);
begin
  FPackageWeight := Value;
end;

procedure TDelivery.SetSent(const Value: Boolean);
begin
  FSent := Value;
end;

end.
