/**
 * Created by ${PRODUCT_NAME}.
 * User: Alexnder
 * Date: 15.03.11
 * Time: 18:46
 * To change this template use File | Settings | File Templates.
 */

package {
import Controller.CommandServer;
import Controller.ElementMapLoader;

import Setting.Settings;

import cache.Cache;


import flash.events.Event;

import model.ItemElementMap;

import flash.events.MouseEvent;


import component.CMenu;
import component.*;

import model.MenuModel;

import flash.display.Sprite;

import map.CMap;
import map.ElementMap;


import model.MapModel


public class main extends Sprite {
   private var modelMenu:MenuModel;
   private var menu:CMenu;
   private var cmap:CMap;
   private var plantButton:PlantButton;
   private var makeButton:MakeButton;
   private var collectedButton:CollectedButton;
   private var listPlantElementMap:Array;
   private var commandServer:CommandServer;
   private var mapModel:MapModel;
   private var cacheImage:Cache;

    public function main() {
        initGame();

        this.x = stage.x ;
        this.y = stage.y ;
        this.width = stage.width / 3;
        this.height = stage.height / 3;

    }

    private function initGame():void {


        cmap = new CMap();
        menu = new CMenu();
        modelMenu = new MenuModel();
        makeButton = new MakeButton();
        collectedButton = new CollectedButton();
        plantButton = new PlantButton;
        listPlantElementMap = new Array();
        cacheImage = Cache.instance;
        var background:ElementMapLoader = new ElementMapLoader(Settings.imageElementMap);
        //Listener
        menu.addEventListener(Settings.eventClickItemMenu, menuVisibleFalse);
        menu.addEventListener(Settings.elementMapClick, menuVisibleTrue);
        this.addEventListener(MouseEvent.CLICK, menuVisibleTrue);


        modelMenu.addEventListener(Settings.loadItemMenu, initMenu);
        plantButton.addEventListener(Settings.plantButton, buttonPlantButtonPress);
        makeButton.addEventListener(Settings.makeButton, buttonMakePress);
        collectedButton.addEventListener(Settings.collectedButton, buttonCollectedButtonPress);


        //  elementMapBackground.initImage(background);

        //Locate
        plantButton.locate(100, 50);
        makeButton.locate(100, 100);
        collectedButton.locate(100, 150);

        //add
        this.addChild(cacheImage.findImage(Settings.imageElementMap));
        this.addChild(cmap);
        this.addChild(plantButton);
        this.addChild(makeButton);
        this.addChild(collectedButton);
        this.addChild(menu);


    }

    private function buttonPlantButtonPress(ev:Event):void {
        var i:int = 0;
        while (i < listPlantElementMap.length) {
            commandServer = new CommandServer();
            commandServer.seed(listPlantElementMap[i].lineIndex, listPlantElementMap[i].columnIndex, listPlantElementMap[i].plant);
            i++;
        }
    }

    private function buttonCollectedButtonPress(ev:Event):void {

        for each(var item:ElementMap in cmap.listElement) {
            if ((item.state == 5) || (item.state == 10) || (item.state == 15)) {
                commandServer = new CommandServer();
                commandServer.dig(item.lineIndex, item.columnIndex);
                item.status = false;
                item.draw(3, 0x00ff00, 1);
                item.resetElementParametrs();
            }
        }

    }

    private function buttonMakePress(ev:Event):void {
        mapModel = new MapModel(Settings.commandTurn);
        mapModel.addEventListener(Settings.loadItemMap, initElementMap);

    }

    private function menuVisibleTrue(ev:MouseEvent):void {
        menu.draw(350, 50);

    }

    private function menuVisibleFalse(event:Event):void {
        var i:int = 0;
        var mI:MenuItem;
        menu.visibleFalse();
        while (i < cmap.listElement.length) {
            if ((cmap.listElement[i].status) && (cmap.listElement[i].plant == 0)) {
                mI = menu.findActivItemMenu();
                cmap.listElement[i].plant = mI.id;
                listPlantElementMap.push(cmap.listElement[i]);
                break;
            }
            i++;
        }
    }

    private function initElementMap(ev:Event):void {
        var elementMap:ElementMap;
        var loader:ElementMapLoader;
        var model:Array = mapModel.listElement;
        var str:String;
       
        var id:int = 0;
        cmap.initMap(mapModel.getMapSettings);
        for each (var modelElementMap:ItemElementMap in model) {
            id = menu.findIdItemMenu(modelElementMap.name);
            elementMap = cmap.findActivElement(modelElementMap.x, modelElementMap.y);
            if (cmap.findActivElement(modelElementMap.x, modelElementMap.y) != null) {
                elementMap.setElementParametrs(modelElementMap);
                str = Settings.imageElementMap + "/" + id + "/" + modelElementMap.state;
                loader = new ElementMapLoader(str);
                elementMap.initImage(cacheImage.findImage(str));

            }
        }

    }

    private function initMenu(ev:Event):void {
        menu.createMenu(modelMenu.propertisMenu);
    }
   
}

}
