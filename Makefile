COMPILE=dot -O *.dot -T

# Structured Vector Graphics
.PHONY: svg svgz
svg svgz: *.dot.svg *.dot.svgz
%.dot.svg %.dot.svgz: %.dot
	${COMPILE} 'svg'

# png bitmap graphics
.PHONY: png
png: *.dot.png
%.dot.png: %.dot
	${COMPILE} 'png'

# jpeg bitmap graphics
.PHONY: jpg jpeg
jpg jpeg: *.dot.jpg *.dot.jpeg
%.dot.jpg %.dot.jpeg: %.dot
	${COMPILE} 'jpg'

# gif bitmap graphics
.PHONY: gif
gif: *.dot.gif
%.dot.gif: %.dot
	${COMPILE} 'gif'

# PDF
.PHONY: pdf
pdf: *.dot.pdf
%.dot.pdf: %.dot
	${COMPILE} 'pdf'

# xdot information encoded in JSON
.PHONY: json
json: *.dot.json
%.dot.json: %.dot
	${COMPILE} 'json'

# XFIG graphics
.PHONY: fig
fig: *.dot.fig
%.dot.fig: %.dot
	${COMPILE} 'fig'

# PostScript
.PHONY: ps
ps: *.dot.ps
%.dot.ps: %.dot
	${COMPILE} 'ps'

# imagemap files for httpd servers for each node or edge that has a non‐null href attribute.
.PHONY: imap
imap: *.dot.imap
%.dot.imap: %.dot
	${COMPILE} 'imap'

# client‐side imagemap for use in html and xhtml
.PHONY: cmapx
cmapx: *.dot.cmapx
%.dot.cmapx: %.dot
	${COMPILE} 'cmapx'

# Dot format containing layout information
.PHONY: dot
dot: *.dot.dot
%.dot.dot: %.dot
	${COMPILE} 'dot'

# Dot format containing complete layout information
.PHONY: xdot
xdot: *.dot.xdot
%.dot.xdot: %.dot
	${COMPILE} 'xdot'

.PHONY: clean
clean:
	rm ./*.dot.*
