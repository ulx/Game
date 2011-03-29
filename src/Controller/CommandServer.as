/**
 * Created by ${PRODUCT_NAME}.
 * User: Alexnder
 * Date: 21.03.11
 * Time: 16:48
 * To change this template use File | Settings | File Templates.
 */
package Controller {
import Setting.Settings;
import flash.display.Loader;
import flash.net.URLRequest
public class CommandServer {
    private    var loader:Loader;
    public function CommandServer() {
            loader = new Loader();
    }
     public function seed(x:int = 0, y:int = 0, id:int = 0):void{
        loader.load(new URLRequest(Settings.commandSeed + "/" + x + "/" + y + "/" + id));
     }
     public function dig(x:int = 0, y:int = 0):void{
        loader.load(new URLRequest(Settings.commandDig + "/" + x + "/" + y));
     }
}
}
