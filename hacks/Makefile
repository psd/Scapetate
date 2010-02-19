# build gitscob representations from the yaml model

NAME=gitscob

INDIR=images
BINDIR=scripts
TEMPLATESDIR=templates
OUTDIR=$(NAME)

IMAGE=$(INDIR)/$(NAME).png
IN=$(INDIR)/$(NAME).yaml
TT=$(BINDIR)/yamltt.pl
LN=ln
RM=rm -f

TARGETS=\
	$(OUTDIR)/image.png\
	$(OUTDIR)/imagemap.html\
	$(OUTDIR)/cssmap.html\
	$(OUTDIR)/tiddlywiki.html

all:	$(TARGETS)

$(OUTDIR)/cssmap.html:	$(TEMPLATESDIR)/cssmap.html $(IN)
	$(TT) "$(IN)" "$(TEMPLATESDIR)/cssmap.html" "$@"

$(OUTDIR)/imagemap.html:	$(TEMPLATESDIR)/imagemap.html $(IN)
	$(TT) "$(IN)" "$(TEMPLATESDIR)/imagemap.html" "$@"

$(OUTDIR)/tiddlywiki.html:	$(TEMPLATESDIR)/tiddlywiki.html $(IN)
	$(TT) "$(IN)" "$(TEMPLATESDIR)/tiddlywiki.html" "$@"

$(OUTDIR)/image.png:	$(IMAGE)
	$(LN) $(IMAGE) $(OUTDIR)/image.png

# scary ..
clean::;	$(RM)  $(OUTDIR)/*
