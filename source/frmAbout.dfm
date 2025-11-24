object FormAbout: TFormAbout
  Left = 0
  Top = 0
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  BorderStyle = bsDialog
  Caption = 'About'
  ClientHeight = 441
  ClientWidth = 601
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 144
  TextHeight = 25
  object pnlAbout: TPanel
    Left = 0
    Top = 0
    Width = 601
    Height = 441
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = -204
    ExplicitTop = -96
    ExplicitWidth = 1142
    ExplicitHeight = 760
    object pnlHeader: TPanel
      Left = 0
      Top = 0
      Width = 601
      Height = 95
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 651
      object lblProgramVersion: TLabel
        AlignWithMargins = True
        Left = 38
        Top = 15
        Width = 555
        Height = 72
        Margins.Left = 38
        Margins.Top = 15
        Margins.Right = 8
        Margins.Bottom = 8
        Align = alClient
        Caption = 'lblProgramVersion'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -41
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 60
        ExplicitTop = 10
        ExplicitWidth = 878
        ExplicitHeight = 77
      end
    end
    object redtAbout: TRichEdit
      AlignWithMargins = True
      Left = 38
      Top = 110
      Width = 525
      Height = 233
      Margins.Left = 38
      Margins.Top = 15
      Margins.Right = 38
      Margins.Bottom = 38
      Align = alClient
      BorderStyle = bsNone
      Enabled = False
      Font.Charset = EASTEUROPE_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'Segoe UI'
      Font.Style = []
      Lines.Strings = (
        'by Wojciech Zaj'#261'c (GitHub: mmHare)'
        ''
        
          'This little helper program converts text by adding/removing give' +
          'n '
        'prefixes and suffixes from input lines. ')
      ParentFont = False
      TabOrder = 1
      Transparent = True
      ExplicitTop = 15
      ExplicitWidth = 575
      ExplicitHeight = 388
    end
    object btnOk: TButton
      AlignWithMargins = True
      Left = 150
      Top = 386
      Width = 301
      Height = 50
      Margins.Left = 150
      Margins.Top = 5
      Margins.Right = 150
      Margins.Bottom = 5
      Align = alBottom
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 2
      ExplicitLeft = 100
      ExplicitTop = 398
      ExplicitWidth = 451
    end
  end
end
