object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'Drone Delivery'
  ClientHeight = 530
  ClientWidth = 852
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBoxDrones: TGroupBox
    Left = 8
    Top = 32
    Width = 401
    Height = 185
    Caption = 'Insert Drones'
    TabOrder = 0
    object EditName: TLabeledEdit
      Left = 16
      Top = 40
      Width = 337
      Height = 21
      EditLabel.Width = 27
      EditLabel.Height = 13
      EditLabel.Caption = 'Name'
      TabOrder = 0
    end
    object EditDroneWeight: TLabeledEdit
      Left = 16
      Top = 88
      Width = 121
      Height = 21
      EditLabel.Width = 66
      EditLabel.Height = 13
      EditLabel.Caption = 'Drone Weight'
      NumbersOnly = True
      TabOrder = 1
    end
    object btnSave: TButton
      Left = 160
      Top = 136
      Width = 75
      Height = 25
      Action = ActionSaveDrone
      TabOrder = 2
    end
  end
  object GroupBoxLocation: TGroupBox
    Left = 8
    Top = 232
    Width = 401
    Height = 201
    Caption = 'Delivery Location'
    TabOrder = 1
    object EditLocation: TLabeledEdit
      Left = 16
      Top = 40
      Width = 121
      Height = 21
      EditLabel.Width = 40
      EditLabel.Height = 13
      EditLabel.Caption = 'Location'
      TabOrder = 0
    end
    object EditPackageWeight: TLabeledEdit
      Left = 16
      Top = 88
      Width = 121
      Height = 21
      EditLabel.Width = 77
      EditLabel.Height = 13
      EditLabel.Caption = 'Package Weight'
      TabOrder = 1
    end
    object Button1: TButton
      Left = 160
      Top = 152
      Width = 75
      Height = 25
      Action = ActionSaveDelivery
      TabOrder = 2
    end
  end
  object btnTrip: TButton
    Left = 136
    Top = 447
    Width = 75
    Height = 25
    Action = ActionTripDrone
    TabOrder = 2
  end
  object MemoEvent: TMemo
    Left = 415
    Top = 40
    Width = 378
    Height = 393
    TabOrder = 3
  end
  object ActionList: TActionList
    Left = 800
    Top = 40
    object ActionSaveDrone: TAction
      Caption = 'Save Drone'
      OnExecute = ActionSaveDroneExecute
    end
    object ActionSaveDelivery: TAction
      Caption = 'Save Delivery'
      OnExecute = ActionSaveDeliveryExecute
    end
    object ActionTripDrone: TAction
      Caption = 'Trip'
      OnExecute = ActionTripDroneExecute
    end
  end
end
