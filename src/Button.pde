class Button {
  int x, y, w, h;
  char o;
  boolean hov, num;
  String val;
  int v;

  //constructor
  Button(int x, int y) {
    this.x = x;
    this.y = y;
  }

  Button asNumber(int tempNumButtonValue, int w, int h) {
    num = true;
    v = tempNumButtonValue;
    this.w = w;
    this.h = h;
    return this;
  }

  Button asOperator(char o, int w, int h) {
    num = false;
    this.w =w;
    this.h =h;
    this.o =o;
    return this;
  }

  void display () {
    if (hov) {
      fill(150);
    } else {
      fill(255);
    }
    stroke(0);
    rect(x, y, w, h, 10);
    fill(0);
    textSize(14);
    if (num) {
      text(v, x+20, y+h-16);
    } else { 
      if ( o == 'n') {
        text("+/-", x+14, y+h-16);
      } 
      else if (o == '/') {
        text("/", x+20, y+h-16);
      } 
      else if (o == 'c') {
        text("c", x+20, y+h-16);
      } 
      else if (o == '+') {
        text("+", x+20, y+h-16);
      } 
      
      else if (o == '=') {
        text("=", x+20, y+h-16);
      } 
      else if (o == '-') {
        text("-", x+20, y+h-16);
      } 
      else if (o == '*') {
        text("x", x+20, y+h-16);
      }
      else if (o == '.') {
        text(".", x+20, y+h-16);
      }
      else if (o == '%') {
        text("%", x+20, y+h-16);
      }
      else if (o == '2') {
        text("x^2", x+20, y+h-16);
      }
   else if (o == '3') {
      text("x^3", x+13, y+h-16);
      }
      else if (o == 'f') {
        text("1/x", x+13, y+h-16);
      }
    }
  }
  //Click
  void over() {
    hov = mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h;
  }
}