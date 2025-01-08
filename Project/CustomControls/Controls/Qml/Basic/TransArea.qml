import QtQuick 2.9
import QtQuick.Controls 2.2

// Mouse event transparent transmission
MouseArea {
    anchors.fill: parent
    hoverEnabled: true
    // propagateComposedEvents: true

    // Mouse icon, this icon is displayed when hovered or pressed
    cursorShape: Qt.PointingHandCursor
    onDoubleClicked: { mouse.accepted = false;}
    onPositionChanged: { mouse.accepted = false;}
    onPressed: { mouse.accepted = false; }
    onPressAndHold: { mouse.accepted = false; }
    onClicked: { mouse.accepted = false;}
    onReleased: { mouse.accepted = false;}
    onWheel: { wheel.accepted = false; }
}
