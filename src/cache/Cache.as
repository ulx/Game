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
    private var element: Array;

    public function Cache() {
        listImage = new Array();
    }

    public function isImage(id:String):Boolean{
        for (var i:int; i < listImage.length; i++){
            if(listImage[i].id == id){
                return true;
            }
        }
        return false;
    }


     private function httpStatusHandler(e:Event):void {
        trace("httpStatusHandler");
    }
       private function ioErrorHandler(e:Event):void {
           trace("ioErrorHandler");
    }
    public function addItem(s:String, image:Sprite):void {
        element = new Array();
        element["id"] = s;
        element["sprite"] = image;
        listImage.push(element);
    }
    public function findImage(s:String):Sprite{
         for (var i:int; i < listImage.length; i++){
            if(listImage[i].id == s){
                return listImage[i].sprite;
            }
        }
        return null;
    }
}
}
