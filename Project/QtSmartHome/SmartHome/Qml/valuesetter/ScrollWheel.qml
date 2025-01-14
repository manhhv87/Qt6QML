import QtQuick 2.15

/**
This Item shows a scrollwheel. It can be dragged and flicked to adjust a value.

property int value          The value that is currently set.
property int minimum        The minimum value for the scrollwheel.
property int maximum        The maximum value for the scrollwheel.
property int dragDistance   The distance the wheel has to be dragged to change the current value.
property int currentIndex   A property used internally to define which image should be used.
property alias wheelImage1  The first image for the scrollwheel.
property alias wheelImage2  The second image for the scrollwheel.
property alias wheelImage3  The third image for the scrollwheel.

function changeValue(value) A function used internally to set 'currentIndex' and 'value'.
*/

Item {
    id: rooId

    property int value: 60
    property int minimum: 0
    property int maximum: 100
    property int dragDistance: 2
    property int currentIndex: 0
    // There are 3 images to simulate real rotation.
    property alias wheelImage1: scroller1.source
    property alias wheelImage2: scroller2.source
    property alias wheelImage3: scroller3.source

    function changeValue(delta) {
        var imageCount = 3
        if (delta < 0 && minimum <= value + delta) {
            currentIndex = (currentIndex + imageCount - 1) % imageCount // -delta (decrease)
            value += delta;
        } else if (delta > 0 && maximum >= value + delta) {
            currentIndex = (currentIndex + 1) % imageCount // +delta (increase)
            value += delta;
        }
    }

    Image {
        id: scroller1
        width: parent.width
        height: parent.height
        sourceSize.height: height
        sourceSize.width: width
        visible: rooId.currentIndex == 0
        source: "qrc:/SmartHome/Images/scrollwheel/Beryl/wheel_1.svg"
    }

    Image {
        id: scroller2
        width: parent.width
        height: parent.height
        sourceSize.height: height
        sourceSize.width: width
        visible: rooId.currentIndex == 1
        source: "qrc:/SmartHome/Images/scrollwheel/Beryl/wheel_2.svg"
    }

    Image {
        id: scroller3
        width: parent.width
        height: parent.height
        sourceSize.height: height
        sourceSize.width: width
        visible: rooId.currentIndex == 2
        source: "qrc:/SmartHome/Images/scrollwheel/Beryl/wheel_3.svg"
    }

    MouseArea {
        id: area

        property real startY: 0
        property real diff: 0
        property int toValue: 0

        anchors.fill: parent

        onPressed: {
            startY = mouseY
        }

        onPositionChanged: {
            diff = mouseY - startY

            if(Math.abs(diff) > rooId.dragDistance) {
                rooId.changeValue(diff > 0 ? -1 : 1)
                startY = mouseY
            }
        }

        onReleased: {
            if(Math.abs(diff) > rooId.dragDistance) {
                toValue = -(diff * 2)
                fade.running = true
            }
        }

        onToValueChanged: {
            rooId.changeValue(toValue)
        }

        NumberAnimation on toValue {
            id: fade
            target: area
            property: "toValue"
            to: 0
            duration: 600
        }
    }
}
