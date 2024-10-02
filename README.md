# PDF Web Slides 

This is a fork of [pdf-webslides](https://github.com/misc0110/pdf-webslides). This version is transplanted to use revel.js instead of the original HTML5 slides.

## Usage

The first step is to convert a PDF to an HTML5 file. This is simply done by running

    pdf-webslides <pdf file>
    
The output is an `index.html` file and a corresponding `slides.js` in the current directory. Note that it is also possible to generate a standalone `index.html` using the `-s` option. If the HTML file is opened, it shows the slides in the same way as the original PDF. Slides can simply be navigated using left/right arrow keys, page-up/page-down keys, as well as by swiping over the slides.

## Installation

### From Source

#### Linux

The tool depends on Poppler and Cairo for converting the PDF to SVGs. 
On Ubuntu, the dependencies can be installed through 

    apt install libcairo2-dev libpoppler-glib-dev
    
Then, the tool can be built by running

    make deb
    dpkg -i dist/pdf-webslides_0.4_amd64.deb
    
to install the tool as `pdf-webslides`.