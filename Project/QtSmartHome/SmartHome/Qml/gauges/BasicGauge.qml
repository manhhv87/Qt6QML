import QtQuick 2.15

/**
This file defines a gauge.

property string backgroundImage:    The background image of the gauge.
property string needleImage:        The image of the needle.
property int value:                 The current value of the gauge.
property int minValue:              The minimal value of the gauge.
property int maxValue:              The maximal value of the gauge.
*/

Item {
    id: rootId

    property string backgroundImage: "qrc:/SmartHome/Images/basicgauge/background.svg"
    property string needleImage: "qrc:/SmartHome/Images/basicgauge/needle.svg"

    property int value: 0
    property int minValue: 0
    property int maxValue: 100

    Image {
        id: background
        source: rootId.backgroundImage
        smooth: true
        width: parent.width
        height: parent.height
        sourceSize.width: width
        sourceSize.height: height

        Image {
            id: needle
            source: rootId.needleImage
            width: background.width
            height: background.height
            sourceSize.width: background.width
            sourceSize.height: background.height
            anchors.horizontalCenter: background.horizontalCenter
            anchors.verticalCenter: background.verticalCenter
            smooth: true
            //scale: needleScale
            z: 2
            transform: Rotation {
                origin.x: background.width/2
                origin.y: background.height/2
                angle: rootId.value * (240 / (Math.abs(rootId.maxValue) + Math.abs(rootId.minValue))) - 120
            }
        }
    }
}
