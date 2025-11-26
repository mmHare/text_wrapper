object FormTextWrapper: TFormTextWrapper
  Left = 0
  Top = 0
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  Anchors = [akLeft]
  Caption = 'Text Wrapper'
  ClientHeight = 800
  ClientWidth = 1150
  Color = clBtnFace
  Constraints.MinHeight = 800
  Constraints.MinWidth = 1150
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 144
  TextHeight = 25
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1150
    Height = 800
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ActivePage = tsSettings
    Align = alClient
    TabOrder = 0
    object tsWrapper: TTabSheet
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Wrapper'
      object gpWrapper: TGridPanel
        Left = 0
        Top = 120
        Width = 1142
        Height = 640
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        ColumnCollection = <
          item
            Value = 100.000000000000000000
          end>
        ControlCollection = <
          item
            Column = 0
            Control = pnlIn
            Row = 0
          end
          item
            Column = 0
            Control = pnlOut
            Row = 1
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clInactiveCaption
        Font.Height = -18
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        RowCollection = <
          item
            Value = 50.000000000000000000
          end
          item
            Value = 50.000000000000000000
          end
          item
            SizeStyle = ssAuto
          end>
        TabOrder = 0
        object pnlIn: TPanel
          Left = 1
          Top = 1
          Width = 1140
          Height = 319
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alClient
          Color = clSkyBlue
          ParentBackground = False
          TabOrder = 0
          object lblIn: TLabel
            Left = 24
            Top = 12
            Width = 18
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'IN'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBtnText
            Font.Height = -18
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object redtIn: TRichEdit
            AlignWithMargins = True
            Left = 61
            Top = 46
            Width = 1033
            Height = 227
            Margins.Left = 60
            Margins.Top = 45
            Margins.Right = 45
            Margins.Bottom = 45
            Align = alClient
            Font.Charset = EASTEUROPE_CHARSET
            Font.Color = clWindowText
            Font.Height = -18
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            WantTabs = True
          end
        end
        object pnlOut: TPanel
          Left = 1
          Top = 320
          Width = 1140
          Height = 319
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alClient
          Color = clActiveCaption
          ParentBackground = False
          TabOrder = 1
          object lblOut: TLabel
            Left = 24
            Top = 12
            Width = 35
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'OUT'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBtnText
            Font.Height = -18
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object redtOut: TRichEdit
            AlignWithMargins = True
            Left = 61
            Top = 46
            Width = 1033
            Height = 227
            Margins.Left = 60
            Margins.Top = 45
            Margins.Right = 45
            Margins.Bottom = 45
            Align = alClient
            Font.Charset = EASTEUROPE_CHARSET
            Font.Color = clWindowText
            Font.Height = -18
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            WantTabs = True
          end
        end
      end
      object pnlMenu: TPanel
        Left = 0
        Top = 0
        Width = 1142
        Height = 120
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alTop
        BevelOuter = bvNone
        Color = clGradientActiveCaption
        ParentBackground = False
        TabOrder = 1
        DesignSize = (
          1142
          120)
        object lblPrefix: TLabel
          Left = 12
          Top = 68
          Width = 43
          Height = 25
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Prefix'
        end
        object lblSuffix: TLabel
          Left = 599
          Top = 68
          Width = 44
          Height = 25
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Anchors = [akTop, akRight]
          Caption = 'Suffix'
        end
        object btnConvert: TButton
          Left = 62
          Top = 8
          Width = 112
          Height = 45
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Action = actConvert
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -18
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object btnClipboard: TButton
          Left = 653
          Top = 9
          Width = 112
          Height = 45
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Action = actClipboard
          Anchors = [akTop, akRight]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object btnClear: TButton
          Left = 809
          Top = 8
          Width = 112
          Height = 45
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Action = actClear
          Anchors = [akTop, akRight]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
        end
        object Button1: TButton
          Left = 989
          Top = 8
          Width = 112
          Height = 45
          Hint = 
            '1. Paste from the clipboard into the Input box'#13#10'2. Convert'#13#10'3. C' +
            'opy result into the clipboard'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Action = actFullProcess
          Anchors = [akTop, akRight]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
        end
        object edtPrefix: TEdit
          Left = 62
          Top = 63
          Width = 450
          Height = 33
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          MaxLength = 50
          TabOrder = 4
        end
        object edtSuffix: TEdit
          Left = 653
          Top = 63
          Width = 450
          Height = 33
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Anchors = [akTop, akRight]
          MaxLength = 50
          TabOrder = 5
        end
        object btnAbout: TButton
          Left = 3
          Top = 8
          Width = 45
          Height = 45
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = '?'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -18
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          OnClick = btnAboutClick
        end
      end
    end
    object tsSettings: TTabSheet
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Settings'
      ImageIndex = 1
      object pnlSettings: TPanel
        Left = 0
        Top = 0
        Width = 1142
        Height = 760
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        BevelOuter = bvNone
        Color = clGradientActiveCaption
        ParentBackground = False
        TabOrder = 0
        object lblStartLine: TLabel
          Left = 33
          Top = 137
          Width = 93
          Height = 25
          Hint = 'Line added at the start of the text'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Starting line'
          ParentShowHint = False
          ShowHint = True
        end
        object lblEndLine: TLabel
          Left = 39
          Top = 190
          Width = 87
          Height = 25
          Hint = 'Line added at the end of text'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Ending line'
          ParentShowHint = False
          ShowHint = True
        end
        object lblMode: TLabel
          Left = 79
          Top = 24
          Width = 47
          Height = 25
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Caption = 'Mode'
        end
        object chbCodeAlign: TCheckBox
          Left = 12
          Top = 84
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
        object edtStartLine: TEdit
          Left = 137
          Top = 132
          Width = 609
          Height = 33
          Hint = 'Line will be added before the converted text'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          MaxLength = 255
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object edtEndLine: TEdit
          Left = 137
          Top = 185
          Width = 609
          Height = 33
          Hint = 'Line will be added after the converted text'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          MaxLength = 255
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
        end
        object cmbMode: TComboBox
          Left = 137
          Top = 21
          Width = 175
          Height = 33
          Hint = 'Add/Remove prefix & suffix'
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Style = csDropDownList
          ItemIndex = 0
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          Text = 'ADD'
          Items.Strings = (
            'ADD'
            'REMOVE')
        end
      end
    end
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
      end
      item
      end>
    Left = 548
    Top = 8
    StyleName = 'Platform Default'
    object actClear: TAction
      Caption = 'Clear'
      Hint = 'Clear input and output boxes'
      OnExecute = actClearExecute
    end
    object actClipboard: TAction
      Caption = 'To clipboard'
      Hint = 'Copy output to clipboard'
      OnExecute = actClipboardExecute
    end
    object actConvert: TAction
      Caption = 'Convert'
      OnExecute = actConvertExecute
    end
    object actFullProcess: TAction
      Caption = 'Full process'
      Hint = 
        '1. Pastes text from the clipboard into the Input box'#13#10'2. Convert' +
        's the text with the given settings'#13#10'3. Copies the result into th' +
        'e clipboard'
      OnExecute = actFullProcessExecute
    end
  end
end
