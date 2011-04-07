/**
 * Created by ${PRODUCT_NAME}.
 * User: Alexnder
 * Date: 07.03.11
 * Time: 19:15
 * To change this template use File | Settings | File Templates.
 */
package component {
import flash.display.Sprite;
import flash.text.TextField;
import flash.events.*;

public class CButton extends Sprite {

    protected var button:Sprite = new Sprite();
    protected  var textLabel:TextField
    public function CButton() {
        drawButton()
        button.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
        addChild(button);
    }

    private function drawButton():void {
        textLabel = new TextField()
        button.graphics.clear();
        button.graphics.beginFill(0xD4D4D4); // grey color
        button.graphics.drawRoundRect(0, 0, 180, 50, 10, 10); // x, y, width, height, ellipseW, ellipseH
        button.graphics.endFill();
        textLabel.text = "dafault";
        textLabel.x = 10;
        textLabel.y = 5;
        textLabel.selectable = false;
        button.addChild(textLabel)
    }

    private function mouseDownHandler(event:MouseEvent):void {

    }
    public function locate(x:int = 0, y:int = 0):void{
        this.x = x;
        this.y = y;
    }
      protected function notifyListeners(ev:String) {
          var e:Event = new Event(ev, false, false);
          dispatchEvent(e);
    }
}
}
