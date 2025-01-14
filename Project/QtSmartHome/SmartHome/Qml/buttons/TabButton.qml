import QtQuick 2.15

/**
A special button that can switch between the tabs.
*/
Rectangle {
    id: rootId

    property int index: 0
    property bool hover: false
    property alias buttonText: bText.text
    property color topColor: "#707072"
    property color bottomColor: "#403e41"
    property bool active: false

    objectName: "rootId"

    onActiveChanged: state = active ? "active" : ""

    signal activated()

    width: 58
    height: 28
    smooth: true
    radius: 4
    border.color: hover ? "#4B4B4B" : "#b4b4b4"
    border.width: 2

    gradient: Gradient {
        GradientStop {
            position: 0
            color: rootId.topColor
        }

        GradientStop {
            position: 1
            color: rootId.bottomColor
        }
    }

    Text {
        id: bText
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: rootId.hover ? "black" : "white"
    }

    states: [
        State {
            name: "hovered"

            PropertyChanges {
                target: rootId
                topColor: "#b4b4b4"
                bottomColor: "#b4b4b4"
            }
        },
        State {
            name: "active"

            PropertyChanges {
                target: rootId
                topColor: "#b4b4b4"
                bottomColor: "#b4b4b4"
                border.color: "#b4b4b4"
            }

            PropertyChanges {
                target: bText
                color: "black"
            }
        }
    ]

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true

        onEntered: {
            rootId.hover = true
            rootId.state = "hovered"
        }

        onExited: {
            rootId.hover = false
            if(rootId.active == true)
            {
                rootId.state = "active"
            } else {
                rootId.state = ""
            }
        }

        onClicked: {
            rootId.active = true
            rootId.activated()
        }
    }
}

