pragma ComponentBehavior: Bound

import QtQuick 2.15
import SmartHome 1.0

/**
 * The VTabBar displays a vertical tab bar.
 *
 * Properties:
 * tabs:       A list of strings for the tab captions
 * indices:    A list of integers specifying which page index to be used for the tabs
 * icons:      A list of urls specifying the images to be used as the tab icons
 *
 * Signals:
 * clicked(int tab):    Emitted when a tab has been clicked
 */
Rectangle {
    id: rootId

    property variant tabs: []
    property variant icons: []
    property variant indices
    property bool showOnLeft: true
    property string tabImagePressed
    property string tabImageNormal

    property string tabIconDirectory
    property string tabIconFileType

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

    /**
     * Initially the tab bar is invisible. This makes sure it's made visible on-demand.
     */
    onIndicesChanged: { visible = true; width = 130; }

    /**
     * For convenience, the Column positioner is used to create a vertical list of tabs.
     */
    Column {
        anchors.verticalCenter: parent.verticalCenter
        id: header
        /**
         * A Repeater is used to dynamically create the desired number of tabs.
         */
        Repeater {
            model: rootId.tabs.length
            delegate: Rectangle {
                id: rect
                color: "transparent"
                height: Math.min(100, rootId.height / rootId.tabs.length); width: rootId.width

                BorderImage {
                    id: image
                    anchors { fill: parent; margins: 0; rightMargin: 1 }
                    source: rootId.currentIndex == index ? "qrc:/SmartHome/Images/tabs/tabs_pressed.svg" : "qrc:/SmartHome/Images/tabs/tabs_normal.svg"
                    opacity: rootId.currentIndex == index ? 1 : 0.5
                    transform: Scale {
                        origin.x: parent.width / 2 - image.anchors.leftMargin
                        xScale: rootId.showOnLeft ? -1 : 1
                        yScale: 1
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
                    x: parent.width/2 - width/2
                    text: rootId.tabs[index]
                    font.family: "Arial"
                    font.pointSize: 12
                    font.bold: rootId.currentIndex == index
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
