import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls
import SmartHome 1.0

Page {
    padding: 0
    background: null

    Item {
        anchors.fill: parent
        anchors.margins: 50

        LeftPane { id: leftItem }

        MiddlePane { id: middleItem }

        RightPane { id: rightItem }
    }
}
