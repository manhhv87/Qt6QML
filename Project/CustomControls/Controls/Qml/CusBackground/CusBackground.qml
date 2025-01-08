import QtQuick 2.9

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
