import QtQuick 2.15

/**
* This new custom Text item called SHText (SmartHomeText).It provides for
* all instances some default settings as a common font, color and alignment
* This is QML style subclassing.
*/

Text {
    font.family: "Arial"
    font.bold: true
    smooth: true
    color: "white"
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    Component.onCompleted: {
        font.pointSize = font.pointSize * 0.8
    }
}
