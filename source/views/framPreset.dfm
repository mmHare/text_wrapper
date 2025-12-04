object FramePreset: TFramePreset
  Left = 0
  Top = 0
  Width = 935
  Height = 79
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  Align = alTop
  TabOrder = 0
  PixelsPerInch = 144
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 935
    Height = 79
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      935
      79)
    object lblName: TLabel
      Left = 24
      Top = 28
      Width = 48
      Height = 25
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Preset'
    end
    object edtName: TEdit
      Left = 96
      Top = 25
      Width = 529
      Height = 33
      Hint = 'Preset name'
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Anchors = [akLeft, akTop, akRight]
      MaxLength = 150
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnChange = edtNameChange
    end
    object btnSave: TButton
      Left = 660
      Top = 23
      Width = 113
      Height = 38
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Anchors = [akTop, akRight]
      Caption = 'Save'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object btnLoad: TButton
      Left = 792
      Top = 23
      Width = 113
      Height = 38
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Anchors = [akTop, akRight]
      Caption = 'Load'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
  end
end
