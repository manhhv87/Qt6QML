import QtQuick 2.10
import QtQuick.Controls 2.5
import QtQuick.Shapes 1.10
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
        fillColor: color
        startX: leftTopRound ? radius : 0
        startY: 0

        // fillRule: ShapePath.WindingFill
        PathLine {
            x: rightTopRound ? root.width - radius : root.width
            y: 0
        }

        PathArc {
            x: root.width
            y: rightTopRound ? radius : 0
            radiusX: rightTopRound ? radius : 0
            radiusY: rightTopRound ? radius : 0
        }

        PathLine {
            x: root.width
            y: rightBottomRound ? root.height - radius : root.height
        }

        PathArc {
            x: rightBottomRound ? root.width - radius : root.width
            y: root.height
            radiusX: rightBottomRound ? radius : 0
            radiusY: rightBottomRound ? radius : 0
        }

        PathLine {
            x: leftBottomRound ? radius : 0
            y: root.height
        }

        PathArc {
            x: 0
            y: leftBottomRound ? root.height - radius : root.height
            radiusX: leftBottomRound ? radius : 0
            radiusY: leftBottomRound ? radius : 0
        }

        PathLine {
            x: 0
            y: leftTopRound ? radius : 0
        }

        PathArc {
            x: leftTopRound ? radius : 0
            y: 0
            radiusX: leftTopRound ? radius : 0
            radiusY: leftTopRound ? radius : 0
        }
    }
}
