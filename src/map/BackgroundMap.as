/**
 * Created by ${PRODUCT_NAME}.
 * User: Alexnder
 * Date: 19.03.11
 * Time: 1:19
 * To change this template use File | Settings | File Templates.
 */
package map {
import flash.display.Sprite;
import flash.display.Loader;
public class BackgroundMap extends Sprite {
    public function BackgroundMap() {
    }
      public function initImage(image:Sprite):void{
        this.addChild(image);
    }
}
}
