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



import model.ItemElementMap;

import flash.events.MouseEvent;


import component.CMenu;
import component.*;

import model.MenuModel;

import flash.display.Sprite;

import map.CMap;
import map.ElementMap;
import map.BackgroundMap;
import model.MapModel



public class main extends Sprite {
    var modelMenu:MenuModel;
    var menu:CMenu;
    var cmap:CMap;
    var plantButton:PlantButton;
    var makeButton:MakeButton;
    var collectedButton:CollectedButton
    var listPlantElementMap:Array;
    var commandServer:CommandServer;
    var mapModel:MapModel;
    public function main() {
        initGame();

        this.x =  stage.x
        this.y =  stage.y
        this.width = stage.width/3;
        this.height =  stage.height/3;

    }

    private function initGame():void {


         cmap = new CMap();
         menu = new CMenu();
         modelMenu = new MenuModel();
         makeButton = new MakeButton();
         collectedButton = new CollectedButton();
         plantButton = new PlantButton;
         listPlantElementMap = new Array();
      //   mapModel = new MapModel(Settings.commandTurn );
       //  var  elementMapBackground:BackgroundMap = new BackgroundMap();
         var background:ElementMapLoader = new ElementMapLoader(Settings.imageElementMap);

         //Listener
         menu.addEventListener(Settings.eventClickItemMenu, menuVisibleFalse);
         menu.addEventListener(Settings.elementMapClick, menuVisibleTrue) ;
        // mapModel.addEventListener(Settings.loadItemMap, initElementMap);
         this.addEventListener(MouseEvent.CLICK, menuVisibleTrue);


         modelMenu.addEventListener(Settings.loadItemMenu, initMenu);
         plantButton.addEventListener(Settings.plantButton, buttonPlantButtonPress)
         makeButton.addEventListener(Settings.makeButton, buttonMakePress);
         collectedButton.addEventListener(Settings.collectedButton, buttonCollectedButtonPress);
        //init element
         cmap.initMap();

       //  elementMapBackground.initImage(background);

        //Locate
        plantButton.locate(100, 50);
        makeButton.locate(100, 70);
        collectedButton.locate(100,90);

        //add
        this.addChild(background);
        this.addChild(cmap);
        this.addChild(plantButton);
        this.addChild(makeButton);
        this.addChild(collectedButton);
        this.addChild(menu);


    }

    private function buttonPlantButtonPress(ev:String):void  {
        var i:int = 0;
        trace(listPlantElementMap.length)
        while(i < listPlantElementMap.length)  {
            trace("line = " + listPlantElementMap[i].lineIndex + " column = " + listPlantElementMap[i].columnIndex);
            commandServer = new  CommandServer();
            commandServer.seed(listPlantElementMap[i].lineIndex, listPlantElementMap[i].columnIndex, listPlantElementMap[i].plant);
            i++;
        }

    }

    private function buttonCollectedButtonPress(ev:String):void {
        var list = cmap.listElement;
        var i:int = 0;
        while (i < list.length){
            trace("list = " + list[i].stage/5);
            if(list[i].stage/5 == 0)  {
              commandServer = new  CommandServer();
              commandServer.dig(list[i].lineIndex, list[i].columnIndex);
                list[i].status = false;
            }
            i++
        }
    }

    private function buttonMakePress(ev:String):void {
            //  mapModel.load(Settings.commandTurn    );
           mapModel = new MapModel(Settings.commandTurn);
          mapModel.addEventListener(Settings.loadItemMap, initElementMap);
    }

    private function menuVisibleTrue(ev:MouseEvent):void {
        var i:int = 0;
        var item : ElementMap;
      //  if ((cmap.findActivElement(ev.stageX + Settings.x0Map, ev.stageY + Settings.y0Map)) != null)  {

       ///  item =  cmap.findActivElement(ev.stageX + Settings.x0Map, ev.stageY + Settings.y0Map);
       //     if(!item.state) {
                  menu.draw(ev.localX + 100,  ev.localY + 100);
       //     }
       // }
    }

    private function menuVisibleFalse(ev:String):void {
        var i:int = 0;
        var mI:MenuItem;
        menu.visibleFalse();
        while (i < cmap.listElement.length){
            trace(cmap.listElement[i].status)
            if((cmap.listElement[i].status)&&(cmap.listElement[i].plant == 0))   {
                mI = menu.findActivItemMenu();

                cmap.listElement[i].plant =  mI.id;
                trace( cmap.listElement[i].plant);
                listPlantElementMap.push(cmap.listElement[i]);
                break;

            }
            i++;
        }
    }

    private function initElementMap(ev:String):void {

        var elementMap:ElementMap;
        var loader:ElementMapLoader;
        var model =  mapModel.listElement;
        var controller =  cmap.listElement;
        var i:int =0;
        var j:int =0;
        var id:int =0;
        for each (var modelElementMap:ItemElementMap in model ){
           for each(var iE:ElementMap in cmap.listElement){
               trace( "id = " + iE.id + " plant = " + iE.plant + " x = " + iE.x + " y = " + iE.y) ;
           }
           id = menu.findIdItemMenu(modelElementMap.name)
          elementMap = cmap.findActivElement(modelElementMap.x,modelElementMap.y);
            if  (cmap.findActivElement(modelElementMap.x,modelElementMap.y) != null){

             elementMap.setElementParametrs(modelElementMap);
                    trace(elementMap.plant);
             loader = new  ElementMapLoader(Settings.imageElementMap + "/" + id + "/" + modelElementMap.state);
             elementMap.initImage(loader);

            }
           }

    }

    private function initMenu(ev:String):void {
        menu.createMenu(modelMenu.propertisMenu);
    }
}

}

