import QtQuick 2.9

MouseArea {
    id: moveArea

    property int lastX: 0
    property int lastY: 0
    property var control: parent    // Export a control attribute to specify the target to be dragged.
                                    // By default, parent is used. Note that the target must have
                                    // x and y attributes and can be modified.

    signal move(real xOffset, real yOffset)

    onContainsPressChanged: {
        if (containsPress) {
            cursorShape = Qt.SizeAllCursor
            lastX = mouseX
            lastY = mouseY
        } else {
            cursorShape = Qt.ArrowCursor
        }
    }

    onPositionChanged: {
        if (pressed && control) {
            if ((mouseX - lastX) !== 0 || (mouseY - lastY) !== 0)
                moveArea.move(mouseX - lastX, mouseY - lastY)
        }
    }
}
