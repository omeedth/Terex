import h2d.TileGroup;
import hxd.Key;

// I am making my main be the timer and manager of the game
class Main extends hxd.App {
  // Debugging
  var updateCnt : Int;

  var font : h2d.Font;
  var tf : h2d.Text;

  var player : Player;
  var char:h2d.Bitmap;

  var camera : Camera;

  var map:TileGroup;

  override function init() {
      updateCnt = 0;

      camera = new Camera(s2d);

       var tile = h2d.Tile.fromColor(0x00ff00, 16, 16);

      map = new TileGroup(tile, camera);

      for (i in 0...1000)
      {
          map.add(Std.int(s2d.width * Math.random()), Std.int(s2d.height * Math.random()), tile);
      }

      player = new Player(100,100,8,.8,hxd.Key.UP,hxd.Key.RIGHT,hxd.Key.DOWN,hxd.Key.LEFT,camera);
      player.tile = player.tile.center();
      player.scaleX = player.scaleY = 0.50;
      player.tile = player.tile.center();
      player.x = 250;
      player.y = 250;

  }

  // dt = "Delta Time" ???
  override function update(dt:Float) {
    // increment the display bitmap rotation by 0.1 radians
    player.update(dt,updateCnt);
    updateCnt++;
    camera.viewX = player.x;
    camera.viewY = player.y;

    if(updateCnt % 60 == 0) {
      // trace("(" + camera.viewX + "," + camera.viewY + ")");
      // trace("(" + player.x + "," + player.y + ")");
    }
    
  }

  static function main() {
      new Main();
  }
}
