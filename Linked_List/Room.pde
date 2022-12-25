class Room {
  Room next; //stores the next room
  Room previous; //stores the previous room
  PImage room; //stores the current room image

  Room(PImage room) { //constructor
    this.room=room; //creates a new toom
  }
}
