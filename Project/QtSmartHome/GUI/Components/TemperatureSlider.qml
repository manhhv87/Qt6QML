import QtQuick 2.15

/**
* This TemperatureSlider is a custom item for temperature settings.
* The TemperatureSlider has per default one user temperature and one current temperature.
* A second user temperature is invisible per default.
*/
Rectangle {
    id: temperatureSlider

    property real firstTemperature: 0
    property real secondTemperature: 0
    property real actualTemperature: 21
    property alias handleIconSource: handleIcon.source
    property alias secondHandleVisible: secondHandle.visible
    property alias secondHandleIconSource: secondHandleIcon.source

    width: background.width+20
    height: background.height+3
    color: "transparent"

    /**
    * This item encapsulate a value that should not be changed unwise.
    */
    Item {
        id: privateItem

        property real valuePerPixel: scaleLeft.height / ((scaleLeft.scaleModel.length - 1)  * scaleLeft.lineCount)
        property int lowestDegree: parseInt(scaleLeft.scaleModel[0])
    }
    Item {
        id: mainItem

        anchors {
            top: temperatureSlider.top
            topMargin: 30
        }

        /**
        * Draws the background without filling
        */
        Image {
            id: background
            smooth: true
            source: "qrc:/Images/temperature/temperature_background.svg"
            height:  280

            TemperatureScale {
                id: scaleLeft
                anchors.top: parent.top
                anchors.topMargin: 31
                height: 170
                anchors.left: parent.left
                anchors.leftMargin: 4
            }

            TemperatureScale {
                id: scaleRight
                height: 170
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 73
                anchors.right: parent.right
                anchors.rightMargin: 7
                enableText: false
                transform: Rotation {
                    origin.x: scaleRight.width/2
                    origin.y: scaleRight.height/2
                    angle: 180
                }
            }
        }
        /**
        * Draws the filling
        */
        Image {
            id: fill
            anchors.top:  background.top
            source: "qrc:/Images/temperature/temperature_fill.svg"
            height:  280
        }
        /**
        * A nice reflex is overlayed
        */
        Image {
            id: reflex
            anchors.top:  background.top
            source: "qrc:/Images/temperature/temperature_reflex.svg"
            height:  280
        }

        /**
        * This Image item draws the second handle that can be dragged
        */
        property int handleSpacing: 18

        Image {
            id: secondHandle
            x: background.width - handle.width + mainItem.handleSpacing
            source: "qrc:/Images/temperature/handle.png"
            visible: false

            Image {
                id: secondHandleIcon
                x: mainItem.handleSpacing
                y: 2
                width: parent.height-4
                height: parent.height-4
            }

            MouseArea {
                enabled: visible ? true : false
                anchors.centerIn: parent
                height: parent.height-2
                width:  parent.width -2
                drag { target: parent; axis: Drag.YAxis; minimumY: 18; maximumY: 195 }

                onPositionChanged: {
                    secondTemperature = ((drag.maximumY - parent.y) / privateItem.valuePerPixel) + privateItem.lowestDegree
                }
            }
        }

        /**
        * This Image item draws the handle that can be dragged
        */
        Image {
            id: handle

            x: background.width - handle.width + mainItem.handleSpacing
            source: "qrc:/Images/temperature/handle.png"

            Image {
                id: handleIcon
                x: mainItem.handleSpacing
                y: 2
                width: parent.height-4
                height: parent.height-4
            }

            MouseArea {
                id: handleMouseArea

                anchors.centerIn: handle
                height: parent.height-2
                width:  parent.width -2

                drag { target: parent; axis: Drag.YAxis; minimumY: 18; maximumY: 195 }

                onPositionChanged: {
                    firstTemperature = ((drag.maximumY - parent.y) / privateItem.valuePerPixel) + privateItem.lowestDegree
                    if( !secondHandle.visible )
                        fill.y = ((firstTemperature - privateItem.lowestDegree) * privateItem.valuePerPixel - drag.maximumY + privateItem.lowestDegree) * -1
                }
            }
        }

        Rectangle {
            id: needle
            width: parent.width
            height: 2
            color: Qt.rgba( 0.3,0.3,0.3,0.5 )
        }
    }

    // some values has to be initialized after the component is loaded
    Component.onCompleted: {
        handle.y = ((firstTemperature - privateItem.lowestDegree) * privateItem.valuePerPixel - handleMouseArea.drag.maximumY) * -1
        secondHandle.y = ((secondTemperature - privateItem.lowestDegree) * privateItem.valuePerPixel - handleMouseArea.drag.maximumY) * -1
        firstTemperature = ((handleMouseArea.drag.maximumY - handle.y) / privateItem.valuePerPixel) + privateItem.lowestDegree
        if( !secondHandle.visible )
            fill.y = ((firstTemperature - privateItem.lowestDegree) * privateItem.valuePerPixel - handleMouseArea.drag.maximumY + privateItem.lowestDegree) * -1
    }

    // the needle is moved along the y axis when the current temp is changed
    onActualTemperatureChanged: {
        needle.y = ((actualTemperature - privateItem.lowestDegree) * privateItem.valuePerPixel - handleMouseArea.drag.maximumY + privateItem.lowestDegree) * -1
    }
}
