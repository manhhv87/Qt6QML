import QtQuick 2.9

Item {
    id: root
    // controller The target to control the size can be Item or view,
    // just provide the modification of x, y, width, height and other attributes
    // The default value is parent
    property var control: parent
    property int borderWidth: 12

    // Drag the upper left corner
    CusDragItem {
        id: leftTopHandle
        posType: posLeftTop
        width: borderWidth
        height: borderWidth

        onPosChange: {
            // Don't simplify this judgment condition, it will be difficult to understand
            // after simplification. The Qml engine will automatically simplify it
            if (control.x + xOffset < control.x + control.width)
                control.x += xOffset;
            if (control.y + yOffset < control.y + control.height)
                control.y += yOffset;
            if (control.width - xOffset > 0)
                control.width-= xOffset;
            if (control.height -yOffset > 0)
                control.height -= yOffset;
        }
    }

    // Drag the upper right corner
    CusDragItem {
        id: rightTopHandle
        posType: posRightTop
        x: parent.width - width
        width: borderWidth
        height: borderWidth

        onPosChange: {
            // When dragging to the left, xOffset is negative
            if (control.width + xOffset > 0)
                control.width += xOffset;

            if (control.height - yOffset > 0)
                control.height -= yOffset;

            if (control.y + yOffset < control.y + control.height)
                control.y += yOffset;
        }
    }

    // Drag the lower left corner
    CusDragItem {
        id: leftBottomHandle
        posType: posLeftBottom
        y: parent.height - height
        width: borderWidth
        height: borderWidth

        onPosChange: {
            if (control.x + xOffset < control.x + control.width)
                control.x += xOffset;

            if (control.width - xOffset > 0)
                control.width-= xOffset;

            if (control.height + yOffset > 0)
                control.height += yOffset;
        }
    }

    // Drag the lower right corner
    CusDragItem {
        id: rightBottomHandle
        posType: posRightBottom
        x: parent.width - width
        y: parent.height - height
        width: borderWidth
        height: borderWidth

        onPosChange: {
            if (control.width + xOffset > 0)
                control.width += xOffset;

            if (control.height + yOffset > 0)
                control.height += yOffset;
        }
    }

    // Drag up
    CusDragItem {
        posType: posTop
        width: parent.width - leftTopHandle.width - rightTopHandle.width
        height: borderWidth
        x: leftBottomHandle.width

        onPosChange: {
            if (control.y + yOffset < control.y + control.height)
                control.y += yOffset;
            if (control.height - yOffset > 0)
                control.height -= yOffset;
        }
    }

    // Drag left
    CusDragItem {
        posType: posLeft
        height: parent.height - leftTopHandle.height - leftBottomHandle.height
        width: borderWidth
        y: leftTopHandle.height

        onPosChange: {
            if (control.x + xOffset < control.x + control.width)
                control.x += xOffset;

            if (control.width - xOffset > 0)
                control.width-= xOffset;
        }
    }

    // Drag right
    CusDragItem {
        posType: posRight
        x: parent.width - width
        height: parent.height - rightTopHandle.height - rightBottomHandle.height
        width: borderWidth
        y: rightTopHandle.height

        onPosChange: {
            if (control.width + xOffset > 0)
                control.width += xOffset;
        }
    }

    // Drag down
    CusDragItem {
        posType: posBottom
        x: leftBottomHandle.width
        y: parent.height - height
        width: parent.width - leftBottomHandle.width - rightBottomHandle.width
        height: borderWidth

        onPosChange: {
            if (control.height + yOffset > 0)
                control.height += yOffset;
        }
    }
}
