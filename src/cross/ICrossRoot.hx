package cross;
using tink.CoreApi;
interface ICrossRoot{

    @:get('/test/$e')
    public function test(e:String):Promise<String>;


}