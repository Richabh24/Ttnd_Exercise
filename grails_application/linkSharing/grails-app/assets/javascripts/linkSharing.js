function editTopic(headertopic1, headertopic2) {
    $('#' + headertopic2).css('display', 'block')
    $('#' + headertopic1).css('display', 'none')
}


function showError(msg) {
    BootstrapDialog.show({
        title:'Error',
        type: BootstrapDialog.TYPE_DANGER,
        message:msg
    });

}

function showSuccess(msg) {
    BootstrapDialog.show({
        title:'Success',
        message:msg
    });

}