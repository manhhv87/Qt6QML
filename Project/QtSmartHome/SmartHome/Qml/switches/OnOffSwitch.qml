import QtQuick 2.15

/**
Here a simple toggle switch is defined that changes its state based on a click
into the defined mouse area. The themeing requires the alternative images to be
in a folder with the the name of the theme.

property bool on            A property to check if the button is on.
property string theme       Flag to change the theme of the switch.
property string imageOn     The image of the button when on.
property string imageOff    The image of the button when off.
*/

Item {
    id: rootId

    property bool on: false
    property string theme: "Beryl"
    property string imageOn: "qrc:/SmartHome/Images/svgtoggleswitch/Beryl/on.svg"
    property string imageOff: "qrc:/SmartHome/Images/svgtoggleswitch/Beryl/off.svg"

    Image {
        id: toggleSwitchImage
        anchors.fill: parent
        source: rootId.on ? rootId.imageOn : rootId.imageOff
        sourceSize.width: parent.width
        sourceSize.height: parent.height
    }

    MouseArea {
        anchors.fill: parent

        onClicked: rootId.on = !rootId.on
    }
}
