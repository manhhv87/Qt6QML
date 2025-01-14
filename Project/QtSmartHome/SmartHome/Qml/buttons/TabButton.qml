import QtQuick 2.15

/**
A special button that can switch between the tabs.
*/
Rectangle {
    id: tabButton

    property int index: 0
    property bool hover: false
    property alias buttonText: bText.text
    property color topColor: "#707072"
    property color bottomColor: "#403e41"
    property bool active: false

    objectName: "tabButton"

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
            color: tabButton.topColor
        }

        GradientStop {
            position: 1
            color: tabButton.bottomColor
        }
    }

    Text {
        id: bText
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: tabButton.hover ? "black" : "white"
    }

    states: [
        State {
            name: "hovered"

            PropertyChanges {
                target: tabButton
                topColor: "#b4b4b4"
                bottomColor: "#b4b4b4"
            }
        },
        State {
            name: "active"

            PropertyChanges {
                target: tabButton
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
            tabButton.hover = true
            tabButton.state = "hovered"
        }

        onExited: {
            tabButton.hover = false
            if(tabButton.active == true)
            {
                tabButton.state = "active"
            } else {
                tabButton.state = ""
            }
        }

        onClicked: {
            tabButton.active = true
            tabButton.activated()
        }
    }
}

