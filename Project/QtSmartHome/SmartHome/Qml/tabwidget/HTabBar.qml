pragma ComponentBehavior: Bound

import QtQuick 2.15

/**
 * The TabBar displays a horizontal tab bar.
 * This Item is not used in the SmartHome demonstrator
 *
 * Properties:
 * tabs:       A list of strings for the tab captions
 * indices:    A list of integers specifying which page index to be used for the tabs
 *
 * Signals:
 * clicked(int tab):    Emitted when a tab has been clicked
 */
Rectangle {
    id: rootId

    property variant tabs: []
    property variant icons: []
    property variant indices
    property bool showOnTop: true

    property int currentIndex: 0

    signal currentChanged(int index)

    /**
     * Function to set the current tab. As a side effect the tab is drawn in "selected" state and
     * the "clicked()" signal is emitted.
     */
    function setCurrentIndex(cur) {
        currentIndex = cur
        if(indices)
            currentChanged( indices[ currentIndex ])
    }

    visible: false
    color: "transparent"
    onIndicesChanged: { visible = true; height = 36; }

    Row {
        id: header

        Repeater {

            model: rootId.tabs.length
            delegate: Rectangle {
                color: "transparent"
                width: Math.min(100, rootId.width / rootId.tabs.length); height: 36

                BorderImage {
                    id: image
                    anchors { fill: parent; leftMargin: 2; topMargin: 5; rightMargin: 1 }
                    border { left: 7; right: 7 }
                    source: rootId.currentIndex == index ? "qrc:/SmartHome/Images/tabs/tabs_pressed.svg" : "qrc:/SmartHome/Images/tabs/tabs_normal.svg"
                    opacity: rootId.currentIndex == index ? 1 : 0.5
                    transform: Scale {
                        origin.y: parent.height / 2 - image.anchors.topMargin
                        xScale: 1
                        yScale: rootId.showOnTop ? 1 : -1
                    }
                }

                Image {
                    id: imageIcon
                    anchors.centerIn: parent
                    source: rootId.icons.length > index ? rootId.icons[index] : ""
                }

                Text {
                    smooth: true
                    color: "white"
                    horizontalAlignment: Qt.AlignHCenter; verticalAlignment: Qt.AlignVCenter
                    anchors.top: imageIcon.bottom
                    text: rootId.tabs[index]
                    elide: Text.ElideRight
                    font.family: "Arial"
                    font.pointSize: 12
                    font.bold: current == index
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        setCurrentIndex(index)
                    }
                }
            }
        }
    }
}
