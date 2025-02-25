import QtQuick 2.9
import Qt5Compat.GraphicalEffects

Item {
    property alias source: srcImg.source
    property alias color: overlayImg.color

    Image {
        id: srcImg
        anchors.fill: parent
        visible: false
    }

    ColorOverlay {
        id: overlayImg
        source: srcImg
        anchors.fill: srcImg
        width: srcImg.width
        height: srcImg.height

    }
}
