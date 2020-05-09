# MadPixelSort

MadPixelSort is a standalone program created to produce glitch effects 
in images by pixel processing.

![MadPixelSort Screenshot](/images/mpsscreenshot.png)

## Installation

 You will need Java 8 or above installed on your machine (https://www.java.com/en/download/).

Either download the respective executable for your operating system (under releases: https://github.com/madlitch/MadPixelSort/releases), or download Processing (https://processing.org/) and run the .pde in Processing.

## Usage
#### Sorting
Load the file you wish to pixel sort, it must be either a .jpeg or a .png.
Click the corresponding radio button of the mode you want to use. 
You can adjust the threshold sliders of each color sorting mode. 
The higher the threshold, the less pixels will
be included in the sorting run.

#### Saving
When prompted, choose the folder you wish to export the files to. After choosing the host folder, click the save button. You can save your exports as either .tiff, .jpeg, or .png files.

The program will create a folder named *filename*_*sorted*, and will save all your exports there.

The exported file will have a filename with this structure: 

*filename* _*direction* _*mode* *value*.*extension*

For example, for an image with the name DSC31, sorted vertically by brightness
with a threshold of 87, saved as a .tiff, the output will look like this:

DSC31_V_BRI87.tiff

The program does not keep track of stacked sorting, however whatever you see
in the preview window is what will be exported. The last options used
will be the ones shown in the file name.



## License
MIT License

Copyright (c) 2020 Massimo Albanese

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
