package server.app;
import coconut.html.Html;
import coconut.html.RenderResult;
import tink.http.containers.*;
import tink.http.Response;
import tink.web.routing.*;

import coconut.ui.*;
import coconut.Ui.hxx;
import client.app.CocoLay;
import tink.HtmlString;

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
    public function index():CocoRender{
       return Renderer.render('<CocoLay />');    
    }
    @:get("/tarif")
    public function tarif(){
        trace( "tarif");
        return "23€";
    }
}

abstract CocoRender (String) from HtmlString to String{

    function new(s:String){
        this= s;
    }
    @:from 
    public static function fromRenderResult(r:HtmlString):CocoRender{
        return untyped RenderResult.raw(Renderer.render('<CocoLay />')).plain;
    }

    
}