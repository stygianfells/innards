
//roll initiative!!!
//---------------------
//this here little project is based on a bit of d&d 5e lore
//from the monster manual where it states that green dragons like to 
//live in forests and do shady stuff
//and i was like ooooh fun
//anyways enjoy
//---------------------
//i thought this vibe called for some Paul Hindemith tunes
//i dont usually like Hindemith that much his stuff is cold and precise
//although not without the merit of elegance, but it is all his own and very specific
//i don't have any hindemith solo scores on hand except exam repertoire and 
//thats scarring so lets not go there
//so the track is just


//the clock ticks, as ever!
int theinescapablegraspoftime, firstx, wingtickone, secondx, wingticktwo;

void setup() {
  size (1000, 600);
  theinescapablegraspoftime = 0;
  firstx = 1040;
  secondx = -100;
  wingtickone = 0;
  wingticktwo = 0;
}

void draw() {
  //back & aura lighting
  background(121, 162, 128);
  airandstuff();

  //the actual animation part
  theinescapablegraspoftime = theinescapablegraspoftime + 1;
  if (theinescapablegraspoftime > 60) {
    thefirstpass();
    firstx = firstx - 3;
  }

  if (theinescapablegraspoftime > 0) {
    //thesecondpass();
    secondx = secondx + 3;
  }

  //scenery elements: three tree layers, dirt, fore-rocks, mist
  //foreground layers of rock gradients and ground, creepy relics
  backTreesRocks();
  foregroundscenery();
  thesecondpass();
}

void airandstuff() {
  fill(131, 160, 135);
  stroke(131, 160, 135);
  beginShape();
  vertex(1000, 0);
  vertex(0, 0);
  vertex(0, 275);
  vertex(225, 300);
  vertex(425, 320);
  vertex(650, 315);
  vertex(875, 300);
  vertex(1000, 265);
  endShape();

  fill(143, 160, 139);
  stroke(143, 160, 139);
  beginShape();
  vertex(1000, 0);
  vertex(0, 0);
  vertex(0, 150);
  vertex(250, 170);
  vertex(450, 180);
  vertex(630, 185);
  vertex(830, 175);
  vertex(1000, 160);
  endShape();
}

//i translated some scenery elements like the rocks and dirt layer to (0, 0)
//so i can move all the vertices around en masse if needed
//which i did sometimes

void backTreesRocks() {
  backmostTrees();
  midlineTrees();
  backDirtyLayer();
  foremostTrees();
  backFrontRocks();
  mist();
}

//tree trunks are stacks of quads because 
//if im using the Pshape function the vertices need to be in order
//and i dont want to memorize which vertices are which so i just used some quads instead
//i made sure to vary tree colour--faintest at back, darkest at front
//there are three layers of trees

void backmostTrees() {
  fill(118, 114, 101);
  stroke(118, 114, 101);
  //four quads per trunk, usually
  quad(30, 0, 39, 0, 43, 100, 28, 90);
  quad(43, 100, 28, 90, 26, 190, 45, 210);
  quad(26, 190, 45, 210, 47, 300, 24, 290);
  quad(47, 300, 24, 290, 23, 400, 49, 410);

  quad(200, 0, 210, 0, 212, 100, 199, 110);
  quad(199, 110, 212, 100, 214, 210, 198, 230);
  quad(198, 230, 214, 210, 215, 340, 199, 320);
  quad(199, 320, 215, 340, 216, 475, 198, 475);

  quad(930, 0, 944, 0, 945, 110, 929, 120);
  quad(945, 110, 929, 120, 928, 230, 946, 240);
  quad(946, 240, 928, 230, 927, 340, 947, 350);
  quad(947, 350, 927, 340, 928, 450, 946, 450);
}

