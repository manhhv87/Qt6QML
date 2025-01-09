import QtQuick 2.9

import ".."
import "../.."

CusTextField {
    id: cusTextFieldBtn

    property Component rightBtn: nullptr

    background: Rectangle  {
        color: (cusTextFieldBtn.enabled && !cusTextFieldBtn.readOnly) ? CusConfig.controlColor : CusConfig.controlColor_disabled
        radius: CusConfig.controlBorderRadius
        border.width: 1
        border.color: (cusTextFieldBtn.enabled && !cusTextFieldBtn.readOnly && (cusTextFieldBtn.hovered || cusTextFieldBtn.focus)) ? CusConfig.controlBorderColor_hovered : CusConfig.controlBorderColor

        Loader {
            sourceComponent: cusTextFieldBtn.rightBtn
            anchors {
                right: parent.right
                rightMargin: 4
                verticalCenter: parent.verticalCenter
            }
        }
    }
}
