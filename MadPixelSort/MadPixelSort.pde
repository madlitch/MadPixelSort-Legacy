import processing.core.*;
import controlP5.*;
import java.io.File;

    private static PImage img = null;
    private float ratio;
    private int sMode;
    private int cMode;
    private int lastsMode;
    private int lastcMode;
    private int savMode;
    private boolean isLoaded;
    private String filepath;
    private String savePath;
    private int darkGrey = color(34,34,34);
    private int lightBlue = color(0,198,255);
    private int pink = color(255,0,246);
    private int lightGrey = color(90,90,90);
    private int white = color(255);
    private int briController = 60;
    private int blackController = 60;
    private int whiteController = 60;
    private int hueController = 60;
    private int satController = 60;
    private int loops = 1;

    public void settings() {
        size(250, 700);
        pixelDensity(displayDensity());
    }

    public void setup() {
        ControlP5 gui;
        fill(darkGrey);
        rect(0,0,250,700);
        PFont barFont;
        PFont labelFont;
        PFont titleFont;
        if(displayDensity() == 2){
            barFont = createFont("Montdd.ttf",6);
            labelFont = createFont("Montdd.ttf",7);
            titleFont = createFont("Montdd.ttf",14);
        }else{
            barFont = createFont("Montdd.ttf",12);
            labelFont = createFont("Montdd.ttf",14);
            titleFont = createFont("Montdd.ttf",28);
        }

        surface.setResizable(false);
        
        gui = new ControlP5(this);

        //TITLE

        gui.addTextlabel("mad")
                .setText("MAD")
                .setPosition(0,5) //lightBlue
                .setColorValue(pink)
                .setFont(titleFont);

        gui.addTextlabel("title")
                .setText("PIXELSORT")
                .setPosition(72,5)
                .setColorValue(255)
                .setFont(titleFont);

        gui.addTextlabel("credit")
                .setText("made with love by")
                .setPosition(5,35)
                .setColorValue(lightBlue)
                .setFont(labelFont);

        gui.addTextlabel("name")
                .setText("@madlitch")
                .setPosition(150,35)
                .setColorValue(255)
                .setFont(labelFont);

        // PARAMETERS

        gui.addTextlabel("labelV")
                .setText("SORT VERTICALLY")
                .setPosition(5, 80)
                .setColorValue(255)
                .setFont(labelFont);

        gui.addTextlabel("labelH")
                .setText("SORT HORIZONTALLY")
                .setPosition(5, 110)
                .setColorValue(255)
                .setFont(labelFont);

        gui.addTextlabel("labelVH")
                .setText("DO BOTH")
                .setPosition(5, 140)
                .setColorValue(255)
                .setFont(labelFont);

        gui.addRadioButton("sortingMode")
                .setPosition(220, 80)
                .setSize(20,20)
                .setColorForeground(lightBlue)
                .setColorBackground(lightGrey)
                .setItemsPerRow(1)
                .setSpacingRow(10)
                .addItem("V",1)
                .addItem("H",2)
                .addItem("B",3)
                .setColorLabel(darkGrey)
                .activate(0);

        sMode = 1;

        gui.addTextlabel("sortby")
                .setText("SORT BY:")
                .setPosition(5, 180)
                .setColorValue(lightBlue)
                .setFont(labelFont);

        gui.addTextlabel("labelBrightness")
                .setText("BRIGHTNESS THRESHOLD")
                .setPosition(5,200)
                .setColorValue(255)
                .setFont(labelFont);

        gui.addSlider("briController")
                .setBroadcast(false)
                .setPosition(10, 220)
                .setSize(200, 20)
                .setHandleSize(10)
                .setRange(0, 255)
                .setValue(60)
                .setBroadcast(true)
                .setColorBackground(lightGrey)
                .setColorForeground(lightBlue)
                .setColorValueLabel(white)
                .setLabelVisible(true)
                .setFont(barFont)
                .setLabel("");

        gui.addTextlabel("labelBlack")
                .setText("BLACK THRESHOLD")
                .setPosition(5,245)
                .setColorValue(255)
                .setFont(labelFont);

        gui.addSlider("blackController")
                .setBroadcast(false)
                .setPosition(10, 265)
                .setSize(200, 20)
                .setHandleSize(10)
                .setRange(0, 1000)
                .setBroadcast(true)
                .setColorBackground(lightGrey)
                .setColorForeground(lightBlue)
                .setLabelVisible(true)
                .setFont(barFont)
                .setLabel("");

        gui.addTextlabel("labelWhite")
                .setText("WHITE THRESHOLD")
                .setPosition(5,290)
                .setColorValue(255)
                .setFont(labelFont);

        gui.addSlider("whiteController")
                .setBroadcast(false)
                .setPosition(10, 310)
                .setSize(200, 20)
                .setHandleSize(10)
                .setRange(0, 1000)
                .setBroadcast(true)
                .setColorBackground(lightGrey)
                .setColorForeground(lightBlue)
                .setLabelVisible(true)
                .setFont(barFont)
                .setLabel("");

        gui.addTextlabel("labelHUE")
                .setText("HUE THRESHOLD")
                .setPosition(5,335)
                .setColorValue(255)
                .setFont(labelFont);

        gui.addSlider("hueController")
                .setBroadcast(false)
                .setPosition(10, 355)
                .setSize(200, 20)
                .setHandleSize(10)
                .setRange(0, 360)
                .setBroadcast(true)
                .setColorBackground(lightGrey)
                .setColorForeground(lightBlue)
                .setLabelVisible(true)
                .setFont(barFont)
                .setLabel("");

        gui.addTextlabel("labelSat")
                .setText("SATURATION THRESHOLD")
                .setPosition(5,380)
                .setColorValue(255)
                .setFont(labelFont);

        gui.addSlider("satController")
                .setBroadcast(false)
                .setPosition(10, 400)
                .setSize(200, 20)
                .setHandleSize(10)
                .setRange(0, 255)
                .setBroadcast(true)
                .setColorBackground(lightGrey)
                .setColorForeground(lightBlue)
                .setLabelVisible(true)
                .setFont(barFont)
                .setLabel("");

        gui.addRadioButton("colorMode")
                .setPosition(220, 220)
                .setSize(20,20)
                .setColorForeground(lightBlue)
                .setColorBackground(lightGrey)
                .setItemsPerRow(1)
                .setSpacingRow(25)
                .addItem("1",1)
                .addItem("2",2)
                .addItem("3",3)
                .addItem("4",4)
                .addItem("5",5)
                .setColorLabel(darkGrey)
                .activate(0);

        cMode = 1;

        gui.addTextlabel("labelLoop")
                .setText("LOOPS")
                .setPosition(5,440)
                .setColorValue(255)
                .setFont(labelFont);

        gui.addSlider("loops")
                .setBroadcast(false)
                .setPosition(10, 460)
                .setSize(230, 20)
                .setHandleSize(10)
                .setRange(1, 11)
                .setBroadcast(true)
                .setColorBackground(lightGrey)
                .setColorForeground(lightBlue)
                .setLabelVisible(true)
                .setFont(barFont)
                .setNumberOfTickMarks(10)
                .setLabel("");


        // BUTTONS AND TEXTFIELD

        gui.addButton("LOAD")
                .setPosition(10,510)
                .setSize(230,30)
                .setColorBackground(lightGrey)
                .setColorForeground(lightBlue)
                .setFont(labelFont);

        gui.addButton("SORT")
                .setPosition(10,550)
                .setSize(230,30)
                .setColorBackground(pink)
                .setColorForeground(lightBlue)
                .setFont(labelFont);

        gui.addButton("RESET")
                .setPosition(10,590)
                .setSize(230,30)
                .setColorBackground(lightGrey)
                .setColorForeground(lightBlue)
                .setFont(labelFont);

        gui.addButton("SAVE")
                .setPosition(10,630)
                .setSize(230,30)
                .setColorBackground(lightGrey)
                .setColorForeground(lightBlue)
                .setFont(labelFont);

        gui.addRadioButton("saveMode")
                .setPosition(10, 670)
                .setSize(20,20)
                .setColorForeground(lightBlue)
                .setColorBackground(lightGrey)
                .setItemsPerRow(3)
                .setSpacingRow(0)
                .setSpacingColumn(65)
                .addItem("T",1)
                .addItem("J",2)
                .addItem("P",3)
                .setColorLabel(darkGrey)
                .setFont(labelFont)
                .activate(0);

        savMode = 1;

        gui.addTextlabel("labelTiff")
                .setText("TIFF")
                .setPosition(30, 670)
                .setColorValue(255)
                .setFont(labelFont);

        gui.addTextlabel("labelJPEG")
                .setText("JPEG")
                .setPosition(115, 670)
                .setColorValue(255)
                .setFont(labelFont);

        gui.addTextlabel("labelPNG")
                .setText("PNG")
                .setPosition(200, 670)
                .setColorValue(255)
                .setFont(labelFont);
    }

    public void sortingMode(int a) {
        sMode = a;
    }

    public void colorMode(int a) {
        cMode = a;
    }

    public void saveMode(int a) {
        savMode = a;
    }

    public void RESET() {
        if (isLoaded) {
            img = loadImage(filepath);
            ratio = (img.width/(float)img.height);
            surface.setSize((int)(ratio*700.0) + 250,700);
            img.loadPixels();
            redraw();
        }
    }

    public void SORT() {
        if (isLoaded){
            switch (cMode){
                case 1:
                    sort(sMode, cMode, briController, loops);
                    break;
                case 2:
                    sort(sMode, cMode, -16800000 + blackController*5000 , loops);
                    break;
                case 3:
                    sort(sMode, cMode, -13000000 + whiteController*10000, loops);
                    break;
                case 4:
                    sort(sMode, cMode, hueController, loops);
                    break;
                case 5:
                    sort(sMode, cMode, satController, loops);
                    break;
            }
            lastcMode = cMode;
            lastsMode = sMode;
        }
    }

    public void SAVE() {
        if(isLoaded){
            selectFolder("Select a folder to save to:", "folderSelected");
            String saveFileName = stripFileExtension(filepath);
            System.out.println(stripFileExtension(filepath));
            System.out.println(saveFileName);
            String saveExt = "";
            switch(lastsMode){
                case 1:
                    saveExt += "_V";
                    break;
                case 2:
                    saveExt += "_H";
                    break;
                case 3:
                    saveExt += "_VH";
                    break;
            }
            switch (lastcMode){
                case 1:
                    saveExt += "_BRI" + briController;
                    break;
                case 2:
                    saveExt += "_BLK" + blackController;
                    break;
                case 3:
                    saveExt += "_W" + whiteController;
                    break;
                case 4:
                    saveExt += "_H" + hueController;
                    break;
                case 5:
                    saveExt += "_S" + satController;
                    break;
            }
            switch(savMode){
                case 1:
                    saveExt += ".tiff";
                    break;
                case 2:
                    saveExt += ".jpeg";
                    break;
                case 3:
                    saveExt += ".png";
                    break;
            }
            img.save(savePath +  "/" + saveFileName + "_" + saveExt);
        }
    }

    public void LOAD() {
        selectInput("Select a file to sortImage:", "fileSelected");
    }

    private String stripFileExtension(String s) {
        s = s.substring(s.lastIndexOf('/')+1, s.length());
        s = s.substring(s.lastIndexOf('\\')+1, s.length());
        s = s.substring(0, s.lastIndexOf('.'));
        return s;
    }

    public void draw() {
        fill(darkGrey);
        rect(0,0,250,700);
        if(img != null)
            image(img,250,0, (ratio*700), 700);
    }
    public void folderSelected(File selection) {
        if (selection == null) {
            println("Window was closed or the user hit cancel.");
        } else {
            println("User selected " + selection.getAbsolutePath());
            savePath = selection.getAbsolutePath();
        }
    }

    public void fileSelected(File selection) {
        if (selection == null) {
            println("Window was closed or the user hit cancel.");
        } else {
            println("User selected " + selection.getAbsolutePath());
            filepath = selection.getAbsolutePath();
            img = loadImage(filepath);
            ratio = (img.width/(float)img.height);
            surface.setSize((int)(ratio*700.0) + 250,700);
            img.loadPixels();
            isLoaded = true;
            redraw();
        }
    }

    private void sort(int direction, int colorMode, int threshold, int loops) {
        int column = 0;
        int row = 0;
        int width = img.width;
        int height = img.height;

        for(int i = 1; i <= loops; i++){
            switch (direction) {
                case 1:
                    loopColumns(column, width, threshold, colorMode);
                    break;
                case 2:
                    loopRows(row, height, threshold, colorMode);
                    break;
                case 3:
                    loopRows(row, height, threshold, colorMode);
                    loopColumns(column, width, threshold, colorMode);
                    break;
            }
        }
    }

    private void loopColumns(int column, int width, int threshold, int colorMode) {
        while(column < width - 1) {
            img.loadPixels();
            sortColumn(column, threshold, colorMode);
            column++;
            img.updatePixels();
        }
    }

    private void loopRows(int row, int height, int threshold, int colorMode) {
        while(row < height - 1){
            img.loadPixels();
            sortRow(row, threshold, colorMode);
            row++;
            img.updatePixels();
        }

    }

    private void sortRow(int current, int threshold, int colorMode) {
        int x = 0;
        int xEnd = 0;
        int width = img.width;

        while(xEnd < width - 1){
            x = getFirstX(x, current, threshold, width, colorMode);
            xEnd = getNextX(x, current, threshold, width, colorMode);

            if (x < 0)
                break;

            int sortLength = xEnd - x;
            int[] sorted, unsorted = new int[sortLength];

            for(int i = 0; i < sortLength; i++)
                unsorted[i] = img.pixels[x + i + current * width];

            sorted = sort(unsorted);

            for(int i=0; i<sortLength; i++)
                img.pixels[x + i + current * width] = sorted[i];

            x = xEnd + 1;
        }
    }

    private void sortColumn(int current, int threshold, int colorMode) {
        int y = 0;
        int yEnd = 0;
        int width = img.width;
        int height = img.height;

        while(yEnd < height - 1){
            y = getFirstY(current, y, threshold, width, height, colorMode);
            yEnd = getNextY(current, y, threshold, width, height, colorMode);

            if (y < 0)
                break;

            int sortLength = yEnd - y;
            int[] sorted, unsorted = new int[sortLength];

            for(int i = 0; i < sortLength; i++)
                unsorted[i] = img.pixels[current + (i + y) * width];

            sorted = sort(unsorted);

            for(int i=0; i<sortLength; i++)
                img.pixels[current + (i + y) * width] = sorted[i];

            y = yEnd + 1;
        }
    }



    private int getFirstX(int x, int y, int threshold, int width, int colorMode) {
        while(checkFirst(x, y, threshold, width, colorMode)){
            x++;
            if(x >= width)
                return - 1;
        }
        return x;
    }


    private int getNextX(int x, int y, int threshold, int width, int colorMode) {
        x++;
        while(checkNext(x, y, threshold, width, colorMode)){
            x++;
            if(x >= width)
                return width - 1;
        }
        return x - 1;
    }

    private int getFirstY(int x, int y, int threshold, int width, int height, int colorMode) {
        if(y < height)
            while(checkFirst(x, y, threshold, width, colorMode)){
                y++;
                if(y >= height)
                    return - 1;
            }
        return y;
    }


    private int getNextY(int x, int y, int threshold, int width, int height, int colorMode) {
        y++;
        if(y < height)
            while(checkNext(x, y, threshold, width, colorMode)){
                y++;
                if(y >= height)
                    return height - 1;
            }
        return y - 1;
    }

    private boolean checkNext(int x, int y, int threshold, int width, int colorMode){
        switch (colorMode) {
            case 1:
                if (brightness(img.pixels[x + y * width]) <= threshold)
                    return false;
                break;
            case 4:
                if (hue(img.pixels[x + y * width]) <= threshold)
                    return false;
                break;
            case 5:
                if (saturation(img.pixels[x + y * width]) <= threshold)
                    return false;
                break;
            default :
                if (img.pixels[x + y * width] <= threshold)
                    return false;
                break;
        }
        return true;
    }

    private boolean checkFirst(int x, int y, int threshold, int width, int colorMode){
        switch (colorMode) {
            case 1:
                if (brightness(img.pixels[x + y * width]) > threshold)
                    return false;
                break;
            case 4:
                if (hue(img.pixels[x + y * width]) > threshold)
                    return false;
                break;
            case 5:
                if (saturation(img.pixels[x + y * width]) > threshold)
                    return false;
                break;
            default :
                if (img.pixels[x + y * width] > threshold)
                    return false;
                break;
        }
        return true;
    
}
