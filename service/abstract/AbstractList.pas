unit AbstractList;

interface

uses
  System.Generics.Collections;

type
  TAbstractList<T: class> = class abstract(TInterfacedObject)
  private
    FList: TObjectList<T>;
    FValidadeMaxList: Boolean;
  protected
    procedure Initialize(const AValidateMaxList: Boolean);
  public
    constructor Create;
    destructor Destroy; override;

    function validate(const AValue: T): Boolean; virtual; abstract;

    procedure validateMaxDrones;

    procedure SaveValue(const AValue: T);

    function GetList: TObjectList<T>;
    function GetListQuantity: Integer;

  end;

implementation

uses
  System.SysUtils;

{ TAbstractList }

constructor TAbstractList<T>.Create;
begin
  raise Exception.Create('Use the method CreateProtected');
end;

procedure TAbstractList<T>.Initialize(const AValidateMaxList: Boolean);
begin
  FList := TObjectList<T>.Create;
  FValidadeMaxList := AValidateMaxList;
end;

destructor TAbstractList<T>.Destroy;
begin
  FList.Clear;
  FList.Free;
  inherited;
end;

function TAbstractList<T>.GetList: TObjectList<T>;
begin
  Result := FList;
end;

function TAbstractList<T>.GetListQuantity: Integer;
begin
  Result := FList.Count;
end;

procedure TAbstractList<T>.SaveValue(const AValue: T);
begin
  if FValidadeMaxList then validateMaxDrones;
  if validate(AValue) then
    FList.Add(AValue)
  else
    raise Exception.Create('Invalid data. Check out');
end;

procedure TAbstractList<T>.validateMaxDrones;
const
  MAX_DRONES = 100;
begin
  if GetListQuantity > MAX_DRONES then
    raise Exception.Create('Adding more drones is not allowed');
end;

end.
