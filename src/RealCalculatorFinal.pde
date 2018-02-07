Button [] numButton = new Button[10];
Button [] opButton = new Button[12];
String ls, rs;
float ans; // answer
char op; //operator
boolean left, eq; 
void setup() {
  size(270, 470);
  ls = "";
  rs = "";
  ans = 0.0;
  op = ' ';
  left = true;
  eq = false;
  //num keys
  numButton[0] = new Button(20, 400).asNumber(0, 110, 50);
  numButton[1] = new Button(20, 340).asNumber(1, 50, 50);
  numButton[2] = new Button(80, 340).asNumber(2, 50, 50);
  numButton[3] = new Button(140, 340).asNumber(3, 50, 50);
  numButton[4] =new Button(20, 280).asNumber(4, 50, 50);
  numButton[5] = new Button(80, 280).asNumber(5, 50, 50);
  numButton[6] =new Button(140, 280).asNumber(6, 50, 50);
  numButton[7] =new Button(20, 220).asNumber(7, 50, 50);
  numButton[8] =new Button(80, 220).asNumber(8, 50, 50);
  numButton[9]= new Button(140, 220).asNumber(9, 50, 50);
  //operators
  opButton[0] = new Button(20, 160).asOperator('c', 50, 50);
  opButton[1] = new Button(140, 400).asOperator('.', 50, 50);
  opButton[2] = new Button(200, 340).asOperator('=', 50, 110);
  opButton[3] = new Button(200, 280).asOperator('+', 50, 50);
  opButton[4] = new Button(200, 220).asOperator('*', 50, 50);
  opButton[5] = new Button(200, 160).asOperator('-', 50, 50);
  opButton[6] = new Button(140, 160).asOperator('/', 50, 50);
  opButton[7] = new Button(80, 160).asOperator('n', 50, 50);
  opButton[8] = new Button(20, 100).asOperator('%', 50, 50);
  opButton[9] = new Button(80, 100).asOperator('2', 50, 50);
  opButton[10] = new Button(140, 100).asOperator('3', 50, 50);
  opButton[11] = new Button(200, 100).asOperator('f', 50, 50);
}

void draw() {
  background (120);
  fill(255);
  for (int i=0; i<numButton.length; i++) {
    numButton[i].display();
    numButton[i].over();
  }
  for (int i=0; i<opButton.length; i++) {
    opButton[i].display();
    opButton[i].over();
  }
  updateDisplay();
}
void mouseReleased() {
  for (int i=0; i<numButton.length; i++) {
    if (numButton[i].hov && left) {
      ls += numButton[i].v;
    } else if (numButton[i].hov && !left) {
      rs += numButton[i].v;
    }
  }
  for (int i=0; i<opButton.length; i++) {
    if (opButton[i].hov && opButton[i].o == '+') { 
      left = false;
      op = opButton[i].o;
      rs = "";
    } else if (opButton[i].hov && opButton[i].o == '-') {
      left = false;
      op = opButton[i].o;
      rs = "";
    } else if (opButton[i].hov && opButton[i].o == '*') {
      left = false;
      op = opButton[i].o;
      rs = "";
    } else if (opButton[i].hov && opButton[i].o == '/') {
      left = false;
      op = opButton[i].o;
      rs = "";
    } else if (opButton[i].hov && opButton[i].o == 'c') {
      performClear();
    } else if (opButton[i].hov && opButton[i].o == '=') {
      eq = true;
      performCalc();
    } else if (opButton[i].hov && opButton[i].o == 'n') {
      if (left) {
        ans = float(ls)*-1;
        ls = str((float)ans);
      } else {
        ans = float(rs)*-1;
        rs = str((float)ans);
      }
    } else if (opButton[i].hov && opButton[i].o == '%') {
      if (left) {
        ans = float(ls)*0.01;
        ls = str((float)ans);
      } else {
        ans = float(rs)*0.01;
        rs = str((float)ans);
      }
    } else if (opButton[i].hov && opButton[i].o == 's') {
      if (left) {
        ans = sin(float(ls));
        ls = str((float)ans);
      } else {
        ans = sin(float(rs));
        rs = str((float)ans);
      }
    } else if (opButton[i].hov && opButton[i].o == 'c') {
      if (left) {
        ans = cos(float(ls));
        ls = str((float)ans);
      } else {
        ans = cos(float(rs));
        rs = str((float)ans);
      }
    } else if (opButton[i].hov && opButton[i].o == '.') {
      if (left) {
        ls += opButton[i].o;
      } else {
        rs += opButton[i].o;
      }
    } else if (opButton[i].hov && opButton[i].o == '2') {
      if (left) {
        ans = float(ls)*float(ls);
        ls = str((float)ans);
      } else {
        ans = float(rs)*float(rs);
        rs = str((float)ans);
      }
    } else if (opButton[i].hov && opButton[i].o == '3') {
      if (left) {
        ans = float(ls)*float(ls)*float(ls);
        ls = str((float)ans);
      } else {
        ans = float(rs)*float(rs);
        rs = str((float)ans);
      }
    } else if (opButton[i].hov && opButton[i].o == 'f') {
      if (left) {
        ans = 1/float(ls);
        ls = str((float)ans);
      } else {
        ans = 1/float(rs);
        rs = str((float)ans);
      }
    }
  }
}

void updateDisplay() {
  fill(180);

  stroke (0);
  rect(20, 30, 230, 50, 10);
  fill(0);
  //text(ls, 40, 80);
  //text(rs, 40, 90);
  //text(ans, 40, 100);
  //text((float)ans, 40, 110);
  if (eq) {
    text((float)ans, 40, 60);
  } else {
    if (left) {
      fill(0);
      text(ls, 40, 60);
    } else {
      fill(0);
      text(rs, 40, 60);
    }
  }
  //fill(255);
  // if (eq) {
  //  text((float)ans, 15, 80);
  //} else {
  //  if (left) {
  //    text(ls, 15, 80);
  //  } else {
  //    text(rs, 15, 80);
  //  }
  //}
  //eq = false;
}
void performCalc() {
  switch(op) {
  case '+': 
    ans = float(ls)+float(rs);
    ls = str((float)ans);
    left = true;
    break;
  case '-': 
    ans = float(ls)-float(rs);
    ls = str((float)ans);
    left = true;
    break;
  case '*': 
    ans = float(ls)*float(rs);
    ls = str((float)ans);
    left = true;
    break;
  case '/': 
    ans = float(ls)/float(rs);
    ls = str((float)ans);
    left = true;
    break;
  case '.':
    ans = float(ls)*.1;
    ls = str((float)ans);
    left = true;
    break;
  case '^':
    ans = pow(float(ls), float(rs));
    ls = str((float)ans);
    left = true;
    break;
  case '%':
    ans = float(ls)*.01;
    ls = str((float)ans);
    left = true;
    break;
  }
}
void performClear() {
  ls = "";
  rs = "";
  ans = 0;
  left = true;
  eq=false;
}