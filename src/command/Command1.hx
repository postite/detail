package command;
import cross.ICrossRoot;
import tink.web.proxy.Remote;
using tink.CoreApi;
import poscope.wire.ICommand;
using Debug;
class Command1 implements ICommand<Noise>{
    var remote:Remote<ICrossRoot>;
    public function new(r:Remote<ICrossRoot>){
        trace(r);
        this.remote= r;
    }
    public function execute<T>(?data:T):Promise<Noise>{
        trace( "hello command");
        return remote.test("david")
            .next(s->s.Log());
            
      
    }
}