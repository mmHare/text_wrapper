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
    ExplicitLeft = 552
    ExplicitTop = 300
    ExplicitWidth = 278
    ExplicitHeight = 62
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
      ExplicitTop = 25
      object lblMode: TLabel
        Left = 68
        Top = 47
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
        Top = 103
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
        Top = 153
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
        Top = 201
        Width = 33
        Height = 25
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = 'Trim'
      end
      object chbCodeAlign: TCheckBox
        Left = -6
        Top = 241
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
        Top = 344
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
        Top = 292
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
        Top = 44
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
        Top = 100
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
        Top = 148
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
        Top = 198
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
        Top = 340
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
        Top = 288
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
    end
  end
end
