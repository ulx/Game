/**
 * Created by ${PRODUCT_NAME}.
 * User: Alexnder
 * Date: 14.03.11
 * Time: 23:12
 * To change this template use File | Settings | File Templates.
 */
package map {
import Setting.Settings;

import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.events.Event;
import flash.display.Loader;
import flash.display.Bitmap;
import model.ItemElementMap;

public class ElementMap extends Sprite {

    private var square:Sprite;
    private var ID:int = 0;
    private var NAME:String = "default";
    private var STATE:int = 0;
    private var PLANT:int = 0;
    private var STATUS:Boolean = false;
    private var numberLine:int = 0;
    private var numberColumn:int = 0;
    private var LEVEL_MAX:int = 0;
    private var defaultX:int = 0;
    private var defaultY:int = 0;

    public function ElementMap() {
        this.addEventListener(MouseEvent.CLICK, mouseClick);
        setDefault();

         draw(1, 0xffaacc, 0.5);
    }

    private function mouseClick(e:MouseEvent):void {
        STATUS = true;

        draw(1, 0xffaacc, 0.5);


        notifyListeners(Settings.elementMapClick);
    }

    public function draw(style:int, color:uint, alphaE:int):void {
        square.graphics.lineStyle(style, color, alphaE);
        square.graphics.beginFill(0x0000FF, alphaE);
        square.graphics.lineTo(55, -28);
        square.graphics.lineTo(110, 0);
        square.graphics.lineTo(55, 28);
        square.graphics.lineTo(0, 0);
        square.graphics.endFill();
    }

    private function notifyListeners(ev:String):void {
        var e:Event = new Event(ev, false, false);
        dispatchEvent(e);
    }

    public function initImage(image:Sprite):void {

        if ((this.state > 0)&&(this.state < this.level_max))square.removeChildAt(0);
        square.addChild(image);


        //добавить подсчет коодинат от высоты.




    }

    public function locate(x:int, y:int):void {
        this.x = x;
        this.y = y;
        defaultX = x;
        defaultY = y;
    }

    private function setDefault():void {
        square = new Sprite();
        this.x = defaultX;
        this.y = defaultY;
        this.addChild(square);
        draw(3, 0x00ff00, 0);
    }

    public function setElementParametrs(itemElementMap:ItemElementMap):void {
        this.ID = itemElementMap.id;
        this.STATE = itemElementMap.state;
        this.NAME = itemElementMap.name;
        this.lineIndex = itemElementMap.x;
        this.columnIndex = itemElementMap.y;
    }

    public function resetElementParametrs():void {
        ID = 0;
        NAME = "default";
        STATE = 0;
        PLANT = 0;
        STATUS = false;
        LEVEL_MAX = 0;
        this.removeChild(square);
        setDefault();
    }


    public function get id():int {
        return this.ID;
    }

    public function set id(id:int):void {
        this.ID = id;
    }

    public function get status():Boolean {
        return this.STATUS;
    }

    public function set status(status:Boolean):void {
        this.STATUS = status;
    }

    public function get state():int {
        return this.STATE;
    }

    public function set state(state:int):void {
        this.STATE = state;
    }

    public function get nameElement():String {
        return this.NAME;
    }

    public function get plant():int {
        return this.PLANT;
    }

    public function set plant(id_palant:int):void {
        this.PLANT = id_palant;
    }

    public function get lineIndex():int {
        return this.numberLine;
    }

    public function set lineIndex(index:int):void {
        this.numberLine = index;
    }

    public function get columnIndex():int {
        return this.numberColumn;
    }

    public function set columnIndex(index:int):void {
        this.numberColumn = index;
    }
      public function get level_max():int {
        return this.LEVEL_MAX;
    }

    public function set level_max(level_max:int):void {
        this.LEVEL_MAX = level_max;
    }
}
}
