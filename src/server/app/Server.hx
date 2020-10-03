package server.app;
import command.Command1;

import tink.http.containers.*;
import tink.http.Response;
import tink.web.routing.*;




import tink.http.middleware.Static;

class Server{

static function main() {
    var container = new NodeContainer(8080);
    var router= new Router<Root>(new Root());
    var handler:tink.http.Handler=req->
         router.route(Context.ofRequest(req))
            .recover(OutgoingResponse.reportError);
    
    	handler = handler.applyMiddleware(new Static('./assets', '/'));

    container.run(handler);
}

}







    
