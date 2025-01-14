import QtQuick 2.15

/**
A simple button that changes its appearance when clicked. The themeing requires
the images to be in a directory with the same name as the themes' name.

property string imageNormal:    The image of the button when not pressed.
property string imageHover:     The image of the button when hovered.
property string imagePressed:   The image of the button when pressed.
property bool hover:            Internal flag to see if the button is hovered.
*/
Image {
    id: rootId

    property string imageNormal: "qrc:/SmartHome/Images/svgbutton/Beryl/normal.svg"
    property string imageHover: "qrc:/SmartHome/Images/svgbutton/Beryl/hovered.svg"
    property string imagePressed: "qrc:/SmartHome/Images/svgbutton/Beryl/pressed.svg"
    property bool hover: false

    source: hover ? imageHover : imageNormal

    states: [
        State {
            name: "pressed"
            PropertyChanges {
                target: rootId
                source: imagePressed
            }
        }
    ]

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true

        onEntered: {
            rootId.hover = true
        }

        onExited: {
            rootId.hover = false
            rootId.state = ""
        }

        onPressed: {
            rootId.state = "pressed"
        }

        onReleased: {
            rootId.state = ""
        }
    }
}
