package client.app;
  
class CocoLay extends coconut.ui.View {

    function render(){
        <div onclick=${trace("yeah!")}>pipo</div>;
    }

}


class SubCoo extends View{

    var me='';
    var className:tink.domspec.ClassName=[];
    function render() 
        <div class={className.add(me)}></div>;
    
    
}