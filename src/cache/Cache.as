/**
 * Created by ${PRODUCT_NAME}.
 * User: Alexnder
 * Date: 24.03.11
 * Time: 12:31
 * To change this template use File | Settings | File Templates.
 */
package cache{
import Setting.Settings
import flash.display.Sprite;
import flash.net.URLRequest;
import flash.net.URLLoader
import flash.events.Event;
import flash.events.*;

public class Cache extends EventDispatcher{
    private var listImage:Array;
    private var loader:URLLoader;
    private var element: Array;
    private var id:String;
    public function Cache() {
        listImage = new Array();
     //   loadImage();

    }

    public function isImage(id:String):Boolean{
        for (var i:int; i < listImage.length; i++){
            if(listImage[i].id == id){
                return true;
            }
        }
        return false;
    }

   // public
    public function loadImage(s:String):void{
        id = s;
        loader = new URLLoader();
        loader.load(new URLRequest(s));
        loader.addEventListener(Event.COMPLETE, imageComplite);
        loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
        loader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);

    }
     private function httpStatusHandler(e:Event):void {
        trace("httpStatusHandler");
    }
       private function ioErrorHandler(e:Event):void {
           trace("ioErrorHandler");
    }
    private function imageComplite(e:Event):void {
        var sprite = new Sprite();
        sprite.addChild(e.target.data);
        element = new Array();
        element["id"] = id;
        element["sprite"] = sprite;
        listImage.push(element);
    }
    public function findImage(s:String):Sprite{
         for (var i:int; i < listImage.length; i++){
            if(listImage[i].id == id){
                return listImage[i].sprite;
            }
        }
        return null;
    }
}
}
