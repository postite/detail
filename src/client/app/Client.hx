package client.app;

import cross.ICrossRoot;
#if client
using tink.CoreApi;
//import app.IRoot;
import tink.web.proxy.Remote;
import poscope.wire.ActionCommand;
import tink.http.clients.JsClient;
using Debug;
import tink.url.Host;
import command.*;
import cross.Config;

class Client<T> {
	var remote:Remote<ICrossRoot>;
	function new(){

			setupConfig();

			//var visiblehost=js.Browser.window.location.href;//oz.postite.com/kjdhsjdhj
		 	remote = new Remote<ICrossRoot>(
			new JsClient(),
			//new RemoteEndpoint((untyped(js.Browser.window.host):tink.Url).host.Log()));
            new RemoteEndpoint(Config.host)
             );
			execute();
		 
	}


	function setupConfig(){

		// trace( js.Browser.window);
		// var location=js.Browser.window.location;
		// Config.url=location.origin.Log("origin");
		// Config.PORT=Std.parseInt(location.port);
		// Config.IP=location.hostname;
		// Config.host=Config.url.host.Log("host");
		// Config.domain=Config.url;
        // trace(Config, "jsConfig");
        
	}


	static function main(){
        
		CompileTime.importPackage("command");
        new Client();
        
	}

	public function execute(){
		var t:Map<ActionCommand,Any>= haxe.Unserializer.run(untyped actions);
		if (t==null) return;
		for( a in t.keys()){
			var b=Std.string(a);
			Type.createInstance(a,[remote])
				.execute(t.get(a))
				.handle(h->h.Log('client execute :$b'));
		}
	}

}
#end



