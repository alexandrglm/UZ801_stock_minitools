// la deviceInfo() viene de deviceInformation()

$(function(){
    deviceInfo();
});

function deviceInfo() {
    var param = { funcNo: 1029 };
    request(param, function(data) {
        var flag = data.flag;
        var error_info = data.error_info;

        if (flag == "1") {
            var result = data.results[0]; // 1029#imei = AT+GSN get serial number (imei)
            $("#imei").val(result.imei);
            $("#FWversion").html(result.fwversion);
            $("#manufacturer").html(result.manufacture);
            $("#dbmSignal").html(result.dbm);
        } else {
            Alert(error_info);
        }
    });
}

$("#apply").bind('click', function(e) {
    var nImei = $("#imei").val();

    var param = {
        "funcNo": 2002, // 2002 = AT+ EGMR=1,7,"nImei"
        "imei": nImei
    };

    request(param, function(data) {
        var flag = data.flag;
        var error_info = data.error_info;

        if (flag == "1") {
            Alert('Success');
            return;
        } else {
            Alert('Fail');
            return;
        }
    });
});

/*
function wlanSetup() {

}

function lteSIM() {

}

function openShell() {

}
*/


/*
function showDeviceStatus() {
}

function selectNetwork() {
}

function configureWifi() {
}

function wifiSecurity() {
}

function deviceInformation() {
}

function deviceOperation() {
}

function configureAPN() {
}

function simInformation() {
}

function rebootDevice() {
}

function restoreDevice() {
}

function enableUsbDebug() {
}

function disableUsbDebug() {
}
*/

function request(param, callback) {
    $.ajax({
        type: "post",
        url: "/cgi-bin/mifi", // ESTA ES LA URL DONDE SE ENVIAN POST PARA SOLICITAR DATA AL DONGLE!
        data: param,
        dataType: "json",
        success: function(data) {
            callback(data);
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            Alert("ERROR: " + textStatus + " - " + errorThrown);
        }
    });
}
