package cross;
using tink.CoreApi;
interface ICrossRoot{

    @:get('/test/$oui')
    public function test(oui:String):Int;


    
}