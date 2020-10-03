package flat;

using tink.CoreApi;
using tink.core.Promise;
import flat.CocoComp;
import flat.CocoTools.CocoRender;
import coconut.html.Renderer;

class CocoFlat {

    public function new() {
        
    }

    @:get("/")
    public function index() {
        trace("index");
        return {hip:"hop"};
    }

    @:get("/coco")
    @:produces("text/html")  
    public function coco():Promise<CocoRender>{
        trace( "flat");
        return Promise.lift((Renderer.render('<CocoComp />'):CocoRender)); 
    }

}