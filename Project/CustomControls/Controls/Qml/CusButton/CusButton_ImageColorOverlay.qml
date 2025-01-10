import QtQml 2.5
import QtQuick 2.15
import QtQuick.Controls.Basic 2.5
import Qt5Compat.GraphicalEffects

import ".."
import "../.."

Button {
    id: cusButton
    implicitWidth: 30
    implicitHeight: 30

    property alias tipText: toolTip.text
    property alias tipItem: toolTip
    property alias tipVisible: toolTip.visible
    property alias tipDelay: toolTip.delay
    property alias tipTimeout: toolTip.timeout

    property string btnImgNormal
    property string btnImgHovered
    property string btnImgPressed
    property string btnImgDisbaled
    property bool selected: false
    property color colorNormal: CusConfig.imageColor
    property color colorHovered: CusConfig.imageColor_hovered
    property color colorPressed: CusConfig.imageColor_pressed
    property color colorDisable: CusConfig.imageColor_disabled

    property color backgroundColor: "transparent"

    CusImage {
        id: baseImage
        source: cusButton.btnImgNormal
        smooth: true
        visible: false
    }

    background: Rectangle {
        width: cusButton.width
        height: cusButton.height
        radius: CusConfig.controlBorderRadius
        color: cusButton.backgroundColor

        ColorOverlay {
            source: baseImage
            width: baseImage.width
            height: baseImage.height
            anchors.centerIn: parent
            cached: true
            color: {
                if (!cusButton.enabled) {
                    return cusButton.colorDisable
                } else if (cusButton.pressed || cusButton.selected) {
                    return cusButton.colorPressed
                } else if (cusButton.hovered) {
                    return cusButton.colorHovered
                } else {
                    return cusButton.colorNormal
                }
            }
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
