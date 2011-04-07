/**
 * Created by ${PRODUCT_NAME}.
 * User: Alexnder
 * Date: 08.03.11
 * Time: 13:32
 * To change this template use File | Settings | File Templates.
 */
package component {
import Setting.Settings;

import flash.text.TextField;
import flash.events.MouseEvent;
import flash.events.Event;
import flash.display.Sprite


public class MenuItem extends Sprite {
    //private var Name:String;
    private var field:TextField;
    public var propertis: Array;
    public var STATUS:Boolean;
    private var  ID:int;
    private var LABEL:String;
    public function MenuItem(label:String, id:int = 0) {
        STATUS = false;
        propertis = new Array();
        LABEL = label;
        ID = id;
        field = new TextField();
        field.addEventListener(MouseEvent.MOUSE_OVER, mouseOverItem);
		field.addEventListener(MouseEvent.MOUSE_OUT, mouseOutItem);
		field.addEventListener(MouseEvent.CLICK, itemClicked);

        field.backgroundColor =  Settings.menuItemNoActiv
        field.border = true;
        field.background = true;
        field.width = Settings.menuItemWidth;
        field.height = Settings.menuItemHeight;
        field.text = label;
        this.addChild(field);
        this.width = Settings.menuItemWidth;
        this.height = Settings.menuItemHeight;
    }

    private function visibleFalse(){
               //   field.visible = false;
    }

     private function itemClicked(ev:String) {
         notifyListenersClick(Settings.eventClickItemMenu);
         STATUS = true;
    }

    private function notifyListeners(ev:String) {
          var e:Event = new Event(ev, false, false);
          dispatchEvent(e);
    }

    private function notifyListenersClick(ev:String) {
          var e:Event = new Event(ev, false, false);
          dispatchEvent(e);
    }
    private function mouseOutItem(ev:String):void {
        field.backgroundColor =  Settings.menuItemNoActiv;

    }

    private function mouseOverItem(ev:String):void {
        field.backgroundColor =  Settings.menuItemActiv;
    }
    public function get label():String{
        return this.LABEL;
    }
    public function get id():int{
        return this.ID;
    }
     public function get status():Boolean{
        return this.STATUS;
    }
    public function set status(status:Boolean):void{
         this.STATUS = status;
    }

}
}
