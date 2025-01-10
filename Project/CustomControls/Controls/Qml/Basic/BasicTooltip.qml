import QtQuick 2.15
import QtQuick.Controls.Basic 2.5

import ".."
import "../.."

ToolTip {
    id: basicTooltip
    contentItem: BasicText {
        text: basicTooltip.text
    }
    background: Rectangle {
        color: CusConfig.tipBackgroundColor
        border.color: CusConfig.tipBorderColor
    }
}
