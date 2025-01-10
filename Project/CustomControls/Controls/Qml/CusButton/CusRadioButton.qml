import QtQuick 2.15
import QtQuick.Controls.Basic 2.5

import ".."
import "../.."

RadioButton {
    id: cusButton
    implicitHeight: CusConfig.fixedHeight
    implicitWidth: 200

    property alias tipText: toolTip.text
    property alias tipItem: toolTip
    property alias tipVisible: toolTip.visible
    property alias tipDelay: toolTip.delay
    property alias tipTimeout: toolTip.timeout

    property string btnImgCheckedNormal: CusConfig.imagePathPrefix + "radio-checked-normal.png"
    property string btnImgCheckedHovered: CusConfig.imagePathPrefix + "radio-checked-hover.png"
    property string btnImgCheckedDisabled: CusConfig.imagePathPrefix + "radio-checked-disabled.png"
    property string btnImgUnCheckedNormal: CusConfig.imagePathPrefix + "radio-unchecked-normal.png"
    property string btnImgUnCheckedHovered: CusConfig.imagePathPrefix + "radio-unchecked-hover.png"
    property string btnImgUnCheckedDisabled: CusConfig.imagePathPrefix + "radio-unchecked-disabled.png"

    property string btnImgUr: {
        if (checked) {
            if(!enabled) {
                return btnImgCheckedDisabled
            } else if (hovered) {
                return btnImgCheckedHovered
            } else {
                return btnImgCheckedNormal
            }
        } else {
            if(!enabled) {
                return btnImgUnCheckedDisabled
            } else if (hovered) {
                return btnImgUnCheckedHovered
            } else {
                return btnImgUnCheckedNormal
            }
        }
    }

    property color textColor: cusButton.enabled ? CusConfig.textColor : CusConfig.textColor_disabled

    indicator: CusImage {
        x: cusButton.leftPadding
        source: cusButton.btnImgUr
        y: (cusButton.height - height) /2
    }

    contentItem: BasicText {
        height: cusButton.height
        leftPadding: cusButton.leftPadding + cusButton.indicator.width + cusButton.spacing
        text: cusButton.text
        color: cusButton.textColor
        horizontalAlignment: Text.AlignLeft
    }

    BasicTooltip {
        id: toolTip
        visible: cusButton.hovered && String(text).length
    }

    TransArea {}
}
