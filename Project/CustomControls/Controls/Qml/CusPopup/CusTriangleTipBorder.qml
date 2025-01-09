import QtQuick 2.9

import ".."
import "../.."

Rectangle {
    id: root
    border.color: CusConfig.controlBorderColor
    color: CusConfig.backgroundColor
    radius: CusConfig.controlBorderRadius

    readonly property int trianglePosLeft: 0
    readonly property int trianglePosRight: 1
    readonly property int trianglePosTop: 2
    readonly property int trianglePosBottom: 3

    property int trangleWidth: 16
    property int trianglePos: trianglePosLeft

    property int triangleX: width / 2
    property int triangleY: height / 2

    Rectangle {
        id: triangleLeftRight
        visible: root.trianglePos === root.trianglePosLeft || root.trianglePos === root.trianglePosRight
        width: root.trangleWidth
        height: width
        rotation: 45
        y: root.triangleY
        x: (root.trianglePos === root.trianglePosLeft) ? -width / 2 + 2: root.width - width / 2 - 2
        color: parent.color
        border.color: parent.border.color
    }

    Rectangle {
        visible: root.trianglePos === root.trianglePosLeft || root.trianglePos === root.trianglePosRight
        width: triangleLeftRight.width
        height: triangleLeftRight.height * 1.5
        y: triangleLeftRight.y - 5
        x: (root.trianglePos === root.trianglePosLeft) ? 1 : root.width - width - 1
        color: parent.color
    }

    Rectangle {
        id: triangleTopBottom
        visible: root.trianglePos === root.trianglePosTop || root.trianglePos === root.trianglePosBottom
        width: root.trangleWidth
        height: width
        rotation: 45
        x: root.triangleX
        y: (root.trianglePos === root.trianglePosTop) ? -height / 2 + 2 : root.height - height / 2 - 2
        color: parent.color
        border.color: parent.border.color
    }

    Rectangle {
        visible: root.trianglePos === root.trianglePosTop || root.trianglePos === root.trianglePosBottom
        width: triangleTopBottom.width * 1.5
        height: triangleTopBottom.height
        x: triangleTopBottom.x - 5
        y: (root.trianglePos === root.trianglePosTop) ? 1 : root.height - height - 1
        color: parent.color
    }
}
