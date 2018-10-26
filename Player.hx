class Player extends h2d.Bitmap {
  // : -> "type of"

  // Dimension
  var height : Int;
  var width : Int;

  // Attributes
  var speed : Float;
  public var acceleration : Float;

  // Movement
  var xMove : Float;
  var yMove : Float;

  // Controls
  var up : Int;
  var right : Int;
  var down : Int;
  var left : Int;

  public function new(width:Int,height:Int,speed:Float,acceleration:Float,up:Int,right:Int,down:Int,left:Int,camera:Camera) {
    super(h2d.Tile.fromColor(0xFF0000, width, height),camera);

    // Dimensions
    this.height = height;
    this.width = width;

    // Attributes
    this.speed = speed;
    this.acceleration = acceleration;

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
    trace(yMove);
    if(hxd.Key.isDown(up) && hxd.Key.isDown(down)){
      yMove = 0;
    }
    else if(hxd.Key.isDown(up)) {
      if(Math.abs(yMove) >= speed/2 && Math.abs(yMove) < speed){
        yMove = Math.max(yMove - acceleration, -speed);
       }
      else if(yMove == 0){
        yMove = -speed/2;
      }
    } else if(hxd.Key.isDown(down)) {
      if(Math.abs(yMove) >= speed/2 && Math.abs(yMove) < speed){
        yMove = Math.min(yMove + acceleration, speed);
       }
      else if (yMove==0){
        yMove = speed/2;
      }
    } else{
      yMove = 0;
    }

    if(hxd.Key.isDown(right) && hxd.Key.isDown(left)){
      xMove = 0;
    }
    else if(hxd.Key.isDown(right)) {
      if(Math.abs(xMove) >= speed/2 && Math.abs(xMove) < speed){
        xMove = Math.min(xMove + acceleration, speed);
       }
      else if (xMove == 0){
        xMove = speed/2;
      }
    } else if(hxd.Key.isDown(left)) {
      if(Math.abs(xMove) >= speed/2 && Math.abs(xMove) < speed){
        xMove = Math.max(xMove - acceleration, -speed);
       }
      else if (xMove == 0){
        xMove = -speed/2;
      }
    } else{
      xMove = 0;
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
