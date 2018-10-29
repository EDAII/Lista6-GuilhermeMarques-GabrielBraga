PImage img;
PImage sortedImg;

void setup() {
    size(800, 264);
    background(55);
    img = loadImage("photo2.jpg");
    sortedImg = createImage(img.width, img.height, RGB);
    sortedImg.loadPixels();
    sortedImg = img.get();
    sortedImg.updatePixels();
}

void draw() {
    image(img, 0, 0);
    image(sortedImg, img.width, 0);
}