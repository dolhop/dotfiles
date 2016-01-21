'''add terminal color values to a GUI only colorscheme'''

# USAGE: vim_colorscheme_convert.py <colorscheme_file>

import sys
import re

# requires path.py: https://pypi.python.org/pypi/path.py
from path import path

# requires colortrans.py: https://gist.github.com/MicahElliott/719710
from colortrans import rgb2short

HI_LINE = 'hi %(name)s guifg=%(guifg)s guibg=%(guibg)s gui=%(gui)s ctermfg=%(ctermfg)s ctermbg=%(ctermbg)s cterm=%(cterm)s'

f = path(sys.argv[1])
if not f.isfile():
    print('File does not exist: %s' % f)
    sys.exit(-1)

output = []

for line in f.lines():
    m = re.match('hi\s+(?P<name>\w+)\s+.*$', line)
    if not m:
        # append non "hi" lines verbatim
        output.append(line)

    else:
        values = {'name': m.group('name')}
        for val in ('', 'fg', 'bg'):
            m = re.search('gui%s=(?P<gui%s>\S+)' % (val, val), line)
            if not m:
                values['gui%s' % val]   = 'NONE'
                values['cterm%s' % val] = 'NONE'
            else:
                values['gui%s' % val]   = m.group('gui%s' % val)
                if not values['gui%s' % val].startswith('#'):
                    values['cterm%s' % val] = values['gui%s' % val]
                else:
                    values['cterm%s' % val] = rgb2short(m.group('gui%s' % val).strip('#'))[0]

        output.append(HI_LINE % values)

# make a back up of the original and write the new contents
f.copy('%s.bak' % f)
f.write_lines(output)
