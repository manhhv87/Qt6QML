import QtQuick 2.9
import QtQuick.Controls 2.2

import ".."
import "../.."

Slider {
    id: root
    implicitWidth: 200
    height: CusConfig.fixedHeight

    property bool showNumber: true

    background: Rectangle {
        x: root.leftPadding
        y: root.topPadding + root.availableHeight / 2 - height /2
        implicitHeight: 4
        width: root.availableWidth
        height: implicitHeight
        radius: CusConfig.controlBorderRadius
        color: CusConfig.controlBorderColor

        Rectangle {
            width: root.visualPosition * parent.width
            height: parent.height
            color: CusConfig.controlBorderColor_hovered
            radius: parent.radius
        }
    }
    handle: Rectangle {
        x: root.leftPadding + root.visualPosition * (root.availableWidth - width)
        y: root.topPadding + root.availableHeight / 2 - height / 2
        property bool handleHovered: root.hovered
        implicitWidth: root.showNumber ? 24 : 16
        implicitHeight: implicitWidth
        radius: width / 2
        color: handleArea.handlePressed ? CusConfig.controlColor_pressed : (handleArea.handleHovered ? CusConfig.controlColor_hovered : CusConfig.controlColor)
        border.color: (handleArea.handleHovered || handleArea.handlePressed || handleArea.focus) ? CusConfig.controlBorderColor_hovered : CusConfig.controlBorderColor
        border.width: 1

        CusLabel {
            visible: root.showNumber
            anchors.centerIn: parent
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            text: parseInt(root.value)
            color: (handleArea.handleHovered || handleArea.handlePressed) ? CusConfig.textColor_pressed : CusConfig.textColor
        }

        TransArea {
            id: handleArea

            property bool handleHovered: false
            property bool handlePressed: handleHovered && root.pressed

            onEntered: {
                handleHovered = true;
            }

            onExited: {
                handleHovered = false;
            }
        }
    }
}
