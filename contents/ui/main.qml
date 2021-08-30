// main.qml
import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.15



ColumnLayout {
    spacing: 10
    
    RowLayout {
    id: row1
        
        TextField {
        id: loc
        placeholderText: qsTr("Enter city name here")
        Layout.fillWidth: true
        focus: true
        }
        
        Button {
            text: "Set times for this location"
            onClicked: submit()


            function submit(){
                var base_url = "https://api.pray.zone/v2/times/today.json?timeformat=1&city="
                var city = loc.text
                var URL = base_url + "Chittagong"
                

                request(URL, function (o) {
                    if (o.status === 200)
                    {
                        console.log(o.responseText);
                        var data = JSON.parse(o.responseText)
                        text1.text += data.results.datetime[0].times.Fajr
                        text2.text += data.results.datetime[0].times.Dhuhr
                        text3.text += data.results.datetime[0].times.Asr
                        text4.text += data.results.datetime[0].times.Maghrib
                        text5.text += data.results.datetime[0].times.Isha
                        console.log(data["results"])
                        
                    }
                    else
                    {
                        console.log("Some error has occurred");
                    }
                });






            }
        }

    }

    
    function request(url, callback) {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = (function(myxhr) {
            return function() {
                if(myxhr.readyState === 4) { callback(myxhr); }
            }
        })(xhr);

        xhr.open("GET", url);
        xhr.send();
    }
    
    
    
    
    Rectangle {
        id:rect1
        color: "transparent"
        height: 40
        Layout.fillWidth: true

        Text{
            id: text1
            text: "Fajr:  "
        }
    }
    
    Rectangle {
        id:rect2
        color: "transparent"
        height: 40
        Layout.fillWidth: true

        Text{
            id: text2
            text: "Dhuhr:  "
        }
    }
    
    Rectangle {
        id:rect3
        color: "transparent"
        height: 40
        Layout.fillWidth: true

        Text{
            id: text3
            text: "Asr:  "
        }
    }
    
    Rectangle {
        id:rect4
        color: "transparent"
        height: 40
        Layout.fillWidth: true

        Text{
            id: text4
            text: "Maghrib:  "
        }
    }
    
    Rectangle {
        id:rect5
        color: "transparent"
        height: 40
        Layout.fillWidth: true

        Text{
            id: text5
            text: "Isha:  "
        }
    }




}