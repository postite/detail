package server.app;

import cross.ICrossRoot;
import server.views.*;
using poscope.wire.Actor;
import command.*;
using tink.CoreApi;

class Root implements ICrossRoot{
    public function new() {
            trace("hello");

        Actor.defaultLayout = new poscope.views.Layout();
		Actor.defaultHead = new poscope.views.Head();
		Actor.defaultLayout.footer = poscope.views.Footer.render();

		var nav = [
			{
				url: "/rss",
				title: "abonnes toi poule ",
				description: "le flux nrss du podcast"
			}
		];
        //Actor.defaultLayout.menu = views.Menu.render({host:'http://${Config.IP}:${Config.PORT}'});
        
		Actor.defaultLayout.menu = nav;
        Actor.defaultLayout.header = poscope.views.Header.render();
        
    }
    @:get("/")
    @:produces("text/html")
    public function index():tink.template.Html{
        return  Home.render()
        .withLayout().addAction(Command1)
        .render();
    }

#if coconut
    @:sub("/flat")
    public var flat=new flat.CocoFlat();
#end  

    @:get('/test/$e')
    public function test(e:String):Promise<String>{
        trace( "test");
        return Promise.lift("test");
    }

}