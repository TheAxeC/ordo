import sys, unicodedata, os
# usage: to_charset.py <src file> <dst file>; writes each character outside the set by its name in angle brackets
src, dst = sys.argv[1], sys.argv[2]
md = dst.endswith('.md')
out = []
for ch in open(src, encoding='utf-8', errors='surrogateescape').read():
    o = ord(ch)
    if ch == '\n' or 0x20 <= o <= 0x7E or (md and o == 0x2705):
        out.append(ch)
    elif ch == '\t':
        out.append('<tab>')
    elif ch == '\r':
        out.append('<carriage return>')
    else:
        try: name = unicodedata.name(ch).lower()
        except ValueError: name = 'U+%04X' % o
        out.append('<' + name + '>')
os.makedirs(os.path.dirname(dst) or '.', exist_ok=True)
open(dst, 'w', encoding='ascii').write(''.join(out))
