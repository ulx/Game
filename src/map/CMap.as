/**
 * Created by ${PRODUCT_NAME}.
 * User: Alexnder
 * Date: 14.03.11
 * Time: 17:01
 * To change this template use File | Settings | File Templates.
 */
package map {
import Setting.Settings;

import flash.display.Sprite;

import model.MapSettings;


public class CMap extends Sprite {

    private var listElementMap:Array;
    private var stateInit:Boolean;

    public function CMap() {
        listElementMap = new Array();
        stateInit = false;
    }

    public function initMap(mapSettings:MapSettings):Boolean {
        if (!stateInit) {
            stateInit = true;
        } else {
            return stateInit;
        }

        var x0 = Settings.x0Map + Settings.widthMap / 2 - Settings.dxMap / 2;
        var y0 = Settings.y0Map - Settings.heightMap + Settings.dyMap / 2;
        var lenght:int = x0;
        var lenght_y:int = y0;
        var i:int = 0;
        var j:int = 0;


        while (i < mapSettings.sizeX) {
            j = 0;
            while (j < mapSettings.sizeY) {
                var item:ElementMap = new ElementMap();
                listElementMap.push(item);
                this.addChild(item);
                item.locate(lenght, lenght_y);
                item.lineIndex = i;
                item.columnIndex = j;
                lenght -= Settings.dxMap / 2;
                lenght_y += Settings.dyMap / 2
                j++;
            }
            x0 += Settings.dxMap / 2;
            y0 += Settings.dyMap / 2;
            lenght = x0;
            lenght_y = y0;
            i++;
        }
        return  true;
    }

    private function initIdElementMap():void {
        var i:int = 0;
        while (i < listElementMap.length) {
            listElementMap[i].id = i;
            i++;
        }
    }

    public function findActivElement(x:int, y:int):ElementMap {
        var i:int = 0;
        while (i < listElementMap.length) {
            if ((listElementMap[i].lineIndex == x ) && (listElementMap[i].columnIndex == y)) {
                return listElementMap[i];
            }
            i++;
        }
        return  null;
    }

    public function get listElement():Array {
        return  listElementMap
    }

    public function get statusInit():Boolean {
        return  this.stateInit;
    }

    public function set statusInit(status:Boolean):void {
        this.stateInit = status;
    }
}
}
