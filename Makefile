test:
	./node_modules/.bin/mocha --recursive --compilers coffee:coffee-script-redux/register test/*.coffee --reporter tap

.PHONY: server test
