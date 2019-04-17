PREFIX?=/usr/local
INSTALL_NAME = package_outdated

install: build install_bin

build:
	swift package update
	swift build -c release

install_bin:
	mkdir -p $(PREFIX)/bin
	mv .build/Release/package_outdated .build/Release/$(INSTALL_NAME)
	install .build/Release/$(INSTALL_NAME) $(PREFIX)/bin

uninstall:
	rm -f $(PREFIX)/bin/$(INSTALL_NAME)