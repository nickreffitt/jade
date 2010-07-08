
LIB_PREFIX = ~/.node_libraries
PREFIX = /usr/local

install:
	cp -f bin/jade $(PREFIX)/bin/jade
	cp -f lib/jade.js $(LIB_PREFIX)/jade.js

uninstall:
	rm -f $(PREFIX)/bin/jade
	rm -f $(LIB_PREFIX)/jade.js

test:
	@./support/expresso/bin/expresso -I lib -I support/markdown/lib test/*.js

test-cov:
	@./support/expresso/bin/expresso -I lib -I support/markdown/lib --cov test/*.js

api.html: lib/jade.js
	@dox --title "Jade" \
		 --desc "Jade is a high performance template engine for [node](http://nodejs.org), inspired by [haml](http://haml-lang.com/), created by [TJ Holowaychuk](http://github.com/visionmedia)." \
		 $< > $@

.PHONY: install uninstall test test-cov example