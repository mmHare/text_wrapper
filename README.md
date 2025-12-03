# Text Wrapper
Windows desktop application written in Delphi 12. It is meant to be a helper app that can wrap given text within set prefixes and suffixes or remove them.
Additional option to insert preset lines at the start and end of the converted text.
Current settings are saved upon closing application but also can be saved and loaded as presets so they can be switched easily and accessed when needed.
There is an option to 'align' output by filling endline with spaces so that suffix is added on the same position for all lines. It is also possible to set quotation mark conversion from single (') to doubled ('').

## Changelog
See the full changelog in [CHANGELOG.md](CHANGELOG.md).

## Third-Party Tools
- Release build is compressed using UPX: https://upx.github.io/
- Debug build uses FastMM5 for memory leak detection: https://github.com/pleriche/FastMM5
