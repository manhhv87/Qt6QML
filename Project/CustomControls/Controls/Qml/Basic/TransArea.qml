import QtQuick 2.15

// Mouse event transparent transmission
MouseArea {
    anchors.fill: parent
    hoverEnabled: true
    // propagateComposedEvents: true

    // Mouse icon, this icon is displayed when hovered or pressed
    cursorShape: Qt.PointingHandCursor
    onDoubleClicked: (mouse)=> { mouse.accepted = false;}
    onPositionChanged: (mouse)=> { mouse.accepted = false;}
    onPressed: (mouse)=> { mouse.accepted = false; }
    onPressAndHold: (mouse)=> { mouse.accepted = false; }
    onClicked: (mouse)=> { mouse.accepted = false;}
    onReleased: (mouse)=> { mouse.accepted = false;}
    onWheel: (wheel)=> { wheel.accepted = false; }
}
