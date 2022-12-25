class Floor {
  Room head; //stores the head room
  Room current; //stores the current room
  Room location; //stores the location of the head

  boolean noLocation=true; //boolean to determine if location has been assigned an image

  void append(PImage room) { //adds a room to the linked list
    if (head==null) { //if there is no head room
      head=new Room(room); //create the head room
      return; //ends the function
    }
    current = head; //the current room becomes the head room
    while (current.next != null) { //while the current room is not at the end of the linked list
      current=current.next; //continue to the end of the linked list
    }
    current.next=new Room(room); //create a new room
    current.next.previous=current; //store the previous room
  }

  void forward() { //allows the user to move forwards in the linked list
    if (location.next!=null) //if the current location is not at the end of the linked list
      location = location.next; //traverse to the next room
  }

  void backward() { //allows the user to move backwards in the linked list
    if (location.previous!=null) //if the current location is not at the beginning of the linked list
      location=location.previous; //traverse to the previous room
  }

  void headCheck() { //assigns the initial position of the location
    if (noLocation) { //if the location has not been assigned an image
      location=head; //the location is at the head image
      noLocation=false; //the location has been assigned an image
    }
  }
}
