/**
 * Created by ${PRODUCT_NAME}.
 * User: Alexnder
 * Date: 07.03.11
 * Time: 18:50
 * To change this template use File | Settings | File Templates.
 */
package component {
import Setting.Settings;
import flash.events.MouseEvent;
public class MakeButton extends CButton {
    public function MakeButton() {
        button.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
        textLabel.text = "Make" ;
    }
     private function mouseDownHandler(event:MouseEvent):void {
            notifyListeners(Settings.makeButton);
    }

}
}
