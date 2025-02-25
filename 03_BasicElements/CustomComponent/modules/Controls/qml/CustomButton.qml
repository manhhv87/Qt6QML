import QtQuick 2.15
import QtQuick.Controls.Basic 2.5
import QtQuick.Layouts 1.3
import Qt5Compat.GraphicalEffects

import Style 0.1

Button {
    id: control

    implicitWidth: 46
    implicitHeight: 46

    property real radius: 8
    property color backgroundColor: "#14A44D"
    property string setIcon: ""
    property color textColor: "#FFFFFF"

    property real borderWidth: 0
    property color borderColor: "transparent"
    font.pixelSize: FontStyle.h3
    font.family: FontStyle.getContentFont.name
    font.bold: Font.Bold
    font.weight: Font.Bold

    contentItem: ColumnLayout {
        width: parent.width
        height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter

        Label {
            z: 2
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            font: control.font
            text: control.text
            color: control.textColor
            visible: !control.setIcon
        }

        Image {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            sourceSize: Qt.size(control.implicitWidth*0.6, control.implicitHeight*0.6)
            source: control.setIcon
        }
    }

    background: Rectangle {
        implicitHeight: control.implicitHeight
        implicitWidth: control.implicitWidth
        radius: control.radius
        color: control.backgroundColor
        border.width: control.borderWidth
        border.color: control.borderColor

        visible: false

        Behavior on color {
            ColorAnimation {
                easing.type: Easing.Linear
                duration: 200
            }
        }

        Rectangle {
            id: indicator
            property int mx
            property int my
            x: mx - width/2
            y: my - height/2
            height: width
            radius: control.radius
            color: Qt.lighter(AppStyle.appStyle)
        }
    }

    Rectangle {
        id: mask
        radius: control.radius
        anchors.fill: parent
        visible: false
    }

    OpacityMask {
        anchors.fill: control.background
        source: control.background
        maskSource: mask
    }

    MouseArea {
        id: mouseArea
        hoverEnabled: true
        acceptedButtons: Qt.NoButton
        cursorShape: Qt.PointingHandCursor
        anchors.fill: parent
    }

    ParallelAnimation {
        id: anim

        NumberAnimation {
            target: indicator
            properties: 'width'
            from: 0
            to:control.width *2.5
            duration: 200
        }

        NumberAnimation {
            target: indicator
            properties: 'opacity'
            from: 0.9
            to: 0
            duration: 200
        }
    }

    onPressed: {
        indicator.mx = mouseArea.mouseX
        indicator.my = mouseArea.mouseY
        anim.restart()
    }
}
