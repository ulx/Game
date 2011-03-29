/**
 * Created by ${PRODUCT_NAME}.
 * User: Alexnder
 * Date: 21.03.11
 * Time: 0:36
 * To change this template use File | Settings | File Templates.
 */
package model {
public class ItemElementMap extends Object {
    private var pNAME:String;
    private var pID:int;
    private var pSTATE:int;
    private var pX:int;
    private var pY: int;
    public function ItemElementMap(name:String="defaut", id:int=-1, state:int=-1, x:int=-1, y:int=-1) {
        pNAME = name;
        pID = id;
        pSTATE = state;
        pX = x;
        pY = y;
    }

    public function get name():String {
        return pNAME;
    }

    public function set name(name:String):void {
        this.pNAME = name;
    }
       public function get id():int {
        return pID;
    }
    public function set id(id:int):void {
        this.pID = id;
    }  public function get state():int {
        return pSTATE;
    }
    public function set state(state:int):void {
        this.pSTATE = state;
    }  public function get x():int {
        return pX;
    }
    public function set x(x:int):void {
        this.pX = x;
    }  public function get y():int {
        return pY;
    }
    public function set y(y:int):void {
        this.pY = y;
    }
}
}
