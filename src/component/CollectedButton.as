/**
 * Created by ${PRODUCT_NAME}.
 * User: Alexnder
 * Date: 07.03.11
 * Time: 18:48
 * To change this template use File | Settings | File Templates.
 */
package component {
import Setting.Settings;
import flash.events.MouseEvent;
public class CollectedButton extends CButton {
    public function CollectedButton() {
        button.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
        textLabel.text = "Collected" ;
    }
     private function mouseDownHandler(event:MouseEvent):void {
               notifyListeners(Settings.collectedButton);
    }

}
}
