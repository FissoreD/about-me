serve:
	bundle exec jekyll s

build:
	bundle exec jekyll b

install_js_deps:
	npm install && \
	NODE_ENV=production npx rollup -c --bundleConfigAsCjs

build-all:
	$(MAKE) install_js_deps &&\
	$(MAKE) build