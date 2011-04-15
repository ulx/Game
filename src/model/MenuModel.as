/**
 * Created by ${PRODUCT_NAME}.
 * User: Alexnder
 * Date: 18.03.11
 * Time: 13:41
 * To change this template use File | Settings | File Templates.
 */
package model {
import Setting.Settings;
import flash.display.Sprite;
import flash.net.URLRequest;
import flash.net.URLLoader
import flash.events.Event;
import flash.events.*;


public class MenuModel extends Sprite {
    private var xml:XML;
    private var loader:URLLoader;
    private var elementMenu: Array;
    private var menu:Array;
    public function MenuModel() {

        menu = new Array();
        loader = new URLLoader();
        loader.load(new URLRequest(Settings.xmlMenu));
        loader.addEventListener(Event.COMPLETE, xmlLoaded);
        loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
        loader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
    }

    private function httpStatusHandler(e:Event):void {
        trace("httpStatusHandler");
    }
       private function ioErrorHandler(e:Event):void {
           trace("ioErrorHandler");
    }
    private function xmlLoaded(e:Event):void {
            xml = new XML(e.target.data);
            initMenu();
    }
    private function initMenu():void {

        var i:int = 0 ;
        for each (var item:XML in xml.children()) {
            elementMenu = new Array();
            elementMenu["name"] = item.attribute("name");
            elementMenu["id"] = item.attribute("id");
            elementMenu["level_max"] = item.attribute("level_max");
            menu[i] = elementMenu;
            i++;
        }
        notifyListeners(Settings.loadItemMenu);
    }
      private function notifyListeners(ev:String):void {
          var e:Event = new Event(ev, false, false);
          dispatchEvent(e);
    }
    public  function get propertisMenu():Array{
        return menu;
    }


}
}
