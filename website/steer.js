
var font;
var vehicles = [];

function preload() {
  font = loadFont('AvenirNextLTPro-Demi.otf');
}

function setup() {
  createCanvas(displayWidth,displayHeight);
  background(51);
  // textFont(font);
  // textSize(192);
  // fill(255);
  // noStroke();
  // text('train', 100, 200);

  var points = font.textToPoints('HELLO', 180, 420, 300, {
    sampleFactor: 0.1
  });

  for (var i = 0; i < points.length; i++) {
    var pt = points[i];
    var vehicle = new Vehicle(pt.x, pt.y);
    vehicles.push(vehicle);

  }
}

function draw() {
  background(51);
  for (var i = 0; i < vehicles.length; i++) {
    var v = vehicles[i];
    v.behaviors();
    v.update();
    v.show();
  }
}





function mousePressed() {
  if (mouseX > 0 && mouseX < 100 && mouseY > 0 && mouseY < 100) {
    var fs = fullscreen();
    fullscreen(!fs);
  }
  }
