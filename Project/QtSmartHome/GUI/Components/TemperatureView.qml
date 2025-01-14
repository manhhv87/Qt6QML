import QtQuick 2.15

/**
* This Item shows information about the temperature mainly as texts.
*/
Item {
    id: temperatureView

    property real current: 23.1
    property real minimum: 18.3
    property real maximum: 27.8
    property color textColor: "red"

    function trailingZero(n) {
        return String(n).replace(/^(-?\d+)$/, "$1.0");
    }

    /**
    * This SmartHomeText item shows the current temperature
    */
    Column {

        anchors.horizontalCenter: parent.horizontalCenter
        spacing: parent.height > 200 ? 10 : 5

        Item {
            id: dummy1
            width: parent.width
            height: 5
        }

        Row {

            anchors.horizontalCenter: parent.horizontalCenter

            SHText {
                text: trailingZero(Math.floor(current * 10) / 10)
                font.pointSize: 70
                color: temperatureView.textColor
            }

            /**
            * This SmartHomeText item shows Celsius sign
            */
            SHText {
                id: cText
                text: "°C"
                font.pointSize: 40
                color: temperatureView.textColor
            }
        }

        Item {
            id: dummy2
            width: parent.width
            height: parent.height > 200 ? 10 : 0
        }

        /**
        * This SmartHomeText item shows max temperature for this day
        */
        SHText {
            id: maxTemp
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Max: " + trailingZero(Math.floor(maximum * 10) / 10)
            font.pointSize: 15
            color: temperatureView.textColor
        }
        /**
        * This SmartHomeText item shows min temperature for this day
        */
        SHText {
            id: minTemp
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Min: " + trailingZero(Math.floor(minimum * 10) / 10)
            font.pointSize: 15
            color: temperatureView.textColor
        }
    }
}
