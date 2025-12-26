object FrameOptions: TFrameOptions
  Left = 0
  Top = 0
  Width = 800
  Height = 709
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  TabOrder = 0
  PixelsPerInch = 144
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 709
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alClient
    BevelOuter = bvNone
    Color = clGradientInactiveCaption
    ParentBackground = False
    TabOrder = 0
    object grpbxOptions: TGroupBox
      AlignWithMargins = True
      Left = 20
      Top = 20
      Width = 760
      Height = 684
      Margins.Left = 20
      Margins.Top = 20
      Margins.Right = 20
      Margins.Bottom = 5
      Align = alClient
      Caption = 'Options'
      TabOrder = 0
      ExplicitLeft = -232
      ExplicitTop = 25
      object lblMode: TLabel
        Left = 68
        Top = 129
        Width = 47
        Height = 25
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Mode'
      end
      object lblQuotation: TLabel
        Left = 34
        Top = 180
        Width = 81
        Height = 25
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        BiDiMode = bdRightToLeft
        Caption = 'Quotation'
        ParentBiDiMode = False
      end
      object lblTabStop: TLabel
        Left = 27
        Top = 230
        Width = 88
        Height = 25
        Margins.Left = 12
        Margins.Top = 12
        Margins.Right = 12
        Margins.Bottom = 12
        BiDiMode = bdRightToLeft
        Caption = 'Tab replace'
        ParentBiDiMode = False
      end
      object lblTrim: TLabel
        Left = 82
        Top = 278
        Width = 33
        Height = 25
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Trim'
      end
      object lblPrefix: TLabel
        Left = 72
        Top = 38
        Width = 43
        Height = 25
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Prefix'
      end
      object lblSuffix: TLabel
        Left = 71
        Top = 81
        Width = 44
        Height = 25
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Suffix'
      end
      object lblOptLoadPreset: TLabel
        Left = 27
        Top = 492
        Width = 93
        Height = 25
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Load preset'
      end
      object chbCodeAlign: TCheckBox
        Left = -6
        Top = 318
        Width = 146
        Height = 26
        Hint = 'Fill with trailing spaces before suffix'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        BiDiMode = bdRightToLeft
        Caption = 'Align code'
        ParentBiDiMode = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        StyleElements = [seFont, seClient]
      end
      object chbEndLine: TCheckBox
        Left = -6
        Top = 421
        Width = 146
        Height = 26
        Hint = 'Enable ending line'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        BiDiMode = bdRightToLeft
        Caption = 'Ending line'
        ParentBiDiMode = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object chbStartLine: TCheckBox
        Left = 12
        Top = 369
        Width = 128
        Height = 26
        Hint = 'Enable starting line'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        BiDiMode = bdRightToLeft
        Caption = 'Starting line'
        ParentBiDiMode = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
      object cmbMode: TComboBox
        Left = 125
        Top = 126
        Width = 175
        Height = 33
        Hint = 'Add/Remove prefix & suffix'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 3
        Text = 'ADD'
        Items.Strings = (
          'ADD'
          'REMOVE')
      end
      object cmbQuotation: TComboBox
        Left = 125
        Top = 177
        Width = 175
        Height = 33
        Hint = 'Converts between single and doubled quotation marks'
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 8
        Margins.Bottom = 8
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 4
        Text = 'OFF'
        Items.Strings = (
          'OFF'
          #39' -> '#39#39
          #39' <- '#39#39)
      end
      object cmbTabStop: TComboBox
        Left = 125
        Top = 225
        Width = 175
        Height = 33
        Hint = 'Tab stop size used to replace tab character with spaces'
        Margins.Left = 12
        Margins.Top = 12
        Margins.Right = 12
        Margins.Bottom = 12
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 5
        Text = 'OFF'
        Items.Strings = (
          'OFF'
          '2 sp'
          '3 sp'
          '4 sp'
          '8 sp')
      end
      object cmbTrim: TComboBox
        Left = 125
        Top = 275
        Width = 175
        Height = 33
        Hint = 'Removes whitespaces'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 6
        Text = 'NONE'
        Items.Strings = (
          'NONE'
          'LEFT'
          'RIGHT'
          'BOTH')
      end
      object edtEndLine: TEdit
        Left = 150
        Top = 417
        Width = 590
        Height = 33
        Hint = 'Line will be added after the converted text'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        MaxLength = 255
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
      end
      object edtStartLine: TEdit
        Left = 150
        Top = 365
        Width = 590
        Height = 33
        Hint = 'Line will be added before the converted text'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        MaxLength = 255
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
      end
      object edtPrefix: TEdit
        Left = 125
        Top = 35
        Width = 420
        Height = 33
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        MaxLength = 50
        TabOrder = 9
      end
      object edtSuffix: TEdit
        Left = 125
        Top = 78
        Width = 420
        Height = 33
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        MaxLength = 50
        TabOrder = 10
      end
      object cmbOptLoadPreset: TComboBox
        Left = 130
        Top = 489
        Width = 218
        Height = 33
        Hint = 'Select to load from saved presets'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Style = csDropDownList
        TabOrder = 11
      end
      object btnOptLoadPreset: TButton
        Left = 372
        Top = 487
        Width = 113
        Height = 38
        Hint = 'Load preset'
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Load'
        TabOrder = 12
        OnClick = btnOptLoadPresetClick
      end
    end
  end
end
