# PDF Web Slides

This is a fork of [pdf-webslides](https://github.com/misc0110/pdf-webslides). This version is transplanted to use [reveal.js](https://github.com/hakimel/reveal.js) instead of the original HTML5 slides.

Currently, this work use cloudflare CDN to load reveal.js. If you want to use a local copy of reveal.js, you can download the latest version from [reveal.js](https://github.com/hakimel/reveal.js) and replace the directory of js and css files in the `index.html.template` file.

## Usage

The first step is to convert a PDF to an HTML5 file. This is simply done by running

    pdf-webslides <pdf file>
    
The output is an `index.html` file and a corresponding `slides.js` in the current directory. Note that it is also possible to generate a standalone `index.html` using the `-s` option. If the HTML file is opened, it shows the slides in the same way as the original PDF. Slides can simply be navigated using left/right arrow keys, page-up/page-down keys, as well as by swiping over the slides.

### Presenter Mode

`reveal.js` has a presenter mode that can be used to show the current slide, the next slide, and the notes for the current slide. To use this mode, open the slides in a browser and press the `s` key. This will open a new window with the presenter view.

## Installation

### From Source

#### Linux

The tool depends on Poppler and Cairo for converting the PDF to SVGs. 
On Ubuntu, the dependencies can be installed through 

    apt install libcairo2-dev libpoppler-glib-dev
    
Then, the tool can be built by running

    make install
    
to install the tool as `pdf-webslides`.

#### macOS

On macOS, the dependencies can be installed through Homebrew

    brew install poppler cairo
    
Then, the tool can be built by running

    make install
