/**
 * Created by ${PRODUCT_NAME}.
 * User: Alexnder
 * Date: 21.03.11
 * Time: 0:20
 * To change this template use File | Settings | File Templates.
 */
package model {
import Setting.Settings;
import flash.net.URLRequest;
import flash.net.URLLoader
import flash.events.Event;
import flash.events.*;

public class MapModel extends EventDispatcher {
    private var xml:XML;
    private var loader:URLLoader;

    private var listElementMap:Array;
    private var mapSettings:MapSettings;

    public function MapModel(s:String) {
        listElementMap = new Array();
        mapSettings  = new MapSettings();
        loader = new URLLoader();
        loader.addEventListener(Event.COMPLETE, xmlLoaded);
        loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
        loader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
        loader.load(new URLRequest(s));
    }

    public function load(s:String):void {
        loader.load(new URLRequest(s));
    }
      private function httpStatusHandler(e:Event):void {
        trace("httpStatusHandler", e.toString());
    }
       private function ioErrorHandler(e:Event):void {
           trace("ioErrorHandler", e.toString());
    }
    private function xmlLoaded(e:Event):void {
            xml = new XML(e.target.data);
            initMap();
    }
    private function initMap():void {
        var list:XMLList =  xml.elements();
          for each (var field:XML in xml.elements()) {
            mapSettings.name = field.name();
            mapSettings.sizeX = field.attribute("size_x");
            mapSettings.sizeY = field.attribute("size_y");
            mapSettings.zeroX = field.attribute("zero_x");
            mapSettings.zeroY = field.attribute("zero_y");
          }
        var i:int = 1;
        for each (var item:XML in list.elements()) {
            listElementMap.push(new ItemElementMap(item.attribute("name"), item.attribute("id"), item.attribute("state"), item.attribute("x"),item.attribute("y")));
        }
        notifyListeners(Settings.loadItemMap);
    }
      private function notifyListeners(ev:String) {
          var e:Event = new Event(ev, false, false);
          dispatchEvent(e);
    }
    public  function get listElement():Array{
        return listElementMap;
    }
    public function get getMapSettings():MapSettings{
        return mapSettings;
    }
}
}
