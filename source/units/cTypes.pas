unit cTypes;

interface

type
  TWrapModeType = (wmtAdd, wmtRemove);
  TTrimModeType = (tmtNone, tmtLeft, tmtRight, tmtBoth);
  TQuotationType = (qtOff, qtDoubled, qtSingled);
  TTabStopConvertType = (tsctOff, tsctAuto, tsct2sp, tsct3sp, tsct4sp); // TODO: function converting enum to tabsize
  TTabMode = (tmExpand, tmCompress);

implementation

end.
