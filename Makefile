BINDIR?=/tmp/

.PHONY: build install uninstall clean

build: configure.done version.ml
	obuild build

version.ml: VERSION
	echo "let version = \"$(shell cat VERSION)\"" > version.ml

configure.done: ffs.obuild
	obuild configure
	touch configure.done

install:
	install -m 0755 dist/build/ffs/ffs ${BINDIR}

uninstall:
	rm -f ${BINDIR}/ffs

clean:
	rm -rf dist configure.done
