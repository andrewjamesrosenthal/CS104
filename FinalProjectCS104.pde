enum GameState {
  LOAD, CRAWL
}
PImage img;
GameState gameState = GameState.LOAD;
PFont font;
float yPos; // y-position of text
String crawlText = "GALAXY AT WAR In the distant reaches of the cosmos, a conflict rages across the stars. The Galactic Union, guardians of peace and freedom, struggles against the relentless advance of the Void Empire. In these desperate times, heroes are born. You are the pilot of the Starblade, the Union's most agile and advanced spacecraft. As the Union's last hope, you must navigate through treacherous asteroid fields, face off against the Empire's fearsome fleet, and survive the onslaught of their relentless pursuers. Your mission is critical. You must deliver vital information that could turn the tide of the war. The journey is fraught with danger, with the Void Empire's agents lurking in every shadow of space. Fly with skill, pilot. The fate of the galaxy rests in your hands.";

int squareX = 0; // Define squareX outside the draw function

void setup() {
  img = loadImage("crawlBackground.png");

  size(750, 750);
  font = createFont("Arial-Bold", 24);
  yPos = height;
  textFont(font);
  textSize(24);
}

void draw() {
  background(255);
  switch (gameState) {
  case LOAD:
    loading();
    break;
  case CRAWL:
    background(img);
    crawl();
    break;
  }
}

void loading() {
  // Define square size and speed
  int squareSize = 150;
  float speed = 2;

  if (squareX < (width / 2) - 1) {
    squareX += speed;
  }

  fill(255, 0, 0); // Red square
  square(width - squareX - squareSize, height / 2 - squareSize / 2, squareSize);

  fill(0, 0, 255); // Blue square
  square(squareX, height / 2 - squareSize / 2, squareSize);
  if (squareX >= (width / 2) - 1) {
    displayText();
  }
}

void crawl() {
  textSize(44);
  fill(255, 255, 0);
  textAlign(CENTER, CENTER);
  float textWidth = width / 1.5; // Set the width of the text box to 1/3 of the window width
  text(crawlText, width / 2 - textWidth / 2, yPos, textWidth, height); // Text box for wrapping the text

  yPos -= 1.4; // Move the text upwards

  // Reset if the text goes off-screen
  if (yPos + textAscent() + textDescent() < 0) {
    yPos = height;
  }
}

void displayText() {
  background(0);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(32);
  text("Andrew & Andrew Games", width / 2, height / 2);
  textAlign(CENTER, BOTTOM);
  text("PRESS ENTER TO PLAY", width / 2, height - 30);
}

void keyPressed() {
  if (keyCode == ENTER && gameState == GameState.LOAD) {
    gameState = GameState.CRAWL;
    yPos = height; // Reset the position of crawl text
  }
}
