unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList,
  System.Generics.Collections,


  DroneControllerInterface,
  DeliveryControllerInterface,

  uDrone,
  uDelivery;

type
  TGroup = (tgDrone, tgDelivery);

  TFrmMain = class(TForm)
    ActionList: TActionList;
    GroupBoxDrones: TGroupBox;
    EditName: TLabeledEdit;
    EditDroneWeight: TLabeledEdit;
    btnSave: TButton;
    GroupBoxLocation: TGroupBox;
    EditLocation: TLabeledEdit;
    EditPackageWeight: TLabeledEdit;
    ActionSaveDrone: TAction;
    ActionSaveDelivery: TAction;
    Button1: TButton;
    btnTrip: TButton;
    ActionTripDrone: TAction;
    MemoEvent: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure ActionSaveDroneExecute(Sender: TObject);
    procedure ActionSaveDeliveryExecute(Sender: TObject);
    procedure ActionTripDroneExecute(Sender: TObject);
  private
    { Private declarations }
    FDroneController: IDroneController;
    FDeliveryController: IDeliveryController;

    FDroneList: TObjectList<TDrone>;
    FDeliveryList: TObjectList<TDelivery>;
    procedure clearScream(const AGroup: TGroup);

    procedure doEvent(AValue: string);
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses
  DroneControllerImpl,
  DeliveryControllerImpl,
  DroneServiceImpl,
  DeliveryServiceImpl,
  TripServiceInterface, TripServiceImpl;

{$R *.dfm}

procedure TFrmMain.ActionSaveDeliveryExecute(Sender: TObject);
var
  LDelivery: TDelivery;
begin

  LDelivery := TDelivery.Create;

  LDelivery.Location := EditLocation.Text;
  LDelivery.PackageWeight := StrToFloatDef(EditPackageWeight.Text, 0);

  FDeliveryList := FDeliveryController.Save(LDelivery).GetDeliveryList;
  clearScream(tgDelivery);
end;

procedure TFrmMain.ActionSaveDroneExecute(Sender: TObject);
var
  LDrone: TDrone;
begin
  LDrone := TDrone.Create;

  LDrone.Name := EditName.Text;
  LDrone.MaximumWeight := StrToFloatDef(EditDroneWeight.Text, 0);

  FDroneList := FDroneController.Save(LDrone).GetDroneList;

  clearScream(tgDrone);
end;

procedure TFrmMain.ActionTripDroneExecute(Sender: TObject);
var
  LTripService: ITripService;
begin
  MemoEvent.Lines.Clear;

  LTripService := TTripService.New;

  LTripService.doEvent := doEvent;

  LTripService.Trip(FDroneList, FDeliveryList);

end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  FDroneController := TDroneController.New(TDroneService.New);
  FDeliveryController := TDeliveryController.New(TDeliveryService.New);
end;

procedure TFrmMain.clearScream(const AGroup: TGroup);
begin
  case AGroup of
    tgDrone: begin
      EditName.Clear;
      EditDroneWeight.Clear;
      EditName.SetFocus;
    end;
    tgDelivery: begin
      EditLocation.Clear;
      EditPackageWeight.Clear;
      EditLocation.SetFocus;
    end;
  end;
end;

procedure TFrmMain.doEvent(AValue: string);
begin
  MemoEvent.Lines.Add(AValue);
end;

end.
