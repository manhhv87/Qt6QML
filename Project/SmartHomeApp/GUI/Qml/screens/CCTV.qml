import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls
import SmartHome 1.0

import "../models"

Pane {
    padding: 0
    background: Rectangle {
        color: Style.alphaColor("#000000",0.2)
    }

    contentItem: Item {
        anchors.fill: parent

        GridView {
            anchors.fill: parent
            anchors.margins: 40
            flow: Grid.TopToBottom
            model: CCTVModel{}
            cellWidth: 160 + 40
            cellHeight: 160 + 40
            delegate: CCTVTile {
                on: model.on
                icon: model.icon
                iconColor: model.iconColor
                title: model.title
                subTitle: model.subTitle
                tag: model.tag
            }
        }
    }
}
