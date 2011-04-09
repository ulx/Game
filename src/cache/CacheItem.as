package cache {

import flash.display.Loader;
import flash.utils.ByteArray;
public class CacheItem {
    private var pID:String;
    private var pImage:Loader;

    public function CacheItem(id:String = "default", loader:Loader = null) {
        pID = id;
        pImage = loader;

    }
    public function clone(source:Loader):* {
	var copier:ByteArray = new ByteArray();
	copier.writeObject(source);
	copier.position = 0;
	return(copier.readObject());
}


    public function get id():String{
        return this.pID;
    }
    public function set id(id:String):void{
         this.pID = id;
    }
     public function get imageItem():Loader{
        return this.pImage;
    }
    public function set imageItem(l:Loader):void{
         this.pImage = l;
    }
}
}