package cross;

import tink.url.Host;
import tink.Url;
using Std;
class Config{
  static var num=haxe.Resource.getString("res").parseInt();

static var configSwitch=['192.168.1.34','localhost'];
public static var localPort=8080;
public static var localIP='192.168.1.34';//atchoum


   // public static var localIP='10.3.141.251'; //murmurspot
//public static var localIP='localhost'; //localhost
 // public static var localIP=configSwitch[num];
  
  #if server
    //public static  var PORT=#if sys untyped (process.env.ALWAYSDATA_HTTPD_PORT) #else 8100  #end;
    public static  var PORT:Int=untyped (process.env.ALWAYSDATA_HTTPD_PORT) ;
 //public static  var IOPORT=5700;
   // public static  var IP= #if sys untyped (process.env.ALWAYSDATA_HTTPD_IP) #else  '127.1.88.138' #end;
    public static  var IP= untyped (process.env.ALWAYSDATA_HTTPD_IP) ;
 
  public static var root='./';
  public static var localroot='./www';//

  public static var host:tink.url.Host; //localhost:3200
  public static var url:tink.Url; //http://localhost:3200
  public static var domain:Url; //http://oz.postite.com

  public static var dumpPath="/memoz"; //+plus root
  #else
  
  public static  var PORT:Int ;
  public static  var IP:String ;
  
   public static var root='./';
   public static var localroot='./www';
 
   public static var host:tink.url.Host; //localhost:3200
   public static var url:tink.Url; //http://localhost:3200
   public static var domain:Url; //oz.postite.com

  #end


  public static function toString(){
        return '
            url=$url,
            host=$host,
            domain=$domain,
            root=$root
          ';
  }

  }