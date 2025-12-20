object FormTextWrapper: TFormTextWrapper
  Left = 0
  Top = 0
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  Anchors = [akLeft]
  Caption = 'Text Wrapper'
  ClientHeight = 744
  ClientWidth = 1128
  Color = clBtnFace
  Constraints.MinHeight = 800
  Constraints.MinWidth = 1150
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 144
  TextHeight = 25
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1128
    Height = 744
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
        Width = 1022
        Height = 584
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
          end
          item
            SizeStyle = ssAuto
          end>
        TabOrder = 0
        ExplicitLeft = -10
        ExplicitTop = 63
        ExplicitWidth = 1019
        object pnlIn: TPanel
          Left = 1
          Top = 1
          Width = 1020
          Height = 291
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alClient
          Color = clSkyBlue
          ParentBackground = False
          TabOrder = 0
          ExplicitHeight = 258
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
            Width = 913
            Height = 199
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
            ScrollBars = ssBoth
            TabOrder = 0
            WantTabs = True
            WordWrap = False
            ExplicitHeight = 166
          end
        end
        object pnlOut: TPanel
          Left = 1
          Top = 292
          Width = 1020
          Height = 291
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alClient
          Color = clActiveCaption
          ParentBackground = False
          TabOrder = 1
          ExplicitTop = 259
          ExplicitHeight = 258
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
            Width = 913
            Height = 199
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
            ScrollBars = ssBoth
            TabOrder = 0
            WantTabs = True
            WordWrap = False
            ExplicitHeight = 166
          end
        end
      end
      object pnlMenu: TPanel
        Left = 0
        Top = 0
        Width = 1120
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
          1120
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
          Left = 577
          Top = 68
          Width = 44
          Height = 25
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Anchors = [akTop, akRight]
          Caption = 'Suffix'
          ExplicitLeft = 599
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
          Left = 631
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
          Left = 787
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
        object btnFullProcess: TButton
          Left = 967
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
          Left = 631
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
      object pnlLeft: TPanel
        Left = 1022
        Top = 120
        Width = 98
        Height = 584
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alRight
        BevelOuter = bvNone
        Color = clGradientActiveCaption
        ParentBackground = False
        TabOrder = 2
        ExplicitHeight = 522
        DesignSize = (
          98
          584)
        object btnMoveUp: TButton
          Left = 3
          Top = 227
          Width = 88
          Height = 68
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Action = actMoveUp
          Anchors = []
          HotImageIndex = 0
          ImageAlignment = iaTop
          ImageMargins.Top = 8
          Images = ImageList1
          TabOrder = 0
          ExplicitTop = 199
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
        Width = 1120
        Height = 704
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alClient
        BevelOuter = bvNone
        BiDiMode = bdLeftToRight
        Color = clGradientActiveCaption
        ParentBiDiMode = False
        ParentBackground = False
        TabOrder = 0
        ExplicitLeft = 6
        ExplicitWidth = 1117
        object grpbxPresets: TGroupBox
          AlignWithMargins = True
          Left = 20
          Top = 388
          Width = 1080
          Height = 296
          Margins.Left = 20
          Margins.Top = 5
          Margins.Right = 20
          Margins.Bottom = 20
          Align = alBottom
          Caption = 'Setting presets'
          TabOrder = 0
          object scrlbxPresets: TScrollBox
            Left = 2
            Top = 27
            Width = 1076
            Height = 267
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            TabOrder = 0
          end
        end
        object grpbxConvertFile: TGroupBox
          AlignWithMargins = True
          Left = 20
          Top = 293
          Width = 1080
          Height = 80
          Margins.Left = 20
          Margins.Top = 10
          Margins.Right = 20
          Margins.Bottom = 10
          Align = alBottom
          Caption = 'File conversion'
          TabOrder = 1
          ExplicitLeft = 252
          ExplicitTop = 234
          ExplicitWidth = 673
          object lblFilePath: TLabel
            Left = 152
            Top = 33
            Width = 67
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'File path'
          end
          object edtFilePath: TEdit
            Left = 229
            Top = 30
            Width = 432
            Height = 33
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            TabOrder = 0
            OnChange = edtFilePathChange
          end
          object btnFilePath: TButton
            Left = 671
            Top = 30
            Width = 49
            Height = 33
            Hint = 'Select path to file'
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = '. . .'
            TabOrder = 1
            OnClick = btnFilePathClick
          end
          object btnConvertFile: TButton
            Left = 16
            Top = 30
            Width = 113
            Height = 33
            Hint = 'Convert selected file and save to output file'
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Action = actConvertFile
            TabOrder = 2
          end
        end
        object grpbxOptions: TGroupBox
          AlignWithMargins = True
          Left = 20
          Top = 20
          Width = 1080
          Height = 268
          Margins.Left = 20
          Margins.Top = 20
          Margins.Right = 20
          Margins.Bottom = 5
          Align = alTop
          Caption = 'Options'
          TabOrder = 2
          ExplicitLeft = 6
          ExplicitTop = 9
          ExplicitWidth = 1083
          object lblMode: TLabel
            Left = 68
            Top = 35
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
            Top = 139
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
            Top = 189
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
            Top = 87
            Width = 33
            Height = 25
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Caption = 'Trim'
          end
          object btnClearSettings: TButton
            Left = 930
            Top = 20
            Width = 125
            Height = 40
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Action = actClearSettings
            TabOrder = 0
          end
          object chbCodeAlign: TCheckBox
            Left = 324
            Top = 36
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
            TabOrder = 1
            StyleElements = [seFont, seClient]
          end
          object chbEndLine: TCheckBox
            Left = 324
            Top = 140
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
            TabOrder = 2
          end
          object chbStartLine: TCheckBox
            Left = 342
            Top = 88
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
            TabOrder = 3
          end
          object cmbMode: TComboBox
            Left = 125
            Top = 32
            Width = 175
            Height = 33
            Hint = 'Add/Remove prefix & suffix'
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 4
            Text = 'ADD'
            Items.Strings = (
              'ADD'
              'REMOVE')
          end
          object cmbQuotation: TComboBox
            Left = 125
            Top = 136
            Width = 175
            Height = 33
            Hint = 'Converts between single and doubled quotation marks'
            Margins.Left = 8
            Margins.Top = 8
            Margins.Right = 8
            Margins.Bottom = 8
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 5
            Text = 'OFF'
            Items.Strings = (
              'OFF'
              #39' -> '#39#39
              #39' <- '#39#39)
          end
          object cmbTabStop: TComboBox
            Left = 125
            Top = 184
            Width = 175
            Height = 33
            Hint = 'Tab stop size used to replace tab character with spaces'
            Margins.Left = 12
            Margins.Top = 12
            Margins.Right = 12
            Margins.Bottom = 12
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 6
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
            Top = 84
            Width = 175
            Height = 33
            Hint = 'Removes whitespaces'
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
            Style = csDropDownList
            ItemIndex = 0
            TabOrder = 7
            Text = 'NONE'
            Items.Strings = (
              'NONE'
              'LEFT'
              'RIGHT'
              'BOTH')
          end
          object edtEndLine: TEdit
            Left = 474
            Top = 136
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
            TabOrder = 8
          end
          object edtStartLine: TEdit
            Left = 474
            Top = 84
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
            TabOrder = 9
          end
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
    Images = ImageList1
    Left = 1050
    Top = 144
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
    object actSavePreset: TAction
      Caption = 'Save'
      Hint = 'Save current settings'
      OnExecute = actSavePresetExecute
    end
    object actLoadPreset: TAction
      Caption = 'Load'
      Hint = 'Load preset settings'
      OnExecute = actLoadPresetExecute
    end
    object actMoveUp: TAction
      Caption = 'Move up'
      Hint = 'Move result into input box and clear output'
      ImageIndex = 0
      OnExecute = actMoveUpExecute
    end
    object actClearSettings: TAction
      Caption = 'Clear settings'
      OnExecute = actClearSettingsExecute
    end
    object actConvertFile: TAction
      Caption = 'Convert file'
      OnExecute = actConvertFileExecute
    end
  end
  object ImageList1: TImageList
    Height = 24
    Width = 24
    Left = 1048
    Top = 228
    Bitmap = {
      494C010101000800040018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000001800000001002000000000000024
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000180000000100010000000000200100000000000000000000
      000000000000000000000000FFFFFF00FFE7FF000000000000000000FFC3FF00
      0000000000000000FFC3FF000000000000000000FFC3FF000000000000000000
      FFC3FF000000000000000000FFC3FF000000000000000000FFC3FF0000000000
      00000000FFC3FF000000000000000000FFC3FF000000000000000000FFC3FF00
      0000000000000000FFC3FF000000000000000000FFC3FF000000000000000000
      E3C3C7000000000000000000C1C383000000000000000000C0C3030000000000
      00000000E04207000000000000000000F0000F000000000000000000F8001F00
      0000000000000000FC003F000000000000000000FE007F000000000000000000
      FF00FF000000000000000000FF81FF000000000000000000FFC3FF0000000000
      00000000FFE7FF00000000000000000000000000000000000000000000000000
      000000000000}
  end
end
