#!/home/kessler/.linuxbrew/bin/python

import sys
import fitz
import os
import numpy as np

fname = sys.argv[1]                    # filename
pgnum = int(sys.argv[2])               # page number to annotate
colstr = sys.argv[3]                     # color to use for highlight
text = sys.argv[4]                     # search string


# fix color string to color tuple
col = [ float(f) for f in colstr.split(',') ]
col = tuple(col)

print(fname, pgnum, col, text)
#text = "ϕm and ϕh" # in detail and includes ample data for the very stable case."

doc = fitz.open(fname)
# save current state of file for undo
doc.save('/home/kessler/docs/papers/.undo/'+fname)

found=False

#for page in doc:
#	rects = page.searchFor(text) #, hit_max=1)
#	for r in rects:
#		page.addHighlightAnnot(r)
#		found=True
#

page=doc[pgnum-1]
rects = page.searchFor(text) #, hit_max=1)
print(len(rects))
#for r in rects:
if rects:
	r=np.asarray(rects)
	x0=min(r[:,0])
	x1=max(r[:,2])
	y0=min(r[:,1])
	y1=max(r[:,3])

	myannot=page.drawRect((x0,y0,x1,y1) , color=col, fill=col,overlay=False)
	found=True

if not found:
	print('could not find string!')

doc.saveIncr()
os.system('pkill -HUP mupdf')
