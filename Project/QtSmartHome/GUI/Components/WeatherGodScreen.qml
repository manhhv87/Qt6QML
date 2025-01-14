import QtQuick 2.15

/**
Here is the Rectangle displaying the "Weather God" screen. It consists of an QML Image
element (the background image) and the custom "WeatherGod" (see components/weatherGod.qml)
Element
*/
Rectangle {

    property real newWeatherCondition: godInstance.newWeatherCondition

    Image {
        id: heaven
        source: "qrc:/Images/screenelements/background_weathergod.png"
        anchors.fill: parent
    }

    WeatherGod {
        id: godInstance
        y: parent.height/2 - height/3
        width: parent.width
        height: parent.height
    }

    Image {
        id:basyskomGodLogo
        anchors{ top: parent.top; topMargin:25; right: parent.right; rightMargin: 25}
        smooth: true
        width: 200
        height: 100
        source: "qrc:/Images/logos/basyskom-logo.png"
        sourceSize.width: width
        sourceSize.height: height
    }
}
