import QtQuick 2.15

/**
This file defines the multislider widget. It provides a fill bar that shows the
value currently set. The fill bar basically is a svg-image whose y-coordinate
is manipulated to make the bar larger/smaller. This functionality is provided
by a c++-plugin that modifies the image accordingly.Two sliders are used to
define an interval in which the fill bar has to be.

property int upperLimit                 The upper limit of the multislider.
property int lowerLimit                 The lower limit of the multislider.
property int sliderMinValue             The value of the lower slider.
property int sliderMaxValue             The value of the upper slider.
property int setValue                   The current value of the filling bar.
property alias fillTopImage             The image for the top of the filling bar.
property alias fillBottomImage          The image for the bottom of the filling bar.
property alias fillBackgroundImage      The image for the background of the filling bar.
property alias fillImage                The image of the actual filling bar.
property alias sliderBackground         The image for the slider background.
property string sliderMaxHoveredImage   The upper sliders' image when hovered.
property string sliderMaxPressedImage   The upper sliders' image when pressed.
property string sliderMaxImage          The upper sliders' normal image.
property string sliderMinHoveredImage   The lower sliders' image when hovered.
property string sliderMinPressedImage   The lower sliders' image when pressed.
property string sliderMinImage          The lower sliders' normal image.
*/

Item {
    id: rootId

    property int upperLimit: 0
    property int lowerLimit: 0
    property int sliderMinValue: 0
    property int sliderMaxValue: 0
    property int setValue: 0
    property alias fillTopImage:  dripRateValueBarTop.source
    property alias fillBottomImage:  dripRateValueBarBottom.source
    property alias fillBackgroundImage:  dripRateValueBarCenter.source
    property alias fillImage: fillingState.source
    property alias sliderBackground: background.source
    property string sliderMaxHoveredImage: "qrc:/SmartHome/Images/multislider/Beryl/slider_max_hovered.svg"
    property string sliderMaxPressedImage: "qrc:/SmartHome/Images/multislider/Beryl/slider_max_pressed.svg"
    property string sliderMaxImage: "qrc:/SmartHome/Images/multislider/Beryl/slider_max.svg"
    property string sliderMinHoveredImage: "qrc:/SmartHome/Images/multislider/Beryl/slider_min_hovered.svg"
    property string sliderMinPressedImage: "qrc:/SmartHome/Images/multislider/Beryl/slider_min_pressed.svg"
    property string sliderMinImage: "qrc:/SmartHome/Images/multislider/Beryl/slider_min.svg"

    Row {
        id: row

        property int rightSpacing: 15

        anchors.fill: parent
        spacing: parent.width - dripRateValueBar.width - background.width - rightSpacing

        Item {
            id: dripRateValueBar
            width: 20
            anchors.top: parent.top
            anchors.bottom: parent.bottom

            Image {
                id: dripRateValueBarCenter
                anchors.fill: parent
                smooth: true
                source: "qrc:/SmartHome/Images/multislider/Beryl/valuebar.svg"
            }

            Image {
                id: dripRateValueBarTop
                anchors.top: parent.top
                width: parent.width
                height: 13
                smooth: true
                source: "qrc:/SmartHome/Images/multislider/Beryl/valuebar_top.svg"
            }

            Image {
                id: dripRateValueBarBottom
                anchors.bottom: parent.bottom
                width: parent.width
                height: 13
                smooth: true
                source: "qrc:/SmartHome/Images/multislider/Beryl/valuebar_bottom.svg"
            }

            Image {
                id: fillingState
                y: (sliderMaxMouseArea.deltaY - (rootId.setValue / rootId.upperLimit) * sliderMaxMouseArea.deltaY - sliderMaxMouseArea.imageOffset)
                height: dripRateValueBarBottom.y - y
                width: parent.width
                source: "qrc:/SmartHome/Images/multislider/Beryl/valuebar_filled.svg"
            }
        }

        Image {
            id: background
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            width: 16
            smooth: true
            source: "qrc:/SmartHome/Images/multislider/Beryl/groove.svg"

            // this image defines the upper slider
            Image {
                id: sliderMax

                property bool hover: false

                y: sliderMaxMouseArea.baseMaxY - (rootId.sliderMaxValue / rootId.upperLimit * (sliderMaxMouseArea.baseMaxY - sliderMaxMouseArea.drag.minimumY))
                width: 45
                height: 28
                sourceSize.height: height
                sourceSize.width: width
                anchors.horizontalCenterOffset: -3
                anchors.horizontalCenter: background.horizontalCenter
                smooth: true
                source: hover ? rootId.sliderMaxHoveredImage : rootId.sliderMaxImage

                states: [
                    State {
                        name: "clicked"
                        PropertyChanges {
                            target: sliderMax
                            source: sliderMaxPressedImage
                        }
                    }
                ]

                MouseArea {
                    id: sliderMaxMouseArea

                    property int imageOffset: 4 // there is an offset in the image to the bottom line
                    property int offset: 7      // there is an offset in the image to the bottom line
                    property int maxY: sliderMin.y - sliderMin.height + imageOffset
                    property int baseMaxY: background.height - sliderMax.height - offset
                    property int baseMinY: - (sliderMax.height - dripRateValueBarTop.height)
                    property int deltaY: baseMaxY - baseMinY

                    anchors.fill: parent
                    hoverEnabled: true
                    drag.axis: Drag.YAxis
                    drag.target: parent
                    drag.minimumY: baseMinY
                    drag.maximumY: maxY

                    onEntered: {
                        sliderMax.hover = true
                    }
                    onExited: {
                        sliderMax.hover = false
                        sliderMax.state = ""
                    }
                    onPressed: {
                        sliderMax.state = "clicked"
                    }
                    onReleased: {
                        sliderMax.state = ""
                    }
                    onPositionChanged: {
                        rootId.sliderMaxValue = (baseMaxY - parent.y) / (baseMaxY - drag.minimumY) * rootId.upperLimit
                    }
                }
            }

            // this image defines the lower slider
            Image {
                id: sliderMin

                property bool hover: false

                y: sliderMinMouseArea.baseMaxY - (rootId.sliderMinValue / rootId.upperLimit * (sliderMinMouseArea.baseMaxY - sliderMinMouseArea.baseMinY))
                width: 45
                height: 28
                sourceSize.height: height
                sourceSize.width: width
                anchors.horizontalCenterOffset: -2
                anchors.horizontalCenter: background.horizontalCenter
                smooth: true
                source: hover ? rootId.sliderMinHoveredImage : rootId.sliderMinImage

                states: [
                    State {
                        name: "clicked"
                        PropertyChanges {
                            target: sliderMin
                            source: sliderMinPressedImage
                        }
                    }
                ]

                MouseArea {
                    id: sliderMinMouseArea

                    property int imageOffset: 4 // there is an offset in the image to the top line
                    property int offset: 9      // there is an offset in the image to the top line
                    property int minY: sliderMax.y + sliderMax.height - imageOffset
                    property int baseMinY: offset
                    property int baseMaxY: background.height -  sliderMin.height + dripRateValueBarTop.height
                    property int deltaY: baseMaxY - baseMinY

                    anchors.fill: parent
                    hoverEnabled: true
                    drag.axis: Drag.YAxis
                    drag.target: parent
                    drag.minimumY: minY
                    drag.maximumY: baseMaxY

                    onEntered: {
                        sliderMin.hover = true
                    }
                    onExited: {
                        sliderMin.hover = false
                        sliderMin.state = ""
                    }
                    onPressed: {
                        sliderMin.state = "clicked"
                    }
                    onReleased: {
                        sliderMin.state = ""
                    }
                    onPositionChanged: {
                        rootId.sliderMinValue = (baseMaxY - parent.y)/(baseMaxY - baseMinY) * rootId.upperLimit
                    }
                }
            }
        }
    }

}
