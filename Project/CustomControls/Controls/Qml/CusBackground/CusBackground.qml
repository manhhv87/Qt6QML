import QtQuick 2.15

import ".."
import "../.."

Rectangle {
    color: CusConfig.backgroundColor

    MouseArea {
        id: backgroundArea
        anchors.fill: parent
        onClicked: {
            focus = true
        }
    }
}
