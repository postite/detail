package server.app;
import coconut.html.Html;
import coconut.html.RenderResult;
import tink.http.containers.*;
import tink.http.Response;
import tink.web.routing.*;

import coconut.ui.*;
import coconut.Ui.hxx;
import client.app.CocoLay;

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
    @:produces("text/html")
    public function index(){
        trace( "ipo");
        //return "pop";
       // return new OutgoingResponse("")
        return ( "</br>" + untyped RenderResult.raw(Renderer.render('<CocoLay />')).plain );
       // return ( (Renderer.render('<CocoLay />').getHtml());
        //return {msg:"index"};
    }
    @:get("/tarif")
    public function tarif(){
        trace( "tarif");
        return "23€";
    }
}