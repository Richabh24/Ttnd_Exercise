function editf(d1, d2) {
    $('#' + d2).css('display', 'block')
    $('#' + d1).css('display', 'none')
}


function showError(msg) {
    BootstrapDialog.show({
        title:'Error',
        type: BootstrapDialog.TYPE_DANGER,
        message:msg
    });

}

/*function ChangeVisibility( id){

var s=  $("#seriousnessiD").val()

    alert("topic--->"+id +"  seriousnes ->  "+s);

}*/
/*function ChangeVisibility( seriousness,id,visible){



    alert("seriousness--->"+seriousness+"topic--->"+id +"visible="+visible);





}*/
function showSuccess(msg) {
    BootstrapDialog.show({
        title:'Success',
        message:msg
    });

}