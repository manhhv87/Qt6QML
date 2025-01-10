import QtQuick 2.15

// Rectangle simulates a rounded rectangle. It does not depend on other modules
// and can be used in basic Qt versions.
// The four corners are controllable.
// Translucency is not supported.

Rectangle {
    id: root
    implicitWidth: 50
    implicitHeight: 50
    radius: 0

    readonly property int lt: Qt.AlignLeft | Qt.AlignTop
    readonly property int lb: Qt.AlignLeft | Qt.AlignBottom
    readonly property int rt: Qt.AlignRight | Qt.AlignTop
    readonly property int rb: Qt.AlignRight | Qt.AlignBottom

    property bool leftTopRound: false
    property bool rightTopRound: false
    property bool leftBottomRound: false
    property bool rightBottomRound: false

    onLeftTopRoundChanged: {
        updateCorners()
    }

    onLeftBottomRoundChanged: {
        updateCorners()
    }

    onRightBottomRoundChanged: {
        updateCorners()
    }

    onRightTopRoundChanged: {
        updateCorners()
    }
    property var corners: []


    Repeater {
        model: [{
                "x": 0,
                "y": 0,
                "visible": internal.aligns(root.lt),
                "radius": root.radius
            }, {
                "x": root.width - root.radius,
                "y": 0,
                "visible": internal.aligns(root.rt),
                "radius": root.radius
            }, {
                "x": 0,
                "y": root.height - root.radius,
                "visible": internal.aligns(root.lb),
                "radius": root.radius
            }, {
                "x": root.width - root.radius,
                "y": root.height - root.radius,
                "visible": internal.aligns(root.rb),
                "radius": root.radius
            }]

        Rectangle {
            x: modelData.x
            y: modelData.y
            width: modelData.radius
            height: width
            visible: !modelData.visible
            color: parent.color
        }
    }

    QtObject {
        id: internal

        function aligns(direction) {
            if (Array.isArray(root.corners)) {
                for (var i = 0; i < root.corners.length; i++) {
                    if ((root.corners[i] & direction) === direction)
                        return true
                }
                return false
            } else {
                return (root.corners & direction) === direction
            }
        }
    }

    function updateCorners() {
        var s = []

        if (leftTopRound) {
            s.push(lt)
        }

        if (rightTopRound) {
            s.push(rt)
        }

        if (leftBottomRound) {
            s.push(lb)
        }

        if (rightBottomRound) {
            s.push(rb)
        }

        corners = s
    }
}
