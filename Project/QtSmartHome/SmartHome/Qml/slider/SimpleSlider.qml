import QtQuick 2.15

/**
A simple slider. The fillbar changes with the slider. The outer image
simply clips the image of the fillbar, so the y-coordinate of the
fillbar can be bound to the y-coordinate of the slider.

property int value:              Value to set the current value of the slider.
property string backgroundImage: The image of the background of the slider.
property string fillingBarImage: The image of the filling bar of the slider.
*/
Image {
    id: rootId

    property int value: 0
    property string backgroundImage: "qrc:/SmartHome/Images/multislider/Beryl/valuebar.svg"
    property string fillingBarImage: "qrc:/SmartHome/Images/multislider/Beryl/valuebar_filled.svg"

    sourceSize.width: rootId.width
    sourceSize.height: rootId.height
    smooth: true
    clip: true
    source: backgroundImage

    Image {
        id: fillingBar
        width: parent.width
        height: rootId.height
        sourceSize.height: fillingBar.height
        sourceSize.width: fillingBar.width
        source: rootId.fillingBarImage
        anchors.top: slider.bottom
        anchors.topMargin: -1
        anchors.left: slider.left
    }


    Rectangle {
        id: slider
        y: rootId.value
        width: parent.width - 2
        height: 32
        anchors.horizontalCenter: parent.horizontalCenter
        border.width: 2
        border.color: "#709E10"
        smooth: true
        radius: 2
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#cccccc"
            }

            GradientStop {
                position: 0.5
                color: "#818181"
            }

            GradientStop {
                position: 1
                color: "#d3d3d3"
            }
        }

        MouseArea {
            anchors.fill: parent
            anchors.horizontalCenter: parent.horizontalCenter
            drag.target: parent
            drag.axis: Drag.YAxis
            drag.minimumY: 2
            drag.maximumY: rootId.height - slider.height - 2

            onPressed: {
                slider.border.color = "#D5EC00"
            }
            onReleased: {
                slider.border.color = "#709E10"
            }
        }
    }
}
