/**
 * Created by ${PRODUCT_NAME}.
 * User: Alexnder
 * Date: 24.03.11
 * Time: 12:31
 * To change this template use File | Settings | File Templates.
 */
package cache{
import flash.display.Sprite;
import Controller.ElementMapLoader;

public class Cache extends Sprite{
    private var listImage:Array;

    public function Cache() {
        listImage = new Array();
    }
    public function isImage(id:String):Boolean{
      for each(var item:CacheItem in listImage) {
            if(item.id == id){
                  return true;
            }
        }
        return false;
    }

    public function addItem(s:String, image:ElementMapLoader = null):void {
           listImage.push(new CacheItem(s, image));
    }
    public function findImage(s:String):Sprite{
        for each(var item:CacheItem in listImage) {
            if(item.id == s){
                return  item.clone().imageItem;///item.imageItem;
            }
        }
        return null;
    }
}
}
