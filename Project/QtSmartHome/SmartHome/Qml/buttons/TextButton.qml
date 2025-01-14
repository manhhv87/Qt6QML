import QtQuick 2.15

/**
A simple button containing text that changes when the button is clicked. To
get a horizontal gradient the button is rotated 90 degrees.

property bool clicked:       Flag to check if the button was clicked.
property bool active:        Flag to see if the button is active.
property string buttonText1: First text on the button.
property string buttonText2: Second text on the button.

signal activated()
*/

Rectangle {
    id: rootId

    property bool clicked: false
    property bool active: true
    property string buttonText1: ""
    property string buttonText2: ""

    signal activated()

    rotation: 90
    smooth: true
    radius: 4
    border.width: 2
    border.color: rootId.clicked ? "#B4B4B4" : "#4B4B4B"
    gradient: Gradient {
        GradientStop {
            position: 0
            color: "#dcdcdc"
        }

        GradientStop {
            position: 0.5
            color: "#7f7f7f"
        }

        GradientStop {
            position: 1
            color: "#dcdcdc"
        }
    }

    MouseArea {
        anchors.fill: parent

        onPressed: {
            rootId.active = !rootId.active
            rootId.clicked = !rootId.clicked
            rootId.activated()
        }
        onReleased: {
            rootId.clicked = !rootId.clicked
        }
    }

    Text {
        id: buttonText
        text: rootId.active ? rootId.buttonText1 : rootId.buttonText2
        anchors.centerIn: parent
        rotation: -90
        font.bold: true
    }
}
