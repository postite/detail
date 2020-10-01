package server.app;
import tink.http.containers.*;
import tink.http.Response;
import tink.web.routing.*;

class Server{

static function main() {
    var container = new NodeContainer(8080);
    var router= new Router<Root>(new Root());
    container.run(req->
         router.route(Context.ofRequest(req))
            .recover(OutgoingResponse.reportError)
            );
}

}




class Root {
    public function new() {
            trace("hello");
    }
    @:get("/")
    public function index(){
        trace( "ipo");
        return "popo";
    }
    @:get("/tarif")
    public function tarif(){
        trace( "tarif");
        return "23€";
    }
}