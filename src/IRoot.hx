using tink.CoreApi;
typedef Html=String;

typedef OrderData={
    mail:String,
    photo:Array<String>,
    ?datedue:Date,
    paid:Bool
}

typedef Eye={
    eyeof:String,
    dims:String,
    date:Date,
    description:String,
    image:String

}
interface IRoot
{
    function home():Html;
    var eyes:EyesRt ;
    var order:OrderRt;
    function process():Html;
    
}



interface EyesRt {
    var series:SeriesRt;
    function index():Html;
    function list():Html;
    function onEye():Html;
    function process():Html;
}
interface SeriesRt{
    function oneEyed():Html;
    function Geneo():Html;
    function rip():Html;
    function yours():Html;
}
interface EyeApi{
    function getList():Promise<Array<Eye>>;
    function getEye():Promise<Eye>;
    function recEye(y:Eye):Promise<Noise>;
}
interface OrderApi{
    function getList():Promise<Array<Eye>>;
    function getEye():Promise<Eye>;
    function recEye(y:Eye):Promise<Noise>;
}

interface OrderRt{

    function index():Html;
    function uploadPhotos():Promise<Noise>;
    function pay():Void;
    @:post
    function order(body:OrderData):Promise<OrderData>;

}