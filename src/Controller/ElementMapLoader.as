/**
 * Created by ${PRODUCT_NAME}.
 * User: Alexnder
 * Date: 18.03.11
 * Time: 18:23
 * To change this template use File | Settings | File Templates.
 */
package Controller {
import Setting.Settings;
import flash.display.Loader;
import flash.display.Sprite;
import flash.net.URLRequest;
import flash.events.Event;
import flash.events.*;
public class ElementMapLoader extends Sprite {
    private var xml:XML;
    private var loader:Loader;
    public function ElementMapLoader(s:String) {
        loader = new Loader();
        loader.load(new URLRequest(s));
        loader.addEventListener(Event.COMPLETE, xmlLoaded);
        loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
        loader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
        this.addChild(loader);
    }
     private function httpStatusHandler(e:Event):void {
        trace("httpStatusHandler");
    }
       private function ioErrorHandler(e:Event):void {
           trace("ioErrorHandler");
    }
    private function xmlLoaded(e:Event):void {
         xml = new XML(e.target.data);
         initImage(Settings.loadImageElementMap);
    }

    private function initImage(ev:String):void {
          var e:Event = new Event(ev, false, false);
          dispatchEvent(e);
    }

}
}
