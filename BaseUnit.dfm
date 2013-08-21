object MainForm: TMainForm
  Left = 571
  Top = 254
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1056#1077#1076#1072#1082#1090#1086#1088' '#1072#1090#1088#1080#1073#1091#1090#1086#1074' '#1092#1072#1081#1083#1086#1074
  ClientHeight = 208
  ClientWidth = 397
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 64
    Width = 119
    Height = 20
    Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 96
    Width = 129
    Height = 20
    Caption = #1044#1072#1090#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 32
    Top = 128
    Width = 120
    Height = 20
    Caption = #1044#1072#1090#1072' '#1086#1090#1082#1088#1099#1090#1080#1103':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object CreationDate: TDateTimePicker
    Left = 160
    Top = 64
    Width = 145
    Height = 21
    Date = 41506.000000000000000000
    Time = 41506.000000000000000000
    DateFormat = dfLong
    Enabled = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
  end
  object FileNameField: TEdit
    Left = 16
    Top = 16
    Width = 329
    Height = 25
    ReadOnly = True
    TabOrder = 1
    Text = #1042#1099#1073#1077#1088#1080#1090#1077' '#1092#1072#1081#1083
    OnDblClick = FileNameFieldDblClick
  end
  object OpenFileButton: TButton
    Left = 352
    Top = 16
    Width = 33
    Height = 25
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = OpenFileButtonClick
  end
  object CreationTime: TDateTimePicker
    Left = 312
    Top = 64
    Width = 73
    Height = 21
    Date = 41507.000000000000000000
    Time = 41507.000000000000000000
    Enabled = False
    Kind = dtkTime
    TabOrder = 3
  end
  object ChangeDate: TDateTimePicker
    Left = 160
    Top = 96
    Width = 145
    Height = 21
    Date = 0.569020138886116900
    Time = 0.569020138886116900
    DateFormat = dfLong
    Enabled = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 4
  end
  object ChangeTime: TDateTimePicker
    Left = 312
    Top = 96
    Width = 73
    Height = 21
    Date = 41507.000000000000000000
    Time = 41507.000000000000000000
    Enabled = False
    Kind = dtkTime
    TabOrder = 5
  end
  object SaveButton: TButton
    Left = 288
    Top = 168
    Width = 99
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = SaveButtonClick
  end
  object LastAccessDate: TDateTimePicker
    Left = 160
    Top = 128
    Width = 145
    Height = 21
    Date = 0.569020138886116900
    Time = 0.569020138886116900
    DateFormat = dfLong
    Enabled = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 7
  end
  object LastAccessTime: TDateTimePicker
    Left = 312
    Top = 128
    Width = 73
    Height = 21
    Date = 41507.000000000000000000
    Time = 41507.000000000000000000
    Enabled = False
    Kind = dtkTime
    TabOrder = 8
  end
  object OpenDialog: TOpenDialog
    Options = [ofEnableSizing]
    Title = #1042#1099#1073#1077#1088#1080#1090#1077' '#1092#1072#1081#1083
    Left = 24
    Top = 168
  end
end
