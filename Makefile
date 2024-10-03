VERSION = $(shell cat VERSION)
CFLAGS += -g -Wall -DAPP_VERSION="\"$(VERSION)\"" -Wno-address-of-packed-member -Wextra
LDFLAGS +=
CC ?= gcc
PROGRAM = pdf-webslides
PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin
INSTALL_BIN = $(BINDIR)/$(PROGRAM)

all: $(PROGRAM)

$(PROGRAM): webslides.o cli.o utils.o res.o
	$(CC) webslides.o cli.o utils.o res.o $(LDFLAGS) -o $(PROGRAM) `pkg-config --libs poppler-glib`

webslides.o: webslides.c
	$(CC) webslides.c -c $(CFLAGS) `pkg-config --cflags --static poppler-glib`
	
cli.o: cli.c
	$(CC) cli.c -c $(CFLAGS)
	
utils.o: utils.c
	$(CC) utils.c -c $(CFLAGS)
	
res.o: resconv res.c index.html.template
	./resconv index.html.template > res_gen.c
	$(CC) res.c -c $(CFLAGS)

resconv: resconv.c
	$(CC) resconv.c -o resconv

deb: $(PROGRAM)
	fakeroot -u ./makedeb.sh

install: $(PROGRAM)
	install -d $(BINDIR)
	install -m 755 $(PROGRAM) $(INSTALL_BIN)
	
clean:
	rm -f *.o *.deb pdf-webslides resconv	
