import QtQuick 2.9

import ".."
import "../.."

Item {
    id: root
    anchors.fill: parent

    property alias text: toolTip.text
    property alias tipVisible: toolTip.visible
    property alias delay: toolTip.delay
    property alias timeout: toolTip.timeout
    property color barColor: CusConfig.tipBackgroundColor

    // The rectangle is rotated 45 degrees, half of it is covered by the toolTip (overlaps),
    // and the other half of the triangle and the ToolTip form a ToolTip with an arrow
    Rectangle {
        id: bar
        visible: toolTip.visible
        rotation: 45
        width: 10
        height: 10
        color: root.barColor

        // Horizontal center
        anchors.horizontalCenter: parent.horizontalCenter

        // In the vertical direction, the position is determined by the y value of the ToolTip.
        anchors.verticalCenter: toolTip.y > 0 ? parent.bottom : parent.top
        anchors.verticalCenterOffset: toolTip.y > 0 ? 5 : -5
    }

    BasicTooltip {
        id: toolTip
        delay: 500
        background: Rectangle {
            color: barColorbarColor
            radius: CusConfig.controlBorderRadius
        }
    }
}
