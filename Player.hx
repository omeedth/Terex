class Player extends h2d.Bitmap {
  // : -> "type of"

  // Dimension
  var height : Int;
  var width : Int;

  // Attributes
  var speed : Float;
  var acceleration : Float;

  // Movement
  var xMove : Float;
  var yMove : Float;

  // Controls
  var up : Int;
  var right : Int;
  var down : Int;
  var left : Int;

  public function new(width:Int,height:Int,speed:Float,up:Int,right:Int,down:Int,left:Int,camera:Camera) {
    super(h2d.Tile.fromColor(0xFF0000, width, height),camera);

    // Dimensions
    this.height = height;
    this.width = width;

    // Attributes
    this.speed = speed;

    // Movement
    this.xMove = 0;
    this.yMove = 0;

    // Controls
    this.up = up;
    this.right = right;
    this.down = down;
    this.left = left;

  }

  public function update(dt:Float,updateCnt:Int) {
    getInput();

    if(updateCnt % 5 == 0) {

    }

    if(updateCnt % 60 == 0) {
      //trace("yMove: " + yMove);
      //trace("xMove: " + xMove);
      //trace("rotation: " + rotation);
      //trace("(" + x + "," + y + ")");
    }

    moveAbsolute();
  }

  function moveAbsolute() {
    x += xMove; // * Math.cos(rotation);
    y += yMove; // * Math.cos(rotation);
  }

  function getInput() {

    // Reset
    xMove = 0;
    yMove = 0;

    if(hxd.Key.isDown(up)) {
      yMove = -speed;
    } else if(hxd.Key.isDown(down)) {
      yMove = speed;
    }

    if(hxd.Key.isDown(right)) {
      xMove = speed;
    } else if(hxd.Key.isDown(left)) {
      xMove = -speed;
    }
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
