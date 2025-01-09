import QtQuick 2.9
import QtQuick.Controls 2.2

import ".."
import "../.."

Item {
    id: cusPopup
    anchors.fill: parent

    property alias popupVisible: popup.visible
    property alias contentItem: popup.contentItem
    property color barColor: CusConfig.tipBackgroundColor
    property alias backgroundItem: background
    property real backgroundWidth: 200
    property real backgroundHeight: 160
    property color borderColor:  barColor
    property real borderWidth: 0

    property real verticalOffset: 24

    // The rectangle is rotated 45 degrees, half of it is covered by the toolTip (overlaps),
    // and the other half of the triangle and the ToolTip form a ToolTip with an arrow
    Rectangle {
        id: bar
        visible: popup.visible
        rotation: 45
        width: cusPopup.verticalOffset
        height: width
        color: cusPopup.barColor
        border.color: cusPopup.borderColor

        // Horizontal center
        anchors.horizontalCenter: parent.horizontalCenter

        //In the vertical direction, the position is determined by the y value of the ToolTip.
        anchors.verticalCenter: parent.bottom
        anchors.verticalCenterOffset: cusPopup.verticalOffset
    }

    Popup {
        id: popup
        width: cusPopup.backgroundWidth
        height: cusPopup.backgroundHeight
        background: Rectangle {
            id: background
            color: cusPopup.barColor
            radius: 8
            border.color: cusPopup.borderColor
            border.width: cusPopup.borderWidth
        }
    }

    function show() {
        popup.x = (cusPopup.width - popup.width) / 2
        popup.y = cusPopup.height + verticalOffset
        popupVisible = true
    }

    function hide() {
        popupVisible = false
    }
}
