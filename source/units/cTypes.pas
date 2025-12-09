unit cTypes;

interface

type
  TWrapModeType = (wmtAdd, wmtRemove);
  TTrimModeType = (tmtNone, tmtLeft, tmtRight, tmtBoth);
  TQuotationType = (qtOff, qtDoubled, qtSingled);
  TTabSizeType = (tsctOff = 0, tsct2sp = 2, tsct3sp = 3, tsct4sp = 4, tsct8sp = 8); // TODO: function converting enum to tabsize
  TTabMode = (tmExpand, tmCompress);

function TabSizeToIndex(tabSize : TTabSizeType) : Integer;
function TabSizeFromIndex(indexTmp : Integer) : TTabSizeType;

implementation

function TabSizeToIndex(tabSize : TTabSizeType) : Integer;
begin
  case tabSize of
    tsctOff: Result := 0;
    tsct2sp: Result := 1;
    tsct3sp: Result := 2;
    tsct4sp: Result := 3;
    tsct8sp: Result := 4;
  else Result := 0;
  end;
end;

function TabSizeFromIndex(indexTmp : Integer) : TTabSizeType;
begin
  case indexTmp of
    0: Result := tsctOff;
    1: Result := tsct2sp;
    2: Result := tsct3sp;
    3: Result := tsct4sp;
    4: Result := tsct8sp;
  else Result := tsctOff;
  end;
end;

end.
