$(function(){
    deviceInfo(); // newer deviceInfo

    setInterval(update, 5000); // init update update 2 from WLAN/MODEM info requestinf and possible modes
    update();
    setInterval(update2, 5000);
    update2();
    init();
});
//

// deviceStatus old engine, renewed
function init() {
  const connMode = $.session.get("conn_mode");
  if (connMode === "1") {
    $("#manual").prop("selected", true);
    $("#auto").prop("selected", false);
  } else { // Auto
    $("#auto").prop("selected", true);
    $("#manual").prop("selected", false);
  }
}

function update2() {
  const param = { funcNo: 1002 }; // 1002 WLAN confs, function needs to be linked with newer function wlanSetup() {
  request(param, (data) => {
    const flag = data.flag;
    const errorInfo = data.error_info;

    if (flag === "1") {
      const result = data.results[0];
      $("#mifi_ip").text(result.IP);
      $("#g3_mask").text(result.mask);
      $("#g3_dns").text(result.dns1);
      $("#g3_dns2").text(result.dns2);
      $("#ssid").text(result.ssid);
      $("#wlan_ip").text(result.wlan_ip);
      $("#password").text(result.pwd);
    } else {
      Alert(errorInfo);
    }
  });
}

function update() {     // TxRx data viewer
  const param = { funcNo: 1003 };
  request(param, (data) => {
    const flag = data.flag;
    const errorInfo = data.error_info;

    if (flag === "1") {
      const result = data.results[0];
      $("#mifi_tx_data").text(parseInt(result.up_bytes) + " KB");
      $("#mifi_rx_data").text(parseInt(result.down_bytes) + " KB");
      $("#client_num").text(result.client_num + " / " + result.maxSta);
    } else {
      Alert("Fail");
      Alert(errorInfo);
    }
  });
}

$("#connect").on("change", () => {
  if ($("#manual").prop("selected")) {
    $("#manual").prop("selected", true);
    $("#auto").prop("selected", false);
  } else {
    $("#auto").prop("selected", true);
    $("#manual").prop("selected", false);
  }
});

$("#apply").on("click", () => {
  const connMode = $("#auto").prop("selected") ? $("#auto").val() : $("#manual").val();
  const param = { funcNo: 1004, conn_mode: connMode }; // la 1004: 3g/4g, #manual needs to get its values defined (umts/lte)
  request(param, (data) => {
    const flag = data.flag;
    const errorInfo = data.error_info;

    if (flag === "1") {
      $.session.set("conn_mode", connMode);
      Alert("Success");
    } else { // Error
      Alert("Fail");
      Alert(errorInfo);
    }
  });
});


// la deviceInfo() viene de deviceInformation()
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

// call to request at the end of the script in order to prevent duplications

/*
function wlanSetup() {

}

function lteSIM() {

}

function androidThings {

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
