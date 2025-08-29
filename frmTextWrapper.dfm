object FormTextWrapper: TFormTextWrapper
  Left = 0
  Top = 0
  Anchors = [akLeft]
  Caption = 'Text Wrapper'
  ClientHeight = 586
  ClientWidth = 839
  Color = clBtnFace
  Constraints.MinHeight = 500
  Constraints.MinWidth = 700
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 839
    Height = 29
    Caption = 'ToolBar1'
    TabOrder = 0
    ExplicitTop = -6
    object Button1: TButton
      Left = 0
      Top = 0
      Width = 75
      Height = 22
      Action = actClose
      TabOrder = 0
    end
    object ToolButton1: TToolButton
      Left = 75
      Top = 0
      Width = 14
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object Button2: TButton
      Left = 89
      Top = 0
      Width = 75
      Height = 22
      Action = actConvert
      TabOrder = 1
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 29
    Width = 839
    Height = 557
    ActivePage = tsSettings
    Align = alClient
    TabOrder = 1
    object tsWrapper: TTabSheet
      Caption = 'Wrapper'
      object gpWrapper: TGridPanel
        Left = 0
        Top = 0
        Width = 831
        Height = 527
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
          Width = 829
          Height = 262
          Align = alClient
          TabOrder = 0
          object lblIn: TLabel
            Left = 16
            Top = 8
            Width = 12
            Height = 15
            Caption = 'IN'
          end
          object redtIn: TRichEdit
            AlignWithMargins = True
            Left = 31
            Top = 31
            Width = 767
            Height = 200
            Margins.Left = 30
            Margins.Top = 30
            Margins.Right = 30
            Margins.Bottom = 30
            Align = alClient
            Font.Charset = EASTEUROPE_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
        end
        object pnlOut: TPanel
          Left = 1
          Top = 263
          Width = 829
          Height = 263
          Align = alClient
          TabOrder = 1
          object lblOut: TLabel
            Left = 16
            Top = 8
            Width = 23
            Height = 15
            Caption = 'OUT'
          end
          object redtOut: TRichEdit
            AlignWithMargins = True
            Left = 31
            Top = 31
            Width = 767
            Height = 201
            Margins.Left = 30
            Margins.Top = 30
            Margins.Right = 30
            Margins.Bottom = 30
            Align = alClient
            Font.Charset = EASTEUROPE_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
        end
      end
    end
    object tsSettings: TTabSheet
      Caption = 'Settings'
      ImageIndex = 1
      object pnlSettings: TPanel
        Left = 0
        Top = 0
        Width = 831
        Height = 527
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object lblPrefix: TLabel
          Left = 152
          Top = 184
          Width = 30
          Height = 15
          Caption = 'Prefix'
        end
        object lblSuffix: TLabel
          Left = 440
          Top = 184
          Width = 30
          Height = 15
          Caption = 'Suffix'
        end
        object lblStartLine: TLabel
          Left = 188
          Top = 123
          Width = 63
          Height = 15
          Hint = 'Line added at the start of the text'
          Caption = 'Starting line'
        end
        object lblEndLine: TLabel
          Left = 198
          Top = 253
          Width = 59
          Height = 15
          Hint = 'Line added at the end of text'
          Caption = 'Ending line'
        end
        object lblMode: TLabel
          Left = 312
          Top = 24
          Width = 31
          Height = 15
          Caption = 'Mode'
        end
        object chbCodeAlign: TCheckBox
          Left = 24
          Top = 56
          Width = 97
          Height = 17
          Hint = 'Fill with spaces'
          Caption = 'Align code'
          TabOrder = 0
        end
        object edtPrefix: TEdit
          Left = 188
          Top = 181
          Width = 155
          Height = 23
          TabOrder = 1
        end
        object edtSuffix: TEdit
          Left = 476
          Top = 181
          Width = 157
          Height = 23
          TabOrder = 2
        end
        object edtStartLine: TEdit
          Left = 257
          Top = 120
          Width = 376
          Height = 23
          TabOrder = 3
        end
        object edtEndLine: TEdit
          Left = 257
          Top = 250
          Width = 376
          Height = 23
          TabOrder = 4
        end
        object cmbMode: TComboBox
          Left = 360
          Top = 21
          Width = 145
          Height = 23
          ItemIndex = 0
          TabOrder = 5
          Text = 'TEXT'
          Items.Strings = (
            'TEXT'
            'AUTO SQL'
            'SQL -> CODE'
            'CODE -> SQL')
        end
      end
    end
    object tsAbout: TTabSheet
      Caption = 'About'
      ImageIndex = 2
      object pnlAbout: TPanel
        Left = 0
        Top = 0
        Width = 831
        Height = 527
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object redtAbout: TRichEdit
          AlignWithMargins = True
          Left = 25
          Top = 25
          Width = 756
          Height = 452
          Margins.Left = 25
          Margins.Top = 25
          Margins.Right = 50
          Margins.Bottom = 50
          Align = alClient
          Enabled = False
          Font.Charset = EASTEUROPE_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Lines.Strings = (
            'Text Wrapper'
            'ver. 1.0.0.0'
            ''
            'by'
            ''
            
              'This little helper program converts text by adding/removing give' +
              'n prefixes and suffixes from input lines. '
            
              'Optionally it can align output by filling with spaces at the end' +
              ' of the lines up to the longest line so the suffixes will be add' +
              'ed at the same '
            'position.'
            
              'Also a line at the start of the text as well as at the end can b' +
              'e added.'
            
              'By selecting SQL <-> CODE mode the quotas will be changed into d' +
              'ouble quotas and reverse, so it will be converted to fit into De' +
              'lphi code or '
            'SQL script. '
            ''
            'Full-Process action goes through these steps:'
            '1. Pastes text from the clipboard into the Input box'
            '2. Converts the text with the given settings'
            '3. Copies the result into the clipboard')
          ParentFont = False
          TabOrder = 0
          Transparent = True
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
    Left = 776
    Top = 8
    StyleName = 'Platform Default'
    object actClose: TAction
      Caption = 'Close'
      OnExecute = actCloseExecute
    end
    object actToCode: TAction
      Caption = '-> Code'
      OnExecute = actToCodeExecute
    end
    object actToSQL: TAction
      Caption = '-> SQL'
      OnExecute = actToSQLExecute
    end
    object actClear: TAction
      Caption = 'Clear'
      OnExecute = actClearExecute
    end
    object actClipboard: TAction
      Caption = 'Copy to clipboard'
      OnExecute = actClipboardExecute
    end
    object actConvert: TAction
      Caption = 'Convert'
      OnExecute = actConvertExecute
    end
    object actAutoRecog: TAction
      Caption = 'Auto recognition'
      OnExecute = actAutoRecogExecute
    end
    object actFullProcess: TAction
      Caption = 'actFullProcess'
      OnExecute = actFullProcessExecute
    end
    object actTextWrap: TAction
      Caption = 'Text wrap'
      OnExecute = actTextWrapExecute
    end
  end
end
