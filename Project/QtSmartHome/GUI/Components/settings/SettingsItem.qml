import QtQuick 2.15

/**
* This Item is the base item for the settings pages.
* Mainly it provides for an interface to fade the
* contents of the settings pages in and out.
*/

Rectangle {
    property int currentMinute: 0
    property int currentHour: 0
    property int currentRain: 0
    property int currentWindForce: 0
    property int currentLux: 0
    property int currentTemperature: 0

    property real childOpacity: 0

    smooth: true
    radius: 15
    color: "#DA111316"
    border {
        width: 3
        color:"lightgray"
    }

    onChildOpacityChanged: { contents.opacity = childOpacity }
}
