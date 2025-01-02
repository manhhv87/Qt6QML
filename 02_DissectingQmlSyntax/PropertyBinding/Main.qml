import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Property Binding Demo")

    Rectangle {
        id: redRectId
        width: 50
        height: width * 1.5 // Property binding in action
        color: "red"
    }

    Rectangle {
        id: blueRectId
        width: 100
        height: 100
        color: "blue"
        anchors.bottom: parent.bottom

        MouseArea {
            anchors.fill: parent
            onClicked: {
                redRectId.width = redRectId.width + 10
            }
        }
    }

    Rectangle {
        id: greenId
        width: 100
        height: 100
        color: "green"
        anchors.bottom: parent.bottom
        anchors.left: blueRectId.right

        MouseArea {
            anchors.fill: parent
            onClicked: {
                //redRectId.height = 100 // Doesn't work
                //redRectId.height = redRectId.width * 1.5 // Doesn't work either
                redRectId.height = Qt.binding(function(){
                    return redRectId.width * 2
                })
            }
        }
    }
}
