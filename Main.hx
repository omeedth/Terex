// I am making my main be the timer and manager of the game
class Main extends hxd.App {
  // Debugging
  var updateCnt : Int;

  var font : h2d.Font;
  var tf : h2d.Text;

  var player : Player;

  var camera : h2d.ObjectFollower;

  override function init() {
      // var tf = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
      // tf.text = "Hello World !";

      updateCnt = 0;

      // When I have this line the tile doesn't stay on the screen
      player = new Player(100,100,8,2.5,hxd.Key.UP,hxd.Key.RIGHT,hxd.Key.DOWN,hxd.Key.LEFT);

      // To draw the player you need to pass in a type of h2d.Object
      s2d.addChild(player.getBMP());

  }

  // dt = "Delta Time" ???
  override function update(dt:Float) {
    // increment the display bitmap rotation by 0.1 radians
    player.update(dt,updateCnt);
    updateCnt++;
  }

  static function main() {
      new Main();
  }
}
