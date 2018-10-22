class Player {
  // : -> "type of"

  // Display
  var bmp : h2d.Bitmap;
  var tile : h2d.Tile;

  // Dimension
  var height : Int;
  var width : Int;

  // Attributes
  var speed : Float;
  var acceleration : Float;

  // Movement
  var xMove : Float;
  var yMove : Float;
  var xDir : Int;     // 1:Right, -1:Left, 0:Neutral
  var yDir : Int;     // 1:Up, -1:Down, 0:Neutral

  // Controls
  var up : Int;
  var right : Int;
  var down : Int;
  var left : Int;

  // Test
  var max : Float;
  var incr : Float;
  var num : Float;

  public function new(height:Int,width:Int,speed:Float,acceleration:Float,up:Int,right:Int,down:Int,left:Int) {

    // Dimensions
    this.height = height;
    this.width = width;

    // Attributes
    this.speed = speed;

    // Movement
    this.acceleration = acceleration;
    this.xMove = 0;
    this.yMove = 0;
    this.xDir = 0;
    this.yDir = 0;

    // Controls
    this.up = up;
    this.right = right;
    this.down = down;
    this.left = left;

    // Test
    max = -10;
    incr = .1;
    num = 0;

    // allocate a Texture with red color and creates a 100x100 Tile from it
    tile = h2d.Tile.fromColor(0xFF0000, width, height);

    // create a Bitmap object, which will display the tile
    // and will be added to our 2D scene (s2d)
    // CAN'T USE S2D because this class doesn't extend app or have the scene object
    // bmp = new h2d.Bitmap(tile,s2d);
    bmp = new h2d.Bitmap(tile);

    // modify the display position of the Bitmap sprite
    // CAN'T USE S2D because this class doesn't extend app or have the scene object
    // bmp.x = s2d.width * 0.5;
    // bmp.y = s2d.height * 0.5;

    // bmp.x = s2d.width * 0.5;
    // bmp.y = s2d.height * 0.5;

  }

  public function update(dt:Float,updateCnt:Int) {
    //bmp.rotation += 0.1;
    getInput();
    accelerate();

    if(updateCnt % 5 == 0) {
      // trace("num: " + num);
      //trace("max: " + Math.max(num + incr,-10));
      //num += incr;
      // num = goto(num,incr,max);
    }

    if(updateCnt % 60 == 0) {
      // trace("yMove: " + yMove);
      // trace("xMove: " + xMove);
      // trace("Directions (" + xDir + "," + yDir + ")");
    }

    move(dt);
  }

  function getInput() {

    // Reset
    xDir = 0;
    yDir = 0;
    // xMove = 0;
    // yMove = 0;

    if(hxd.Key.isDown(up)) {
      // yMove = -speed;
      yDir = -1;
    } else if(hxd.Key.isDown(down)) {
      // yMove = speed;
      yDir = 1;
    }

    if(hxd.Key.isDown(right)) {
      // xMove = speed;
      xDir = 1;
    } else if(hxd.Key.isDown(left)) {
      // xMove = -speed;
      xDir = -1;
    }
  }

  function accelerate() {

    // trace("xMove: " + xMove);
    // trace("yMove: " + yMove);

    if(xDir > 0) {
      xMove = goto(xMove,acceleration,speed);
    } else if (xDir < 0) {
      xMove = goto(xMove,acceleration,-speed);
    } else {
      xMove = goto(xMove,acceleration,0);
    }

    if(yDir > 0) {
      yMove = goto(yMove,acceleration,speed);
    } else if (yDir < 0) {
      yMove = goto(yMove,acceleration,-speed);
    } else {
      yMove = goto(yMove,acceleration,0);
    }
  }

  function goto(num:Float,increment:Float,max:Float):Float {
    var result1 = Math.min(num + increment,max);
    var result2 = Math.max(num - increment,max);
    return ((num < max) ? result1 : result2);
  }

  function move(dt:Float) {
    bmp.x += xMove * dt;
    bmp.y += yMove * dt;
  }

  public function getTile() : h2d.Tile {
    return tile;
  }

  public function getBMP() : h2d.Bitmap {
    return bmp;
  }

  public function getWidth() : Int {
    return width;
  }

  public function getHeight() : Int {
    return height;
  }

  public function getSpeed() : Float {
    return speed;
  }

  public function showAttributes() {
    return "Speed: " + speed;
  }

}
