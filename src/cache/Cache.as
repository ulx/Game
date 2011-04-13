/**
 * Created by ${PRODUCT_NAME}.
 * User: Alexnder
 * Date: 24.03.11
 * Time: 12:31
 * To change this template use File | Settings | File Templates.
 */
package cache {
import flash.display.Loader;
import flash.display.Sprite;
import flash.display.Bitmap;

public class Cache extends Sprite {
    private static var _instance:Cache;
    private static var __allowInstantiation:Boolean = false;
    private var listImage:Array;


    public static function get instance():Cache {
        if (_instance) {
        } else {
// Разрешаем создание экземпляра класса.
            __allowInstantiation = true;
// Создаем экземпляр.
            _instance = new Cache();

// Запрещаем создание экземпляров.
            __allowInstantiation = false;
        }
        return _instance;
    }

    public function Cache() {
        if (!__allowInstantiation) {
            throw new Error("Вы не можете создавать экземпляры класса при помощи конструктора. Для доступа к экземпляру используйте Cache.instance.");
        }
          listImage = new Array();
    }

    public function isImage(id:String):Boolean {
        for each(var item:CacheItem in listImage) {
            if (item.id == id) {
                return true;
            }
        }
        return false;
    }

    public function addItem(s:String, image:Loader = null):void {
        listImage.push(new CacheItem(s, image));
    }

    public function findImage(id:String):Loader {
        for each(var item:CacheItem in listImage) {
            if (item.id == id) {
             //  return item.clone(item.imageItem);
                return item.imageItem;
            }
        }
        return null;
    }
   public function cloneBitmap(l:Loader):Bitmap {
        return new Bitmap(Bitmap(l.content).bitmapData);
    }


}
}


