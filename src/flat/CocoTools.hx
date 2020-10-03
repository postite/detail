package flat;

import tink.HtmlString;

import coconut.html.RenderResult;
import coconut.html.Renderer;
//automates conversion between escaped html to Raw 
/* usage 

    @:get("/coco")
    @:produces("text/html")
    public function coco():CocoRender{
       return Renderer.render('<CocoLay />');    
    }
*/

abstract CocoRender (String) from String to String{

    public function new(s:String){
        trace( "new");
        this= s;
    }

    @:from 
    public static function fromRenderResult(r:HtmlString):CocoRender{
        trace( "ppp");
        
        var o=  RenderResult.raw(r);
        return untyped(o).plain;
}
}