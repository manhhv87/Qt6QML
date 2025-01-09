import QtQuick 2.9
import QtQuick.Controls 2.2

import ".."
import "../.."

ScrollBar {
    id: root
    property bool isSmaller: true
    // minimumSize: 0.1
    // size: Math.max(height / content.height, 0.1)

    contentItem: Rectangle {
        implicitWidth: root.isSmaller ?  CusConfig.scrollBarSize_Smaller : CusConfig.scrollBarSize
        implicitHeight: root.isSmaller ?  CusConfig.scrollBarSize_Smaller : CusConfig.scrollBarSize
        radius: CusConfig.scrollBarRadius
        color: root.isSmaller ? CusConfig.scrollBarBackgroundColor : CusConfig.scrollBarBackgroundColor_hovered

        TransArea{
            id: t
            onEntered: {
                root.isSmaller = false
            }
            onExited: {
                root.isSmaller = true
            }
        }
    }
}
