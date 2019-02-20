#!/home/kessler/.linuxbrew/bin/python



import sys
import fitz
import os

fname = sys.argv[1]                    # filename
pgnum = int(sys.argv[2])               # page number to annotate
text = sys.argv[3]                     # search string


print(type(pgnum))
print('python...')
print(text)


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
for r in rects:
	#myannot=page.addHighlightAnnot(r)
	col=(1,1,0)               # yellow
	#col=(1.000, 0.412, 0.706) # hotpink

	myannot=page.drawRect(r, color=col, fill=col,overlay=False)
	found=True

if not found:
	print('could not find string!')

doc.saveIncr()
os.system('pkill -HUP mupdf')
