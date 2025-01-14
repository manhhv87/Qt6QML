import QtQuick 2.15

/**
This file defines a simple slider. Since only seems to support horizontal
gradients the background of the slider is a slightly rotated rectangle
with a gradient that is clipped by a rectangle defining the actual slider
box.

property int value:      The value that the slider currently has.
property int lowerLimit: The lower limit of the slider.
property int upperLimit: The upper limit of the slider.
*/

Rectangle {
    id: rootId

    property int value: 0
    property int lowerLimit: 0
    property int upperLimit: 0

    id: background
    color: "transparent"
    smooth: true
    radius: 2
    border.width: 2
    border.color: "#b4b4b4"

    // workaround to have non-horizontal/non-vertical gradients:
    // define a item that clips a rectangle that is rotated
    Item {
        width: parent.width - 2
        height: parent.height - 2
        anchors.centerIn: parent
        clip: true

        Rectangle {
            x: -61
            y: -44
            width: 254
            height: 93
            rotation: -11
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#ffffff"
                }

                GradientStop {
                    position: 1
                    color: "#000000"
                }
            }
        }
    }

    Rectangle {
        id: button
        x: 6
        height: 26
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#cccccc"
            }

            GradientStop {
                position: 0.4
                color: "#818181"
            }

            GradientStop {
                position: 1
                color: "#d3d3d3"
            }
        }
        width: 18
        smooth: true
        border.width: 2
        border.color: "#4B4B4B"
        anchors.verticalCenter: parent.verticalCenter
        rotation: 90

        MouseArea {
            anchors.fill: parent
            drag.target: parent
            drag.axis: Drag.XAxis
            drag.minimumX: 6
            drag.maximumX: background.width - button.width - 6

            onPressed: {
                button.border.color = "#b4b4b4"
            }
            onReleased: {
                button.border.color = "#4B4B4B"
            }
            onPositionChanged: {
                value = lowerLimit + ((parent.x - 6) / (drag.maximumX - drag.minimumX)) * (Math.abs(upperLimit) + Math.abs(lowerLimit))
            }
        }
    }
}
