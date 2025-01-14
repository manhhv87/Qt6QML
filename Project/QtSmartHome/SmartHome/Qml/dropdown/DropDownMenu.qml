pragma ComponentBehavior: Bound

import QtQuick 2.15

/**
Here a drop-down-menu is defined. The behavior of its c++-counterpart is
recreated as close as possible. It uses a listview to display the contents
of the menu.

property alias model:   The model for the menu.
property bool menuOpen: Flag to check if the menu is open or not.
property int itemIndex: The index of the currently selected item.
*/

Rectangle {
    id: rootId

    property alias model: list.model
    property bool menuOpen: false
    property int itemIndex: 0

    radius: 2
    smooth: true
    border.width: 2
    border.color: "gray"
    z: 10

    Text {
        id: boxText
        smooth: true
        // always display the first entry at the beginning
        text: list.model.get(0).name
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 2
    }

    Timer {
        id: closeTimer
        interval: 300
        onTriggered: rootId.menuOpen = false
    }

    Rectangle {
        id: menuButton
        width: 30
        height: parent.height
        color: "#8b8b8b"
        radius: 2
        smooth: true
        anchors.right: parent.right
        anchors.top: parent.top

        Text {
            id: arrow
            text: rootId.menuOpen ? "^" : "v"
            anchors.centerIn: parent
            smooth: true
        }

        MouseArea {
            anchors.fill: parent
            onClicked: rootId.menuOpen = !rootId.menuOpen
        }
    }

    Rectangle {
        id: menu
        width: parent.width
        height: list.count * 16
        visible: rootId.menuOpen
        smooth: true
        radius: 2
        anchors.top: parent.bottom
        anchors.topMargin: 1
        anchors.left: parent.left

        ListView {
            id: list
            width: rootId.width
            height: menu.height
            highlight: Rectangle {
                width: list.width
                color: "lightsteelblue"
                radius: 2
            }
            highlightFollowsCurrentItem: true
            focus: true
            clip: true
            delegate: Item {
                property alias text: listText.text
                width: parent.width
                height: 20
                Text {
                    id: listText
                    anchors.verticalCenter: parent.verticalCenter
                    text: name
                }
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true

                onPressed: {
                    boxText.text = list.currentItem.text
                    closeTimer.start()
                    itemIndex = list.currentIndex
                }

                onMouseYChanged: {
                    list.currentIndex = list.indexAt(mouseX, mouseY)
                }
                onMouseXChanged: {
                    list.currentIndex = list.indexAt(mouseX, mouseY)
                }
            }
        }
    }
}
