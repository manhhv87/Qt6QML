import QtQuick 2.15

/**
* This TemperatureScale is a custom item for the temperature scale.
* The temperature scale draws the verticals lines for the temperature
*/
Column {
    id: scaleMain

    property bool enableText: true
    property int lineCount: 10
    property variant scaleModel: ["-10°", "0°", "10°", "20°", "30°", "40°"]

    height: 200
    spacing: 0

    Row {
        anchors.right: parent.right

        Text {
            y: -font.pixelSize/2
            height: 1
            text: scaleModel[scaleModel.length-1]
            color: "white"
            visible: enableText
        }

        Rectangle {
            width: 20
            height: 1
            color: "white"
        }
    }

    Repeater {
        anchors.right: parent.right
        width: parent.width
        id: scaleRep
        model: scaleModel.length - 1

        Column {
            anchors.right: parent.right
            id: scaleColumn
            spacing: scaleMain.height / (lineCount * (scaleModel.length - 1)) - 1

            Rectangle {
                width: 20
                height: 1
                color: "transparent"
            }

            Repeater {
                model: 9
                Rectangle {
                    anchors.right: parent.right
                    width: 10
                    height: 1
                    color: "white"
                }
            }

            Row {

                Text {
                    y: -font.pixelSize / 2
                    height: 1
                    text: scaleModel[scaleModel.length - 2 - index]
                    color: "white"
                    visible: enableText
                }

                Rectangle {
                    width: 20
                    height: 1
                    color: "white"
                }
            }
        }
    }
}

