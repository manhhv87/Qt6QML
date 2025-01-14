import QtQuick 2.15

/**
This item provides a secure slideswitch. A SlideSwitch is a switch that can
not be pressed accidentally. The user has to slide to knob to the other side
to toggle. There are two skins available.

property alias on                       A property to check if the button is on.
property string backgroundImageNormal   The normal background image.
property string backgroundImageHover    The background image when hovered.
property string knobImageOn             The knob image when the switch is on.
property string knobImageOff            The knob image when the switch is off.
*/

Item {
    id: rootId

    property alias on: button.on
    property string theme: "Beryl"
    property string backgroundImageNormal: "qrc:/SmartHome/Images/svgslideswitch/Beryl/background.svg"
    property string backgroundImageHover: "qrc:/SmartHome/Images/svgslideswitch/Beryl/background_hover.svg"
    property string knobImageOn: "qrc:/SmartHome/Images/svgslideswitch/Beryl/knob_on.svg"
    property string knobImageOff: "qrc:/SmartHome/Images/svgslideswitch/Beryl/knob_off.svg"

    Image {
        id: background

        property bool hover: false

        width: parent.width
        height: parent.height
        sourceSize.width: width
        sourceSize.height: height
        anchors.fill: parent
        source: hover ? rootId.backgroundImageHover : rootId.backgroundImageNormal
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true

        onEntered: {
            background.hover = true
        }
        onExited: {
            background.hover = false
        }
    }

    Image {
        id: button

        property bool on: false

        source: button.on ? rootId.knobImageOn : rootId.knobImageOff
        height: background.height
        width: height
        sourceSize.width: width
        sourceSize.height: height

        MouseArea {
            anchors.fill: parent
            drag.target: parent
            drag.axis: Drag.XAxis
            drag.minimumX: 0
            drag.maximumX: background.width - button.width

            onReleased: {
                if(button.x > ((background.width - button.width) / 2)) {
                    rootId.state = ""
                    rootId.state = "on"
                }
                else {
                    rootId.state = ""
                    rootId.state = "off"
                }
            }
        }
    }

    // using states to differentiate between "on" and "off"
    states: [
        State {
            name: "on"
            PropertyChanges {
                target: button
                x: background.width - button.width
                on: true
            }
        },
        State {
            name: "off"
            PropertyChanges {
                target: button
                x: 0
                on: false
            }
        }
    ]

    transitions: Transition {
        NumberAnimation {
            properties: "x"
            duration: 400
            easing.type: Easing.OutQuad
        }
    }
}
