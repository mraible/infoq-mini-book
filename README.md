# An InfoQ Mini-Book

This is an awesome book. It's written in AsciiDoc that compiles to HTML, PDF, EPUB, and MOBI using the Asciidoctor Gradle plugin.

## Building

To convert the AsciiDoc to HTML, PDF, EPUB, and MOBI, run the following command:
```
$ build.sh
```

* Open _build/asciidoc/html5/index.html_ in your browser to see the generated HTML file.
* Open _build/asciidoc/pdf/index.pdf_ in a PDF Reader to see the generated PDF file.
* Open _build/asciidoc/epub3/index.epub_ in iBooks to see the generated EPUB file.
* Open _build/asciidoc/epub3/index.mobi_ in [Calibre](http://calibre-ebook.com/) to see the generated MOBI file.

## Sweet Authoring Experience
If you'd like a very pleasant authoring experience, the project provides build files that make it possible. First of all,
you'll need to run `gradlew` once. After running it once, you can run `./gradlew watch` to watch for any changes and
recompile files as you save them.

To have a similar awesome experience (watch and auto-reload) in your browser, install and configure the following
programs on your machine:

* [Git](http://git-scm.com/): [The Github Guide to Installing Git](https://help.github.com/articles/set-up-git/) is a
  good source of information.
* [Node.js](https://nodejs.org/): Node allows you to run JavaScript programs that simplify web development.

After installing Node, you can run the following command to install development tools (like [Browsersync](http://www.browsersync.io/)).
You will only need to run this command when dependencies change in package.json.
```
#!shell
npm install
```
This project use [Grunt](http://gruntjs.com/) as the client-code build system. You can install the `grunt` command-line
tool globally with:
```
#!shell
npm install -g grunt-cli
```
Now you can run the following `grunt` command to create a blissful development experience where your browser auto-refreshes
when files change on your hard drive.
```
#!shell
grunt serve
```