void midlineTrees() {
  //bad spooky boulders of the intimidating Old-Forest-next-to-Crickhollow variety
  //murderous and evil
  fill(119, 129, 118);
  stroke(119, 129, 118);

  pushMatrix();
  translate(0, 10);
  beginShape();
  vertex(610, 430);
  vertex(618, 414);
  vertex(620, 411);
  vertex(630, 400);
  vertex(660, 405);
  vertex(670, 420); //heheheheheheh
  vertex(675, 430);
  endShape();
  popMatrix();

  pushMatrix();
  translate(30, -10);
  beginShape();
  vertex(640, 440);
  vertex(648, 419); //aaaaaaaaaaaa
  vertex(660, 411);
  vertex(674, 403);
  vertex(690, 396);
  vertex(706, 399);
  vertex(710, 404);
  vertex(714, 410);
  vertex(719, 420); //hehehehheehhheheheh
  endShape();
  popMatrix();

  //the actual trees, as advertised
  fill(90, 85, 69);
  stroke(90, 85, 69);
  quad(800, 0, 813, 0, 814, 110, 798, 120);
  quad(814, 110, 798, 120, 796, 230, 810, 220);
  quad(810, 220, 796, 230, 797, 340, 811, 350);
  quad(811, 350, 797, 340, 798, 440, 810, 450);

  //more nasty boulders
  fill(119, 129, 118);
  stroke(119, 129, 118);
  pushMatrix();
  translate(-70, 30);
  beginShape();
  vertex(275, 435);
  vertex(300, 408);
  vertex(310, 404);
  vertex(330, 407);
  vertex(350, 411); 
  vertex(365, 420); //heheheheheheheh
  vertex(373, 440); //aaaaaaaaaaaa

  endShape();
  popMatrix();
}

void foremostTrees() {
  fill(72, 66, 49);
  stroke(72, 66, 49);
  quad(295, 0, 313, 0, 318, 110, 298, 100);
  quad(318, 110, 298, 100, 299, 290, 317, 300);
  quad(299, 290, 317, 300, 319, 410, 298, 400);
  quad(298, 400, 319, 410, 321, 540, 296, 550);

  quad(455, 0, 470, 0, 470, 100, 453, 110);
  quad(470, 100, 453, 110, 450, 200, 468, 210);
  quad(468, 210, 450, 200, 451, 310, 470, 300);
  quad(451, 310, 470, 300, 474, 460, 452, 450);
  quad(474, 460, 452, 450, 448, 550, 476, 550);

  quad(140, 0, 154, 0, 158, 110, 146, 100);
  quad(158, 110, 146, 100, 144, 210, 160, 220);
  quad(144, 210, 160, 220, 161, 310, 143, 310);
  quad(161, 310, 143, 310, 144, 450, 163, 450);
  quad(144, 450, 163, 450, 164, 550, 142, 550);

  quad(700, 0, 713, 0, 709, 110, 698, 100);
  quad(709, 110, 698, 100, 699, 220, 710, 210);
  quad(710, 210, 699, 220, 697, 320, 711, 320);
  quad(711, 320, 697, 320, 696, 410, 712, 420); //heheheheheheheheheh
  quad(712, 420, 696, 410, 697, 550, 714, 550);
}

//i added some fore-trees on top of the dirty layer for depth

void backDirtyLayer() {
  //dirt tm
  pushMatrix();
  translate(0, 0); 
  fill(59, 71, 58);
  stroke(59, 71, 58);
  beginShape();
  vertex(180, 600);
  vertex(180, 450);
  vertex(280, 460);
  vertex(310, 465);
  vertex(350, 455);
  vertex(380, 445);
  vertex(420, 440); //heheheheheheh
  vertex(480, 435);
  vertex(510, 440);
  vertex(570, 430);
  vertex(590, 425);
  vertex(640, 430);
  vertex(690, 420); //hehehehehehheheheheehheheheh
  vertex(710, 415);
  vertex(780, 405);
  vertex(800, 600);
  endShape();
  popMatrix();

  //mid-trees
  fill(90, 85, 69);
  stroke(90, 85, 69);
  quad(400, 0, 413, 0, 414, 110, 398, 120);
  quad(398, 120, 414, 110, 415, 340, 397, 320);
  quad(397, 320, 415, 340, 416, 450, 395, 460);
  quad(395, 460, 416, 450, 414, 550, 397, 550);

  pushMatrix();
  translate(-30, 0);
  quad(680, 0, 668, 0, 669, 110, 681, 100);
  quad(669, 110, 681, 100, 684, 210, 674, 230);
  quad(674, 230, 684, 210, 682, 320, 672, 330);
  quad(672, 330, 682, 320, 684, 410, 670, 420); //heheheheheh
  quad(670, 420, 684, 410, 685, 550, 669, 550);
  popMatrix();
}

