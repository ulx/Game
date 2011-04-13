/**
 * Created by ${PRODUCT_NAME}.
 * User: Alexnder
 * Date: 08.03.11
 * Time: 14:08
 * To change this template use File | Settings | File Templates.
 */
package Setting{
public class Settings {
    public static var menuItemActiv:int = 100;
    public static var menuItemNoActiv:int = 200;
    public static var menuItemHeight:int = 50;
    public static var menuItemWidth:int = 100;

    public static var host:String = "localhost";
    public static var port:String = "8000";
    public static var xmlMenu:String = "http://"+ host +":"+port +"/list";

    public static var eventClickItemMenu:String = "clickItemMenu";
    public static var loadItemMenu:String = "LoadMenu";



    //Commands
    public static var commandTurn:String  =  "http://"+ host +":"+port +"/turn";
    public static var commandSeed:String  =  "http://"+ host +":"+port +"/seed";
    public static var commandDig:String   =  "http://"+ host +":"+port +"/dig";

    //Map
    public static var imageElementMap:String = "http://"+ host +":"+port +"/image";
    public static var loadImageElementMap:String = "loadImageElementMap";
    public static var loadItemMap:String = "loadItemMap";
    public static var widthMap:int = 1200;
    public static var heightMap:int = 300;
    public static var dxMap:int = 104;
    public static var dyMap:int = 54;
    public static var x0Map:int = 120;
    public static var y0Map:int = 430;
    public static var elementMapClick:String = "elementMapClick";

    //ButtonCommand
    public static var makeButton:String = "makeButton";
    public static var plantButton:String = "plantButton";
    public static var collectedButton:String = "collectedButton";

    public function Settings() {
    }
}
}
