import QtQuick 2.15
import QtQuick.Controls.Basic 2.5

import "../.."

Button {
    id: cusButton

    property alias tipText: toolTip.text
    property alias tipItem: toolTip
    property alias tipVisible: toolTip.visible
    property alias tipDelay: toolTip.delay
    property alias tipTimeout: toolTip.timeout

    property string btnImgUr
    property color backgroundColor: "transparent"
    property color backgroundColor_pressed
    property color backgroundColor_hovered

    BasicTooltip {
        id: toolTip
        visible: cusButton.hovered && String(text).length
    }

    background: Rectangle {
        width: cusButton.width
        height: cusButton.height
        color: cusButton.pressed ? cusButton.backgroundColor_pressed : ( cusButton.hovered ? cusButton.backgroundColor_hovered : cusButton.backgroundColor)

        CusImage {
            anchors.centerIn: parent
            width: cusButton.width
            height: cusButton.height
            source: cusButton.btnImgUr
        }
    }

    TransArea {}
}
