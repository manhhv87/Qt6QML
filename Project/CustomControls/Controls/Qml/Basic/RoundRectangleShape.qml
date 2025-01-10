import QtQuick 2.15
import QtQuick.Shapes 1.8

Shape {
    id: root
    property bool leftTopRound: true        // Is the upper left corner rounded?
    property bool leftBottomRound: true     // Is the lower left corner rounded?
    property bool rightTopRound: true       // Is the upper right corner rounded?
    property bool rightBottomRound: true    // Is the lower right corner rounded?
    property real radius                    // Corner radius
    property color color: "red"             // color

    // Multi-sample anti-aliasing
    layer.enabled: true
    layer.samples: 8

    // Smoothing
    smooth: true

    // Default anti-aliasing
    antialiasing: true

    ShapePath {
        fillColor: root.color
        startX: root.leftTopRound ? root.radius : 0
        startY: 0

        // fillRule: ShapePath.WindingFill
        PathLine {
            x: root.rightTopRound ? root.width - root.radius : root.width
            y: 0
        }

        PathArc {
            x: root.width
            y: root.rightTopRound ? root.radius : 0
            radiusX: root.rightTopRound ? root.radius : 0
            radiusY: root.rightTopRound ? root.radius : 0
        }

        PathLine {
            x: root.width
            y: root.rightBottomRound ? root.height - root.radius : root.height
        }

        PathArc {
            x: root.rightBottomRound ? root.width - root.radius : root.width
            y: root.height
            radiusX: root.rightBottomRound ? root.radius : 0
            radiusY: root.rightBottomRound ? root.radius : 0
        }

        PathLine {
            x: root.leftBottomRound ? root.radius : 0
            y: root.height
        }

        PathArc {
            x: 0
            y: root.leftBottomRound ? root.height - root.radius : root.height
            radiusX: root.leftBottomRound ? root.radius : 0
            radiusY: root.leftBottomRound ? root.radius : 0
        }

        PathLine {
            x: 0
            y: root.leftTopRound ? root.radius : 0
        }

        PathArc {
            x: root.leftTopRound ? root.radius : 0
            y: 0
            radiusX: root.leftTopRound ? root.radius : 0
            radiusY: root.leftTopRound ? root.radius : 0
        }
    }
}
