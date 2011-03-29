/**
 * Created by ${PRODUCT_NAME}.
 * User: Alexnder
 * Date: 07.03.11
 * Time: 18:45
 * To change this template use File | Settings | File Templates.
 */
package component {
import Setting.Settings;

import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.events.Event;
public class CMenu extends Sprite {
    private var listMenuItem:Array;
    private var mX:int;
    private var mID:int;
    public function CMenu() {
        listMenuItem  = new Array();
        this.addEventListener(MouseEvent.CLICK, menuPress) ;
         this.visible = false;
    }


    public function visibleFalse():void {
         this.visible = false;
    }

    public function findActivItemMenu():MenuItem {
         var i:int = 0;
         while (i < listMenuItem.length){
            if(listMenuItem[i].status) {
                    listMenuItem[i].status = false;
                    return listMenuItem[i];
            }
            i++;
        }
        return null;
    }
    private function menuPress(event:MouseEvent):void{
           notifyListeners(Settings.eventClickItemMenu);
    }
     protected function notifyListeners(ev:String) {
          var e:Event = new Event(ev, false, false);
          dispatchEvent(e);
    }


    public function createMenu(elementMenu:Array):void {
        var count:Number = 0;
        for (var j:int; j < elementMenu.length; j++) {
            var i:MenuItem = new MenuItem(elementMenu[j].name, elementMenu[j].id);
            this.addChild(i);
            listMenuItem.push(i);
            count++;
            i.y += Settings.menuItemHeight * count;
        }

    }
    public function findIdItemMenu(name:String):int{
        var i :int = 0;
        while (i < listMenuItem.length){
            if(listMenuItem[i].label == name){
                return  listMenuItem[i].id;
            }
            i++
        }
        return -1;
    }
    public function draw(x:int = 0, y:int = 0): void{
          this.visible = true;
          this.x = x;
          this.y = y;

    }
}
}
