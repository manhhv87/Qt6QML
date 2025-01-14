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
    id: tabBar

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

            model: tabBar.tabs.length
            delegate: Rectangle {
                color: "transparent"
                width: Math.min(100, tabBar.width / tabBar.tabs.length); height: 36

                BorderImage {
                    id: image
                    anchors { fill: parent; leftMargin: 2; topMargin: 5; rightMargin: 1 }
                    border { left: 7; right: 7 }
                    source: tabBar.currentIndex == index ? "qrc:/SmartHome/Images/tabs/tabs_pressed.svg" : "qrc:/SmartHome/Images/tabs/tabs_normal.svg"
                    opacity: tabBar.currentIndex == index ? 1 : 0.5
                    transform: Scale {
                        origin.y: parent.height / 2 - image.anchors.topMargin
                        xScale: 1
                        yScale: tabBar.showOnTop ? 1 : -1
                    }
                }

                Image {
                    id: imageIcon
                    anchors.centerIn: parent
                    source: tabBar.icons.length > index ? tabBar.icons[index] : ""
                }

                Text {
                    smooth: true
                    color: "white"
                    horizontalAlignment: Qt.AlignHCenter; verticalAlignment: Qt.AlignVCenter
                    anchors.top: imageIcon.bottom
                    text: tabBar.tabs[index]
                    elide: Text.ElideRight
                    font.family: "Arial"
                    font.pointSize: 12
                    font.bold: tabBar.current == index
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
