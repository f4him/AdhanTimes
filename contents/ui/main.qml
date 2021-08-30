// main.qml
import QtQuick 2.6
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.15
import org.kde.plasma.plasmoid 2.0



ColumnLayout {
    id: root
    width: 300
    height: 200
    Plasmoid.backgroundHints: "NoBackground" 
    
    Rectangle {
        id:rect1

        width: parent.width
        color: "transparent"
        height: 24
        border.color: "black"
        border.width: 1
        
        radius: 6

        Text{
            id: text1
            leftPadding:5
            anchors.fill : parent
            fontSizeMode: Text.Fit  
            font.pixelSize: 16
            verticalAlignment: Text.AlignVCenter
            
            text: "Fajr:  "
        }
    
    }
    Rectangle {
        id:rect2

        width: parent.width
        color: "transparent"
        height: 24
        border.color: "black"
        border.width: 1
        
        radius: 6

        Text{
            id: text2
            leftPadding:5
            anchors.fill : parent
            fontSizeMode: Text.Fit  
            font.pixelSize: 16
            verticalAlignment: Text.AlignVCenter
            
            text: "Dhuhr:  "
        }
    
    }
    Rectangle {
        id:rect3

        width: parent.width
        color: "transparent"
        height: 24
        border.color: "black"
        border.width: 1
        
        radius: 6

        Text{
            id: text3
            leftPadding:5
            anchors.fill : parent
            fontSizeMode: Text.Fit  
            font.pixelSize: 16
            verticalAlignment: Text.AlignVCenter
            
            text: "Asr:  "
        }
    
    }
    Rectangle {
        id:rect4

        width: parent.width
        color: "transparent"
        height: 24
        border.color: "black"
        border.width: 1
        
        radius: 6

        Text{
            id: text4
            leftPadding:5
            anchors.fill : parent
            fontSizeMode: Text.Fit  
            font.pixelSize: 16
            verticalAlignment: Text.AlignVCenter
            
            text: "Maghrib:  "
        }
    
    }
    Rectangle {
        id:rect5

        width: parent.width
        color: "transparent"
        height: 24
        border.color: "black"
        border.width: 1
        radius: 6

        Text{
            id: text5
            leftPadding:5
            anchors.fill : parent
            fontSizeMode: Text.Fit  
            font.pixelSize: 16
            verticalAlignment: Text.AlignVCenter
            
            text: "Isha:  "
        }
    
    }
    





    TextField {
        id: loc
        color: "Black"
        placeholderText: qsTr("Enter city name here")
        background: Item {
                        opacity: 0
                    }
    }

    Button {
        text: "Set times for this location"
        onClicked: submit()


        function submit(){
            var base_url = "https://api.pray.zone/v2/times/today.json?city="
            var city = loc.text
            var URL = base_url + city
            console.log(city)
            request(URL, function (o) {
                if (o.status === 200)
                {
                    console.log(o.responseText);
                    var data = JSON.parse(o.responseText)
                    text1.text ="Fajr:" + data.results.datetime[0].times.Fajr
                    text2.text ="Dhuhr:" + data.results.datetime[0].times.Dhuhr
                    text3.text ="Asr:" + data.results.datetime[0].times.Asr
                    text4.text ="Maghrib:" + data.results.datetime[0].times.Maghrib
                    text5.text ="Isha:" + data.results.datetime[0].times.Isha
                    console.log(data["results"])
                    
                }
                else
                {
                    console.log("Some error has occurred");
                }
            });






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




}