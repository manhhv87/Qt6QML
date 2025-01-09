import QtQuick 2.9
import QtQuick.Controls.Basic 2.2
import Qt5Compat.GraphicalEffects

import ".."
import "../.."

CheckBox {
    id: cusCheckBox
    implicitHeight: CusConfig.fixedHeight
    checked: false

    contentItem: CusLabel {
        leftPadding: cusCheckBox.indicator.width + cusCheckBox.spacing
        text: cusCheckBox.text
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
        color: cusCheckBox.enabled ? CusConfig.textColor : CusConfig.textColor_disabled
    }

    property color colorNormal: CusConfig.imageColor
    property color colorHovered: CusConfig.imageColor_hovered
    property color colorPressed: CusConfig.imageColor_pressed
    property color colorDisable: CusConfig.imageColor_disabled
    readonly property string imgUrlCheck: CusConfig.imagePathPrefix + "Check.png"

    CusImage {
        id: baseImgCheck
        smooth: true
        visible: false
        source: cusCheckBox.imgUrlCheck
    }

    indicator: Rectangle {
        implicitWidth: 24
        implicitHeight: 24
        x: cusCheckBox.leftPadding
        y: (cusCheckBox.height - height) / 2
        color: cusCheckBox.enabled ? CusConfig.controlColor : CusConfig.controlColor_disabled
        radius: CusConfig.controlBorderRadius
        border.width: 1
        border.color: cusCheckBox.pressed ? CusConfig.controlBorderColor_pressed : (cusCheckBox.hovered ? CusConfig.controlBorderColor_hovered : CusConfig.controlBorderColor)

        ColorOverlay {
            id: indicatorImg
            source: baseImgCheck
            width: baseImgCheck.width
            height: baseImgCheck.height
            anchors.centerIn: parent
            cached: true
            visible: cusCheckBox.checked

            color: {
                if (!cusCheckBox.enabled) {
                    return cusCheckBox.colorDisable
                } else if (cusCheckBox.pressed) {
                    return cusCheckBox.colorPressed
                } else if (cusCheckBox.hovered) {
                    return cusCheckBox.colorHovered
                } else {
                    return cusCheckBox.colorPressed
                }
            }
        }
    }

    TransArea {
        enabled: cusCheckBox.enabled
    }
}
