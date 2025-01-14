import QtQuick 2.15

/**
* This item provides a secure slideswitch that is only activated when slid
* over half of its width. The size of the switch, its background and the
* slider knob can be customized by the user. The state of the switch can be
* checked by accessing the 'enabled' alias.
*
* Properties:
* string backgroundImageHover:  The image when the mouse is inside the
*                               background
* string backgroundImageNormal: The image when the mouse is outside of the
*                               background
* string buttonImageOn:         The image of the knob when the switch is on
* string buttonImageOff:        The image of the knob then the switch is off
* alias enabled:                Provides access to the state of the button,
*                               true when enabled, false otherwise
*/

Item {
    id: slideswitch

    property string backgroundImageHover: ""
    property string backgroundImageNormal: ""
    property string buttonImageOn: ""
    property string buttonImageOff: ""
    property alias enabled: button.on

    /**
    * This image is the background of the whole slider.
    */
    Image {
        id: background

        property bool hover: false

        smooth: true
        anchors.fill: parent
        // change the background when hovering over it
        source: hover ? backgroundImageHover : backgroundImageNormal
    }

    // For hover purpose
    MouseArea {
        anchors.fill: background
        hoverEnabled: true

        onEntered: background.hover = true
        onExited: background.hover = false
    }

    /**
    * This image is the knob of the slider
    */
    Image {
        id: button

        property bool on: false

        height: background.height
        width: background.height
        smooth: true
        source: on ? buttonImageOn : buttonImageOff
        anchors.verticalCenter: background.verticalCenter

        MouseArea {
            anchors.fill: parent
            drag.target: parent
            drag.axis: Drag.XAxis
            drag.minimumX: 0
            drag.maximumX: background.width - button.width

            onReleased: {
                if(button.x > ((background.width - button.width) / 2)) {
                    slideswitch.state = ""
                    slideswitch.state = "on"
                }
                else {
                    slideswitch.state = ""
                    slideswitch.state = "off"
                }
            }
        }
    }

    // The slider can either be in an on or off state
    states: [
        State {
            name: "on"
            PropertyChanges {
                target: button
                x: background.width-button.width
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

    // This transition handles the "x" property of the knob, resulting in an even movement.
    transitions: Transition {
        NumberAnimation {
            properties: "x"
            duration: 400
            easing.type: Easing.OutQuad
        }
    }
}
