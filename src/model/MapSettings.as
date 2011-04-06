/**
 * Created by IntelliJ IDEA.
 * User: Alexnder
 * Date: 05.04.11
 * Time: 21:44
 * To change this template use File | Settings | File Templates.
 */
package model {
public class MapSettings {
    private var pNAME:String;
    private var pSizeX:int;
    private var pSizeY:int;
    private var pZeroX:int;
    private var pZeroY: int;

    public function MapSettings(name:String="defaut", size_x:int=-1, size_y:int=-1, zero_x:int=-1, zero_y:int=-1) {
    pNAME = name;
    pSizeX = size_x;
    pSizeY = size_y;
    pZeroX = zero_x;
    pZeroY = zero_y;
    }

     public function get name():String {
        return pNAME;
    }

    public function set name(name:String):void {
        this.pNAME = name;
    }
       public function get sizeX():int {
        return pSizeX;
    }
    public function set sizeX(lenght:int):void {
        this.pSizeX = lenght;
    }
    public function get sizeY():int {
        return pSizeY;
    }
    public function set sizeY(lenght:int):void {
        this.pSizeY = lenght;
    }
    public function get zeroX():int {
        return pZeroX;
    }
    public function set zeroX(x:int):void {
        this.pZeroX = x;
    }
    public function get zeroY():int {
        return pZeroY;
    }
    public function set zeroY(y:int):void {
        this.pZeroY = y;
    }
}
}