//you can see me progressively getting smoother shapes out of the Pshape function lol
//hence the rocks on the left are a lot jankier than the ones on the right 

void backFrontRocks() {
  pushMatrix(); 
  translate(0, -25);
  fill(40, 46, 39);
  stroke(40, 46, 39);
  beginShape();
  vertex(0, 625);
  vertex(0, 410);
  vertex(30, 390); 
  vertex(70, 400);
  vertex(90, 435); 
  vertex(140, 440); //aaaaaaaaaaaa "shut up!!!"
  vertex(180, 464);
  vertex(210, 510);
  vertex(228, 505);
  vertex(240, 507);
  vertex(249, 511);
  vertex(280, 525);
  vertex(320, 520);
  vertex(450, 535);
  vertex(520, 515);
  vertex(550, 500);
  vertex(590, 504);
  vertex(600, 490);
  vertex(620, 480);
  vertex(655, 475);
  vertex(690, 460);
  vertex(760, 450);
  vertex(800, 410);
  vertex(820, 380);
  vertex(840, 370);
  vertex(860, 360);
  vertex(890, 355);
  vertex(920, 315);
  vertex(940, 310);
  vertex(950, 304);
  vertex(970, 300);
  vertex(990, 306);
  vertex(1000, 309);
  vertex(1000, 625);
  endShape();
  popMatrix();
}

//some good ol' **atmosphere***
//these are just copied and adjsuted shapes from earlier, opacity turned down
//so the background would also be gradient but the trees would also be affected
//they dont end at the same points as the background shapes (more dynamic!!!!!! :D)
//its kinda like they disappear into the heights
//mildly terrifying

void mist() {
  fill(131, 160, 135, 30);
  stroke(131, 160, 135, 30);

  pushMatrix();
  translate(0, 25);
  beginShape();
  vertex(1000, -25);
  vertex(0, -25);
  vertex(0, 275);
  vertex(225, 300);
  vertex(425, 320);
  vertex(650, 315);
  vertex(875, 285);
  vertex(1000, 230);
  endShape();
  popMatrix();

  fill(143, 160, 139, 30);
  stroke(143, 160, 139, 30);
  pushMatrix();
  translate(0, 25);
  beginShape();
  vertex(1000, -25);
  vertex(0, -25);
  vertex(0, 150);
  vertex(250, 170);
  vertex(450, 180);
  vertex(630, 185);
  vertex(830, 175);
  vertex(1000, 160);
  endShape();
  popMatrix();

  pushMatrix();
  translate(20, -75);
  beginShape();
  vertex(980, 0);
  vertex(-20, 0);
  vertex(0, 150);
  vertex(250, 170);
  vertex(450, 180);
  vertex(630, 185);
  vertex(830, 175);
  vertex(1000, 160);
  endShape();
  popMatrix();
}

//the dragon swoops past to the right in the distance
//a small shadow, kinda grey

