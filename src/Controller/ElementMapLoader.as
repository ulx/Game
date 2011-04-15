/**
 * Created by ${PRODUCT_NAME}.
 * User: Alexnder
 * Date: 18.03.11
 * Time: 18:23
 * To change this template use File | Settings | File Templates.
 */
package Controller {
import Setting.Settings;

import flash.display.BitmapData;
import flash.display.Loader;
import flash.display.Sprite;
import flash.net.URLRequest;
import flash.events.Event;
import flash.events.*;

import cache.Cache

public class ElementMapLoader extends Sprite {
    private var loader:Loader;
    private var cacheElement:Cache;
    private var id:String;
    private var textureMap:BitmapData;
    public function ElementMapLoader(s:String) {
        cacheElement =  Cache.instance;
        id = s;
       // if (!cacheElement.isImage(s)) {
            loader = new Loader();
            loader.load(new URLRequest(s));
            loader.addEventListener(Event.COMPLETE, imageLoaded);
            loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
            loader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
           // cacheElement.addItem(s, loader);
        this.addChild(loader);
        //}
    }

    private function httpStatusHandler(e:Event):void {
        trace("httpStatusHandler");
    }

    private function ioErrorHandler(e:Event):void {
        trace("ioErrorHandler");
    }

    private function imageLoaded(e:Event):void {
      textureMap = e.target.data.content.bitmapData;
      initImage(Settings.loadImageElementMap);
    }

    private function initImage(ev:String):void {
        var e:Event = new Event(ev, false, false);
        dispatchEvent(e);
    }

}
}
