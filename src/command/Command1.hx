package command;
import cross.ICrossRoot;
import tink.web.proxy.Remote;
using tink.CoreApi;
import poscope.wire.ICommand;
using Debug;
using tink.io.Source;
class Command1 implements ICommand<Noise>{
    var remote:Remote<ICrossRoot>;
    public function new(r:Remote<ICrossRoot>){
        trace(r);
        this.remote= r;
    }
    public function execute<T>(?data:T):Promise<Noise>{
        trace( "hello command");
        return remote.test("oui")
            .next(s->{
                s.Log("exec");
                Noise;
            });
            
      
    }
}