void thefirstpass() {
  fill(83, 93, 81);
  stroke(83, 93, 81);

  pushMatrix();
  translate(firstx, 60);

  //front of body
  beginShape();
  vertex(-5, 58);
  vertex(-8, 49);
  vertex(-20, 48);
  vertex(-29, 47);
  vertex(-26, 44);
  vertex(-31, 47);
  vertex(-36, 49);
  vertex(-37, 51);
  vertex(-34, 52);
  endShape();

  //back half
  beginShape();
  vertex(-5, 57);
  vertex(-8, 49);
  vertex(10, 47);
  vertex(29, 49);
  vertex(42, 50);
  vertex(49, 53);
  vertex(40, 52);
  vertex(30, 52);
  endShape();

  //wings alternating (up and down beats)
  wingtickone = wingtickone + 1;
  if (wingtickone < 30) {
    //wings up shape
    beginShape();
    vertex(0, 0);
    vertex(12, 17);
    vertex(14, 30);
    vertex(0, 49);
    vertex(-8, 49);
    vertex(-10, 20);
    endShape();
  }

  if (wingtickone > 30) {
    //wings down shape
    beginShape();
    vertex(-5, 56);
    vertex(-4, 76);
    vertex(7, 95);
    vertex(16, 78);
    vertex(14, 67);
    vertex(5, 55);
    endShape();
  }

  if (wingtickone == 60) {
    wingtickone = 0;
  }

  popMatrix();
}

//the second swoop (left)
//the shadow is bigger and closer, less grey now

void thesecondpass() {
  pushMatrix();
  translate(secondx, 150);

  fill(67, 80, 65);
  stroke(67, 80, 65);

  //front half
  beginShape();
  vertex(3, 75);
  vertex(38, 72);
  vertex(30, 67);
  vertex(48, 76);
  vertex(49, 78);
  vertex(37, 78);
  vertex(2, 88);
  endShape();

  //back half
  beginShape();
  vertex(3, 75);
  vertex(2, 88);
  vertex(-20, 86);
  vertex(-38, 84);
  vertex(-54, 83);
  vertex(-74, 84);
  vertex(-50, 81);
  vertex(-30, 79);
  vertex(-9, 77);
  endShape();

  //wings--up and down again, same as the first iteration but more delay
  wingticktwo = wingticktwo + 1;
  if (wingticktwo < 40) {
    beginShape();
    vertex(0, 0);
    vertex(10, 45);
    vertex(3, 75);
    vertex(-9, 77);
    vertex(-24, 46);
    vertex(-21, 25);
    endShape();
  }

  if (wingticktwo > 40) {
    beginShape();
    vertex(-38, 84);
    vertex(-20, 84);
    vertex(-18, 100);
    
    endShape();
  }

  if (wingticktwo == 80) {
    wingticktwo = 0;
  } 
  popMatrix();
}

void foregroundscenery() {
  foreground();
  boneses();
}

//oooooh spoooooky

void boneses() {
  //fill(
  //stroke(

  beginShape();
  //vertex(

  endShape();
}

//just some civilian rocks

void foreground() {
  //gradient for the foremost land-shape
  //im big on gradients they really make all the difference
  pushMatrix(); 
  translate(0, 40);
  fill(36, 41, 35);
  stroke(36, 41, 35);
  beginShape();
  vertex(0, 625);
  vertex(0, 410);
  vertex(30, 400);
  vertex(60, 405);
  vertex(80, 415);
  vertex(100, 430);
  vertex(140, 440);
  vertex(180, 470);
  vertex(220, 500);
  vertex(280, 505);
  vertex(340, 520);
  vertex(430, 530);
  vertex(500, 515);
  vertex(610, 500);
  vertex(650, 480);
  vertex(720, 470);
  vertex(790, 430);
  vertex(850, 380);
  vertex(920, 360);
  vertex(970, 309);
  vertex(1000, 300);
  vertex(1000, 625);
  endShape();
  popMatrix();

  fill(32, 36, 31);
  stroke(32, 36, 31);
  beginShape();
  vertex(0, 600);
  vertex(0, 560);
  vertex(20, 556);
  vertex(100, 570);
  vertex(250, 565);
  vertex(370, 578);
  vertex(490, 587);
  vertex(600, 580);
  vertex(700, 573);
  vertex(810, 569);
  vertex(860, 564);
  vertex(900, 560);
  vertex(950, 555);
  vertex(1000, 540);
  vertex(1000, 540);
  vertex(1000, 600);
  endShape();
}
