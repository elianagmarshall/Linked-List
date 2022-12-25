Floor l; //constructs 1 object from the Floor class for the lower floor
Floor u; //constructs 1 object from the Floor class for the upper floor

int roomW=400; //width of the room images
int roomH=600; //height of the room images
int roomP=100; //x and y coordinates for the room position
PImage[] lRooms = new PImage[37]; //array to store the images of the lower rooms
PImage[] uRooms = new PImage[15]; //array to store the images of the upper rooms

int rectW=410; //width of the rectangle
int rectH=610; //height of the rectangle
int rectP=95; //x and y coordinates for the rectangle position

int circleSize=75; //size of the circles
int upCircleY=50; //y-coordinate for the upper circle
int downCircleY=750; //y-coordinate for the lower circle

int arrowW=11; //width of the arrows
int upArrowY=25; //y-coordinate for the up arrow
int downArrowY=725; //y-coordinate for the down arrow

PImage upArrow; //image of an up facing arrow
PImage downArrow; //image of a down facing arrow
boolean down=true; //boolean to determine whether or not the user is on the lower floor

void setup() {
  size(600, 800); //size of the run window
  background(255); //white background

  upArrow=loadImage("upArrow.png");
  downArrow=loadImage("downArrow.png");

  l=new Floor(); //initializes the class Floor for the lower floor
  u=new Floor(); //initilaizes the class Floor for the upper floor
  
  initializeImages();
  l.headCheck();
  u.headCheck();
}

void draw() {
  fill(0); //black fill colour for the rectangle
  rect(rectP, rectP, rectW, rectH); // draws a rectangle under the room images

  upstairs();
  downstairs();
}

void initializeImages() { //initializes the upstairs and downstairs images
  for (int index=0; index<lRooms.length; index++) { //index variable has an initial value of 0, must be less than the length of lRooms array, and increases by increments of 1
    lRooms[index]=loadImage("d"+str(index)+".JPG"); //loads the downstairs images
    lRooms[index].resize(roomW,roomH); //resizes the downstairs images
    l.append(lRooms[index]); //adds the downtairs images to a linked list
  }

  for (int index=0; index<uRooms.length; index++) { //index variable has an initial value of 0, must be less than the length of uRooms array, and increases by increments of 1
    uRooms[index]=loadImage("u"+str(index)+".JPG"); //loads the upstairs images
    uRooms[index].resize(400, 600); //resizes the upstairs images
    u.append(uRooms[index]); //adds the upstairs images to a linked list
  }
}

void upstairs() { //displays the upstairs rooms and changes the colours of the buttons
  if (down==false) { //if down is false
    fill(#C60000); //red fill colour for the upper button
    circle(width/2, upCircleY, circleSize); //displays the upper button
    image(upArrow, width/2-arrowW, upArrowY); //displays an up facing arrow in the upper button

    fill(#48C600); //green fill colour for the lower button
    circle(width/2, downCircleY, circleSize); //displays the lower button
    image(downArrow, width/2-arrowW, downArrowY); //displays a down facing arrow in the lower button

    image(u.location.room, roomP, roomP); //dsplays the upstairs rooms
  }
}

void downstairs() { //displays the downstairs room and changes the colours of the buttons
  if (down) { //if down is true
    fill(#48C600); //green fill colour for the upper button
    circle(width/2, upCircleY, circleSize); //displays the upper button
    image(upArrow, width/2-arrowW, upArrowY); //displays an up facing arrow in the upper button

    fill(#C60000); //red fill colour for the lower button
    circle(width/2, downCircleY, circleSize); //displays the lower button
    image(downArrow, width/2-arrowW, downArrowY); //displays a down facing arrow in the lower button

    image(l.location.room, roomP, roomP); //displays the downstairs rooms
  }
}

void keyPressed() {
  if (key==CODED) { //allows the use of special keys
    if (keyCode==RIGHT) { //if the right arrow key is pressed
      if (down) //if down is true
        l.forward(); //move forward in the linked list for the downstairs rooms
        else
        u.forward(); //move forward in the linked list for the upstairs rooms
    }
    if (keyCode==LEFT) { //if the left arrow key is pressed
      if (down) //if down is true
        l.backward(); //move backward in the linked list for the downstairs rooms
      else
        u.backward(); //move backward in the linked list for the upstairs rooms
    }
  }
}

void mousePressed() {
  if (mouseButton==LEFT) { //if the left mouse button is pressed
    if (dist(width/2, upCircleY, mouseX, mouseY)<circleSize/2) //if the mouse is inside the upper circle
      down=false; //down is false
    if (dist(width/2, downCircleY, mouseX, mouseY)<circleSize/2) //if the mouse is inside the lower circle
      down=true; //down is true
  }
}
