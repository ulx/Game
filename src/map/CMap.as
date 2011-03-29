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


public class CMap extends Sprite{

       private var listElementMap:Array;

    public function CMap() {
             listElementMap = new Array();
    }
     public function initMap():void{
         var x0 = Settings.x0Map;
         var y0 = Settings.y0Map;
         var y1 = Settings.y0Map;
         var deltaX: int = 0;
         var deltaY: int = 0;
         var count:int = 0;
         var widthLine: int =  Settings.widthMap


       while((Settings.widthMap - (Settings.dxMap *count)) > 0){
           initLine(x0, y0, widthLine);

          // widthLine = Settings.widthMap - (Settings.dxMap *count) - Settings.dxMap;
           x0 = x0 +  Settings.dxMap/2;
           y0 = y0 + Settings.dyMap/2;
           initLine(x0, y0, count);
           count++;
       }
   //   initIdElementMap();
    }

    private function initIdElementMap():void {
        var i:int = 0;
        while (i < listElementMap.length){
              listElementMap[i].id = i;
            i++;
        }
    }
     private function  initLine(x0:int, y0:int, count:int):void{
         var lenght:int = 0;
         var lenght_y:int = 0;

         var countColumn:int = 0;
         while(lenght < Settings.widthMap/2){
          var item:ElementMap = new ElementMap();
           listElementMap.push(item);
           this.addChild(item);
           item.locate(x0 + lenght, y0 - lenght_y);
           item.lineIndex = count;
           item.columnIndex = countColumn;
           countColumn++;
           lenght += Settings.dxMap/2;
           lenght_y += Settings.dyMap/2
         }
     }
    public function findActivElement(x:int, y:int):ElementMap{
        var i:int = 0;
        while(i < listElementMap.length){
            if((listElementMap[i].lineIndex == x )&&(listElementMap[i].columnIndex == y))   {
                return listElementMap[i];
            }
            i++;
        }
        return  null;
    }
    public function get listElement():Array{
        return  listElementMap
    }
}
}
