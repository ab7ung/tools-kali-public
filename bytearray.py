"""
This script generates a bytearray for badchar detection
and is similar to mona.py's bytearray function.

Usage:

    Create bytearray.txt and bytearray.bin (0-255)
    $ python bytearray.py

    Create bytearray.txt and bytearray.bin and exclude chars
    $ python bytearray.py '\x00\x0a'

"""
import sys

exclude = []

if len(sys.argv) > 1:
    hexchars = [sys.argv[1][i:i+4] for i in range(0, len(sys.argv[1]), 4)]
    exclude = [int(i[2:], 16) for i in hexchars]

    print('Excluding: {}'.format(sys.argv[1]))

def tohex(nr):
    return '\\x{:02x}'.format(nr)

with open('bytearray.txt', 'w') as file_txt, open('bytearray.bin', 'w') as file_bin:
    for i in range(255+1):
        if i in exclude:
            continue
        file_bin.write(chr(i))
        file_txt.write(tohex(i))