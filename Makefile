VERSION = $(shell cat VERSION)
CFLAGS += -g -Wall -DAPP_VERSION="\"$(VERSION)\"" -Wno-address-of-packed-member -Wextra
LDFLAGS +=
CC ?= gcc

all: pdf-webslides

pdf-webslides: webslides.o cli.o utils.o res.o
	$(CC) webslides.o cli.o utils.o res.o $(LDFLAGS) -o pdf-webslides `pkg-config --libs poppler-glib`

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

deb: pdf-webslides
	fakeroot -u ./makedeb.sh
	
clean:
	rm -f *.o *.deb pdf-webslides resconv	
