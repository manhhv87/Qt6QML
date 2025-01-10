import QtQuick 2.15
import QtQuick.Controls.Basic 2.5

import "../.."

Button {
    id: cusButton
    implicitWidth: 24
    implicitHeight: 24

    property alias tipText: toolTip.text
    property alias tipItem: toolTip
    property alias tipVisible: toolTip.visible
    property alias tipDelay: toolTip.delay
    property alias tipTimeout: toolTip.timeout
    property bool selected: false
    property string btnImgNormal
    property string btnImgHovered
    property string btnImgPressed
    property string btnImgDisbaled

    property string btnImgUrl: {
        if (!cusButton.enabled) {
            return btnImgDisbaled
        } else if (cusButton.pressed || selected) {
            return btnImgPressed
        } else if (cusButton.hovered) {
            return btnImgHovered
        } else {
            return btnImgNormal
        }
    }

    background: Item {
        width: cusButton.width
        height: cusButton.height

        CusImage {
            id: backImage
            source: cusButton.btnImgUrl
            anchors.centerIn: parent
        }
    }

    BasicTooltip {
        id: toolTip
        visible: cusButton.hovered && String(text).length
        delay: 500
    }

    TransArea {
    }
}
