/**
 * Created by ${PRODUCT_NAME}.
 * User: Alexnder
 * Date: 21.03.11
 * Time: 16:48
 * To change this template use File | Settings | File Templates.
 */
package Controller {

import flash.display.Loader;
import flash.net.URLRequest

public class CommandServer {
    private var loader:Loader;

    public function CommandServer(s:String) {
        loader = new Loader();
        loader.load(new URLRequest(s));
    }

}
}
