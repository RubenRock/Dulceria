object Fintercambio: TFintercambio
  Left = 0
  Top = 0
  Caption = 'Intercambio de mercancia de una nota'
  ClientHeight = 553
  ClientWidth = 1004
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1004
    Height = 145
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 41
      Width = 54
      Height = 15
      Caption = 'NOMBRE:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 62
      Width = 39
      Height = 15
      Caption = 'TOTAL:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 20
      Width = 37
      Height = 15
      Caption = 'FOLIO:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Lfolio: TLabel
      Left = 88
      Top = 20
      Width = 31
      Height = 15
      Caption = 'Lfolio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Lnombre: TLabel
      Left = 88
      Top = 41
      Width = 50
      Height = 15
      Caption = 'Lnombre'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LTOTAL: TLabel
      Left = 88
      Top = 62
      Width = 41
      Height = 15
      Caption = 'LTOTAL'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 110
      Width = 64
      Height = 15
      Caption = 'CANTIDAD:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bactualizar: TSpeedButton
      Left = 635
      Top = 78
      Width = 101
      Height = 51
      Hint = 'INTERCAMBIAR PRODUCTOS'
      Flat = True
      Glyph.Data = {
        361B0000424D361B000000000000360000002800000030000000300000000100
        180000000000001B000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000003080A1735402A62783A859C48A6C450B8DF58
        CAF758CAF750B8DF48A6C43A859C2A627816353F03080B000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000002556604DB2D85FDAFF
        63E3FF61DEFF5ED8FF5DD4FF5CD2FF5BD0FF5BD0FF5CD2FF5DD4FF5ED8FF61DE
        FF63E3FF5FDAFF4DB2D825565F00000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        022F6D8564E5FF62E1FF5DD5FF5BD1FF5BCFFF5ACFFF5BD0FF5BD0FF5BD0FF5B
        D0FF5BD0FF5BD0FF5BD0FF5BD0FF5ACFFF5BCFFF5BD1FF5DD5FF62E1FF63E4FF
        2E6B830000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000002352605FDBFF61DFFF5BD1FF5ACFFF5BD0FF5BD0FF
        5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0
        FF5BD0FF5BD0FF5BD0FF5ACFFF5BD1FF61DFFF5EDBFF23526000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000001040251BBE265E6FF5BD1
        FF5ACFFF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5B
        D0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF
        5ACFFF5BD2FF65E6FF51BBE20104020000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000015313C60DDFF5ED8FF5ACFFF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF
        5BD0FF5BD0FF5BCFFF5BCFFF5BD0FF5BD0FF5BD0FF5BD0FF5BCFFF5BCFFF5BD0
        FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5ACFFF5ED8FF61DDFF14
        2F3B000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000001E46556AF3FF5BD2FF5ACFFF5BD0FF5BD0
        FF5BD0FF5BD0FF5BD0FF5BD0FF5BCFFF5BCFFF5BD2FF5BD7FF5BD8FF5BD6FF5B
        D5FF5BD5FF5BD6FF5BD8FF5BD7FF5BD2FF5BCFFF5BCFFF5BD0FF5BD0FF5BD0FF
        5BD0FF5BD0FF5BD0FF5ACFFF5BD2FF6AF2FF1E45540000000000000000000000
        00000000000000000000000000000000000000000000000000000000234F5F64
        E8FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BCFFF5BD1FF5BD7FF
        5BE0FF59C0FF589CFF5789FF577CFF5778FF5778FF577CFF5789FF589DFF59C0
        FF5BE0FF5BD7FF5BD1FF5BCFFF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5B
        D0FF65E8FF1F4957000000000000000000000000000000000000000000000000
        0000000000000000001B3E4C6AF2FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0
        FF5BD0FF5BD0FF5BD9FF5ACBFF5898FF5763FF5763FF5769FF586CFF576DFF57
        6DFF576DFF576DFF586CFF5769FF5763FF5763FF5798FF5ACCFF5BD9FF5BD0FF
        5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF6AF3FF193C490000000000
        00000000000000000000000000000000000000000000040C0B61E1FF5BD1FF5B
        D0FF5BD0FF5BD0FF5BD0FF5BD0FF5BCFFF5BD3FF5BD9FF589BFF5768FF5769FF
        586FFF5870FF5870FF5870FF5870FF5870FF5870FF5870FF5870FF5870FF5870
        FF586FFF5768FF5768FF589BFF5BD9FF5BD3FF5BCFFF5BD0FF5BD0FF5BD0FF5B
        D0FF5BD0FF5BD1FF61DFFF040C0B000000000000000000000000000000000000
        00000000000056C7F05DD6FF5BCFFF5BD0FF5BD0FF5BD0FF5BD0FF5BCFFF5BD7
        FF59C5FF566BFF5767FF586FFF5870FF5870FF5870FF5870FF5870FF5870FF58
        70FF5870FF5870FF5870FF5870FF5870FF5870FF5870FF586FFF5767FF566BFF
        59C5FF5BD6FF5BCFFF5BD0FF5BD0FF5BD0FF5BD0FF5BCFFF5DD7FF56C6F00000
        00000000000000000000000000000000000000295F7264E4FF5ACFFF5BD0FF5B
        D0FF5BD0FF5BD0FF5BCFFF5BD8FF58B7FF5765FF586DFF5870FF5870FF5870FF
        5870FF5870FF5870FF5870FF5870FF5870FF5870FF5870FF5870FF5870FF5870
        FF5870FF5870FF5870FF5870FF586DFF5765FF58B7FF5BD8FF5BCFFF5BD0FF5B
        D0FF5BD0FF5BD0FF5ACFFF64E4FF295F72000000000000000000000000000000
        02050761DEFF5BD1FF5BD0FF5BD0FF5BD0FF5BD0FF5BCFFF5BD7FF58B7FF5760
        FF586FFF5870FF5870FF5870FF5870FF5870FF5870FF5870FF5870FF556DFF53
        6CFF536CFF556EFF5870FF5870FF5870FF5870FF5870FF5870FF5870FF5870FF
        586FFF5760FF58B7FF5BD7FF5BCFFF5BD0FF5BD0FF5BD0FF5BD0FF5BD1FF60DE
        FF02050700000000000000000000000034779361DEFF5ACFFF5BD0FF5BD0FF5B
        D0FF5BD0FF5BD3FF59C5FF5765FF586FFF5870FF5870FF5870FF5870FF5870FF
        5870FF566EFF4D67FF455FFF647AFF7085FF7185FF5B72FF3D59FF4D67FF556E
        FF5870FF5870FF5870FF5870FF5870FF5870FF586FFF5765FF59C5FF5BD3FF5B
        D0FF5BD0FF5BD0FF5BD0FF5ACFFF61DEFF33768F000000000000000000000000
        64E8FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD8FF576BFF586EFF5870
        FF5870FF5870FF5870FF5870FF5870FF566EFF6279FFAEB9FFEAEDFFF6F7FFFF
        FFFFFFFFFFFFFFFFFBFBFFAAB6FF5870FF4C66FF5870FF5870FF5870FF5870FF
        5870FF5870FF586EFF576BFF5BD9FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0
        FF65E8FF00000000000000000026576462E1FF5ACFFF5BD0FF5BD0FF5BD0FF5B
        CFFF5BD9FF5898FF5768FF5870FF5870FF5870FF5870FF576FFF526AFF576FFF
        566EFF6177FF536BFF4560FF4761FF526BFF798DFFDCE1FFFFFFFFFFFFFFFFFF
        FF8B9BFF3F5BFF576FFF5870FF5870FF5870FF5870FF5870FF5768FF589AFF5B
        D9FF5BCFFF5BD0FF5BD0FF5BD0FF5ACFFF62E1FF25546000000000000050B8E0
        5DD5FF5BD0FF5BD0FF5BD0FF5BD0FF5BD1FF5AC9FF5767FF586FFF5870FF5870
        FF5870FF576FFF4A64FF8999FF4E68FF576FFF576FFF576FFF5870FF576FFF56
        6EFF526AFF3B56FF90A0FFFFFFFFFFFFFFFFFFFFBEC6FF4762FF576FFF5870FF
        5870FF5870FF5870FF586FFF5766FF5ACAFF5BD1FF5BD0FF5BD0FF5BD0FF5BD0
        FF5DD5FF4FB7DE00000004090B5FDBFF5BD1FF5BD0FF5BD0FF5BD0FF5BCFFF5B
        D7FF5799FF5769FF5870FF5870FF5870FF5870FF445FFFB3BEFFFFFFFFBDC6FF
        405BFF5870FF5870FF5870FF5870FF5870FF5870FF5870FF4660FF8E9EFFFFFF
        FFFFFFFFFFFFFFB5C0FF425DFF5870FF5870FF5870FF5870FF5870FF5769FF57
        9AFF5BD6FF5BCFFF5BD0FF5BD0FF5BD0FF5BD1FF5FDBFF04090B18384463E3FF
        5ACFFF5BD0FF5BD0FF5BD0FF5BCFFF5BE0FF5765FF586FFF5870FF5870FF5870
        FF4762FF96A5FFFFFFFFFFFFFFFFFFFF9AA9FF4862FF5870FF5870FF5870FF58
        70FF5870FF5870FF5870FF3F5BFFC6CFFFFFFFFFFFFFFFFFFFFF7A8EFF4F69FF
        5870FF5870FF5870FF5870FF586FFF5766FF5BE0FF5BCFFF5BD0FF5BD0FF5BD0
        FF5ACFFF63E3FF1839442E698160DDFF5ACFFF5BD0FF5BD0FF5BD0FF5BD2FF59
        C3FF5762FF5870FF5870FF5870FF4E68FF6F84FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF7588FF4E67FF5870FF5870FF5870FF5870FF5870FF5870FF546DFF5F75
        FFFFFFFFFFFFFFFFFFFFEEF0FF4A64FF576FFF5870FF5870FF5870FF5870FF57
        62FF59C3FF5BD2FF5BD0FF5BD0FF5BD0FF5ACFFF60DDFF2D677E3D8BA25ED7FF
        5BD0FF5BD0FF5BD0FF5BCFFF5BD6FF58A0FF5768FF5870FF5870FF536CFF5971
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5870FF526BFF5870FF58
        70FF5870FF5870FF5870FF576FFF4761FFE5E9FFFFFFFFFFFFFFFFFFFF7E91FF
        526AFF5870FF5870FF5870FF5870FF5768FF58A1FF5BD6FF5BCFFF5BD0FF5BD0
        FF5BD0FF5ED7FF3D8CA24CAED05CD3FF5BD0FF5BD0FF5BD0FF5BCFFF5BD9FF57
        8BFF586CFF5870FF576FFF435EFFF7F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF6F7FF4A63FF566EFF5870FF5870FF5870FF5870FF5870FF4963
        FFBFC8FFFFFFFFFFFFFFFFFFFFBFC8FF4B64FF5870FF5870FF5870FF5870FF58
        6CFF578BFF5BD8FF5BCFFF5BD0FF5BD0FF5BD0FF5CD4FF4BABCE53BFE85BD1FF
        5BD0FF5BD0FF5BD0FF5BD0FF5BD6FF577EFF586DFF576FFF4A64FFDEE2FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E8FF4962FF58
        70FF5870FF5870FF5870FF5870FF4A64FFB9C3FFFFFFFFFFFFFFFFFFFFF5F6FF
        405BFF5970FF5870FF5870FF5870FF586DFF577EFF5BD7FF5BD0FF5BD0FF5BD0
        FF5BD0FF5BD1FF53BFE958C9F75BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD5FF57
        7AFF586DFF576FFF4D66FFCED4FFE3E7FFDBE0FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFDDE2FFE2E6FFD4DAFF4A63FF5870FF5870FF5870FF4761FF435EFF3552
        FFD3D9FFFFFFFFFFFFFFFFFFFFFFFFFF2948FF445EFF4862FF576FFF5870FF58
        6DFF577AFF5BD6FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF58C9F758CCF95BD0FF
        5BD0FF5BD0FF5BD0FF5BD0FF5BD5FF577AFF586DFF5870FF5870FF4862FF435E
        FF2E4DFFFFFFFFFFFFFFFFFFFFFFFFFFCCD3FF3451FF435EFF4761FF5870FF58
        70FF5870FF4A63FFD4DBFFE2E6FFDDE2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        DBE0FFE2E6FFD1D7FF4F69FF576FFF586DFF577AFF5BD5FF5BD0FF5BD0FF5BD0
        FF5BD0FF5BD0FF58CCF954C2EC5BD1FF5BD0FF5BD0FF5BD0FF5BD0FF5BD6FF58
        7DFF576DFF5870FF5870FF5870FF5971FF3D59FFFFFFFFFFFFFFFFFFFFFFFFFF
        B0BBFF4A64FF5870FF5870FF5870FF5870FF5870FF4862FFE7EAFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9EBFF4B66FF576FFF58
        6DFF577EFF5BD6FF5BD0FF5BD0FF5BD0FF5BD0FF5BD1FF54C2EC4DB1D45CD3FF
        5BD0FF5BD0FF5BD0FF5BCFFF5BD9FF5789FF586CFF5870FF5870FF5870FF5870
        FF4962FFC8CFFFFFFFFFFFFFFFFFFFFFB3BEFF4A64FF5870FF5870FF5870FF58
        70FF5870FF566EFF4E66FFFAFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF4C66FF556EFF5870FF586CFF578AFF5BD9FF5BCFFF5BD0FF5BD0
        FF5BD0FF5CD3FF4DB1D43E8FA55ED7FF5BD0FF5BD0FF5BD0FF5BCFFF5BD6FF58
        9EFF5769FF5870FF5870FF5870FF5870FF516AFF8596FFFFFFFFFFFFFFFFFFFF
        D8DDFF4761FF576FFF5870FF5870FF5870FF5870FF5870FF5069FF667CFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6D82FF5069FF5870FF5870FF57
        69FF589FFF5BD6FF5BCFFF5BD0FF5BD0FF5BD0FF5ED7FF3D8EA52E6B8360DCFF
        5ACFFF5BD0FF5BD0FF5BD0FF5BD2FF59BFFF5763FF5870FF5870FF5870FF5870
        FF566FFF4C66FFF4F6FFFFFFFFFFFFFFFFFFFF536CFF566EFF5870FF5870FF58
        70FF5870FF5870FF5870FF4963FF8E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        93A2FF4963FF5870FF5870FF5870FF5763FF59C0FF5BD2FF5BD0FF5BD0FF5BD0
        FF5ACFFF60DDFF2E6A8218384363E3FF5ACFFF5BD0FF5BD0FF5BD0FF5BCFFF5B
        E0FF5764FF586FFF5870FF5870FF5870FF5870FF4E68FF8496FFFFFFFFFFFFFF
        FFFFFFB9C2FF435DFF5870FF5870FF5870FF5870FF5870FF5870FF5870FF445F
        FFC3CBFFFFFFFFFFFFFFFFFFFFC8D0FF415CFF5870FF5870FF5870FF586FFF57
        65FF5BE0FF5BCFFF5BD0FF5BD0FF5BD0FF5ACFFF63E3FF18394403090B5FDAFF
        5BD1FF5BD0FF5BD0FF5BD0FF5BCFFF5BD7FF5799FF5769FF5870FF5870FF5870
        FF5870FF5870FF425DFFB5C0FFFFFFFFFFFFFFFFFFFF788CFF4963FF5870FF58
        70FF5870FF5870FF5870FF5870FF576FFF3E5AFFEBEEFFFFFFFFE5E9FF4760FF
        576FFF5870FF5870FF5870FF5769FF579AFF5BD6FF5BCFFF5BD0FF5BD0FF5BD0
        FF5BD1FF5ED9FF02080A0000004FB6DE5DD5FF5BD0FF5BD0FF5BD0FF5BD0FF5B
        D1FF5ACBFF5767FF586FFF5870FF5870FF5870FF5870FF576FFF4761FFC7CFFF
        FFFFFFFFFFFFFFFFFF7C90FF3E5AFF526BFF576FFF5870FF5870FF576FFF576F
        FF556DFF5B73FFD4DAFF5770FF546CFF5870FF5870FF5870FF586FFF5767FF5A
        CBFF5BD1FF5BD0FF5BD0FF5BD0FF5BD0FF5DD5FF4EB6DD000000000000255561
        62E1FF5ACFFF5BD0FF5BD0FF5BD0FF5BCFFF5BD9FF589AFF5768FF5870FF5870
        FF5870FF5870FF5870FF576FFF3E5AFF91A1FFFEFEFFFFFFFFFFFFFFD4DAFF73
        87FF4C66FF4761FF4560FF556DFF5F76FF566FFF546DFF4963FF556EFF5870FF
        5870FF5870FF5870FF5768FF589BFF5BD9FF5BCFFF5BD0FF5BD0FF5BD0FF5ACF
        FF62E1FF25556100000000000000000066E9FF5BD0FF5BD0FF5BD0FF5BD0FF5B
        D0FF5BD0FF5BD9FF576BFF586EFF5870FF5870FF5870FF5870FF5870FF5870FF
        4C66FF526BFF9DABFFFCFCFFFFFFFFFFFFFFFFFFFFF5F7FFEAEDFF9EACFF5F75
        FF566EFF5870FF5870FF5870FF5870FF5870FF5870FF586EFF576CFF5BD9FF5B
        D0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF64E7FF000000000000000000000000
        357B9761DEFF5ACFFF5BD0FF5BD0FF5BD0FF5BD0FF5BD3FF59C5FF5764FF586F
        FF5870FF5870FF5870FF5870FF5870FF5870FF566EFF4E67FF3E59FF5970FF67
        7DFF7286FF647AFF445FFF4F68FF566FFF5870FF5870FF5870FF5870FF5870FF
        5870FF586FFF5765FF59C5FF5BD3FF5BD0FF5BD0FF5BD0FF5BD0FF5ACFFF61DE
        FF357B9700000000000000000000000004090C62E0FF5BD1FF5BD0FF5BD0FF5B
        D0FF5BD0FF5BCFFF5BD7FF58B7FF5760FF586FFF5870FF5870FF5870FF5870FF
        5870FF5870FF5870FF5870FF556EFF546CFF536CFF556DFF5870FF5870FF5870
        FF5870FF5870FF5870FF5870FF5870FF586FFF5760FF58B7FF5BD7FF5BCFFF5B
        D0FF5BD0FF5BD0FF5BD0FF5BD1FF60E0FF03070A000000000000000000000000
        0000002A627664E4FF5ACFFF5BD0FF5BD0FF5BD0FF5BD0FF5BCFFF5BD8FF58B6
        FF5764FF586DFF5870FF5870FF5870FF5870FF5870FF5870FF5870FF5870FF58
        70FF5870FF5870FF5870FF5870FF5870FF5870FF5870FF5870FF5870FF586DFF
        5764FF58B7FF5BD8FF5BCFFF5BD0FF5BD0FF5BD0FF5BD0FF5ACFFF64E4FF2A62
        7600000000000000000000000000000000000000000056C4EE5ED7FF5BCFFF5B
        D0FF5BD0FF5BD0FF5BD0FF5BCFFF5BD7FF59C4FF576BFF5768FF586FFF5870FF
        5870FF5870FF5870FF5870FF5870FF5870FF5870FF5870FF5870FF5870FF5870
        FF5870FF5870FF586FFF5768FF576BFF59C5FF5BD7FF5BCFFF5BD0FF5BD0FF5B
        D0FF5BD0FF5BCFFF5ED7FF54C3EC000000000000000000000000000000000000
        00000000000003070560DEFF5BD1FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BCF
        FF5BD3FF5BD8FF5899FF5767FF5769FF586FFF5870FF5870FF5870FF5870FF58
        70FF5870FF5870FF5870FF5870FF5870FF586FFF5769FF5767FF5899FF5BD8FF
        5BD3FF5BCFFF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD1FF60DEFF0307060000
        0000000000000000000000000000000000000000000000000015303B6AF3FF5B
        D0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD9FF5AC9FF5896FF
        5763FF5763FF5769FF586CFF586DFF586DFF586DFF586DFF586CFF5769FF5763
        FF5763FF5896FF5AC9FF5BD9FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5B
        D0FF5BD0FF6AF3FF132E39000000000000000000000000000000000000000000
        0000000000000000000000001F475665E8FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0
        FF5BD0FF5BD0FF5BCFFF5BD2FF5BD8FF5ADEFF59C0FF589DFF5789FF577CFF57
        78FF5778FF577CFF5789FF589DFF59C0FF5ADEFF5BD8FF5BD2FF5BCFFF5BD0FF
        5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF65E9FF1D45550000000000000000
        000000000000000000000000000000000000000000000000000000000000001E
        455569F2FF5CD2FF5ACFFF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BCFFF
        5BD0FF5BD2FF5BD7FF5BD8FF5BD6FF5BD5FF5BD5FF5BD6FF5BD8FF5BD7FF5BD2
        FF5BD0FF5BCFFF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5ACFFF5CD2FF6A
        F3FF1C414F000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000011283260DDFF5ED8FF5ACFFF5BD0
        FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BCFFF5BCFFF5BD0FF5B
        D0FF5BD0FF5BD0FF5BCFFF5BCFFF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF
        5BD0FF5BD0FF5ACFFF5ED8FF60DCFF1128310000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000010052BAE364E6FF5BD1FF5ACFFF5BD0FF5BD0FF5BD0FF5BD0FF
        5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0
        FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5ACFFF5BD1FF64E6FF51BBE300010000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000000024556461DD
        FF61DFFF5BD1FF5ACFFF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5B
        D0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5ACFFF5BD1FF
        61DFFF61DDFF2454640000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000001040631728C64E6FF62E2FF5DD5FF5BD1FF
        5BCFFF5ACFFF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5BD0FF5ACF
        FF5BCFFF5BD1FF5DD5FF62E2FF64E6FF2F6F8701030500000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000023515D51B9E15FD9FF62E2FF61DDFF5ED7FF5CD3FF5BD1FF5B
        D0FF5BD0FF5BD1FF5CD3FF5ED7FF61DDFF62E3FF5FD9FF50B9E123505D000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000020609
        16333D2B647A3E8FA650B7DC55C4EF59CCFA59CCFA55C4EF50B7DC3E8FA62B63
        7916333E02060900000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = BactualizarClick
    end
    object ECANTIDAD: TEdit
      Left = 86
      Top = 108
      Width = 81
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object GridNota: TDBGrid
    Left = 0
    Top = 145
    Width = 505
    Height = 408
    TabStop = False
    Align = alLeft
    DataSource = Dsnota
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    OnCellClick = GridNotaCellClick
    OnEditButtonClick = GridNotaEditButtonClick
    OnKeyUp = GridNotaKeyUp
    OnMouseWheel = GridNotaMouseWheel
    Columns = <
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'CANTIDAD'
        Title.Caption = 'CANT'
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'empaque'
        Title.Caption = 'EMPAQUE'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUCTO'
        ReadOnly = True
        Width = 300
        Visible = True
      end>
  end
  object DBGrid1: TDBGrid
    Left = 511
    Top = 145
    Width = 493
    Height = 408
    TabStop = False
    Align = alRight
    DataSource = Dssimilar
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'producto_1'
        Title.Caption = 'PRODUCTO'
        Visible = True
      end>
  end
  object Qrynota: TFDQuery
    Connection = Modulo.Conector
    SQL.Strings = (
      'select * from inventario order by producto')
    Left = 32
    Top = 167
  end
  object Dsnota: TDataSource
    DataSet = Qrynota
    Left = 32
    Top = 223
  end
  object Qrysimilar: TFDQuery
    Connection = Modulo.Conector
    SQL.Strings = (
      'select * from inventario order by producto')
    Left = 728
    Top = 191
  end
  object Dssimilar: TDataSource
    DataSet = Qrysimilar
    Left = 728
    Top = 247
  end
  object QRYAUX: TFDQuery
    Connection = Modulo.Conector
    SQL.Strings = (
      'select * from inventario order by producto')
    Left = 688
    Top = 23
  end
end
