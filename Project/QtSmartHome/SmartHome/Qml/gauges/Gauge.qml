import QtQuick 2.15

/**
This file defines a gauge. The overlay of the gauge can be switched off. The
origin of the needle can be set.

property string backgroundImage:    The background image of the gauge.
property string needleImage:        The image of the needle.
property string needleShadowImage:  The image of the needles' shadow.
property string overlayImage:       The image of the overlay.
property bool showOverlay:          Flag to set the visibility of the overlay.
property int value:                 The current value of the gauge.
property real originFactorX:        Value to offset the needles' offset in x-direction.
property real originFactorY:        Value to offset the needles' offset in y-direction.
property real needleScale:          Value of the scale of the needle.
*/

Item {
    id: rootId

    property string backgroundImage
    property string needleImage
    property string needleShadowImage
    property string overlayImage
    property bool showOverlay: true
    property int value: 0
    property real originFactorX: 0.0
    property real originFactorY: 0.0
    property real needleScale: 1.0

    Image {
        id: background
        source: rootId.backgroundImage
        smooth: true
        width: parent.width
        height: parent.height
        sourceSize.width: width
        sourceSize.height: height

        Image {
            id: needle
            source: rootId.needleImage
            width: background.width
            height: background.height
            sourceSize.width: background.width
            sourceSize.height: background.height
            smooth: true
            scale: rootId.needleScale
            z: 2
            transform: Rotation {
                origin.x: background.width * rootId.originFactorX
                origin.y: background.height * rootId.originFactorY
                angle: rootId.value
            }
        }

        Image {
            id: needleShadow
            source: rootId.needleShadowImage
            width: background.width
            height: background.height
            sourceSize.width: background.width
            sourceSize.height: background.height
            smooth: true
            scale: rootId.needleScale
            z: 1
            transform: Rotation {
                origin.x: background.width * rootId.originFactorX
                origin.y: background.height * rootId.originFactorY
                angle: rootId.value
            }
        }

        Image {
            id: overlay
            source: rootId.overlayImage
            width: background.width
            height: background.height
            sourceSize.width: background.width
            sourceSize.height: background.height
            smooth: true
            z: 3
            visible: rootId.showOverlay
        }
    }
}
