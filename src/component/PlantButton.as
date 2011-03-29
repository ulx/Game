/**
 * Created by ${PRODUCT_NAME}.
 * User: Alexnder
 * Date: 07.03.11
 * Time: 18:52
 * To change this template use File | Settings | File Templates.
 */
package component {
import Setting.Settings;

import flash.events.MouseEvent;


public class PlantButton extends CButton {
    public function PlantButton() {
        button.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
        textLabel.text = "Plant";
    }

    private function mouseDownHandler(event:MouseEvent):void {
        notifyListeners(Settings.plantButton);
    }


}
}
