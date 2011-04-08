/**
 * Created by IntelliJ IDEA.
 * User: Alexnder
 * Date: 07.04.11
 * Time: 21:13
 * To change this template use File | Settings | File Templates.
 */
package cache {
import flash.display.Sprite;
public class CacheItem {
    private var pID:String;
    private var pImage:Sprite;
    public function CacheItem(id:String = "default", sprite:Sprite = null) {
        pID = id;
        pImage = sprite;
    }
    public function get id():String{
        return this.pID;
    }
    public function set id(id:String):void{
         this.pID = id;
    }
     public function get imageItem():Sprite{
        return this.pImage;
    }
    public function set imageItem(sp:Sprite):void{
         this.pImage = sp;
    }
    public function clone():CacheItem {
        return new CacheItem(this.id, this.imageItem);
    }
}

}
