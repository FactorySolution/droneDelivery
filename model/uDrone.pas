unit uDrone;

interface


type
  TDrone = class
  private
    FName: string;
    FWeight: Double;
    procedure SetName(const Value: string);
    procedure SetWeight(const Value: Double);
  public
    property Name: string read FName write SetName;
    property MaximumWeight: Double read FWeight write SetWeight;
  end;

implementation

{ TDrone }

procedure TDrone.SetName(const Value: string);
begin
  FName := Value;
end;

procedure TDrone.SetWeight(const Value: Double);
begin
  FWeight := Value;
end;

end.
