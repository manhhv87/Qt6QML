import QtQuick 2.15
import SmartHome 1.0

/**
This file defines the medication controls. The medication control field
contains a dial gauge (implemented as a c++-plugin) and a number field
displaying the current value. If the controls are clicked a popup-window opens
where the value can actually can be set. Changing the value is done with a
scrollwheel.

property bool popupWindowOpen           Property used internally for the popup window.
property int value                      The value that is currently set.
property string backgroundHoverImage    The image for the background when hovered.
property string backgroundImage         The normal image for the background.
property string numberFieldImage        The image for the number field.
property string popupBackgroundImage    The image of the background of the popup window.
property string closeButtonHoveredImage The image of the close button when hovered.
property string closeButtonImage        The normal image of the close button.
property string closeButtonPressedImage The image of the close button when pressed.
*/

Item {
    id: rootId

    property bool popupWindowOpen: false
    property int value: 60
    property string backgroundHoverImage: "qrc:/SmartHome/Images/scrolldial/Beryl/background_hover.svg"
    property string backgroundImage: "qrc:/SmartHome/Images/scrolldial/Beryl/background.svg"
    property string numberFieldImage: "qrc:/SmartHome/Images/scrolldial/Beryl/label.svg"
    property string popupBackgroundImage: "qrc:/SmartHome/Images/scrolldial/Beryl/popup_background.svg"
    property string closeButtonHoveredImage: "qrc:/SmartHome/Images/scrolldial/Beryl/closebutton_hovered.svg"
    property string closeButtonImage: "qrc:/SmartHome/Images/scrolldial/Beryl/closebutton_normal.svg"
    property string closeButtonPressedImage: "qrc:/SmartHome/Images/scrolldial/Beryl/closebutton_pressed.svg"

    Image {
        id: background

        property bool hover: false

        width: 68
        height: 88
        source: hover ? rootId.backgroundHoverImage : rootId.backgroundImage

        MouseArea {
            anchors.centerIn: background
            width: background.width + 20
            height: background.height + 20

            hoverEnabled: true
            onEntered: {
                background.hover = true
            }
            onExited: {
                background.hover = false
            }
            onClicked: {
                rootId.popupWindowOpen = !rootId.popupWindowOpen
                background.state = rootId.popupWindowOpen ? "clicked" : ""
            }
        }

        states: [
            State {
                name: "clicked"
                PropertyChanges {
                    target: background
                    source: backgroundHoverImage
                }
            }
        ]

        Image {
            id: numberField
            width: 35
            height: 20
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            source: rootId.numberFieldImage

            Text {
                id: numberFieldText
                anchors.fill: parent
                anchors.top: parent.top
                anchors.topMargin: 2
                color: "white"
                anchors.left: parent.left
                horizontalAlignment: Text.AlignHCenter
                text: rootId.value
            }
        }

        BasicGauge {
            id: dialGauge
            width: 50
            height: 50
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 8
            value: 60
        }
    }

    // the popup window is defined here. Its opacity is animated to make
    // it fade in/out when opened/closed.
    Item {
        id: popupWindow

        Image {
            id: popupWindowBackground
            anchors.left: parent.left
            anchors.leftMargin: 91
            anchors.top: parent.top
            anchors.topMargin: 10
            width: 91
            height: 320
            sourceSize.height: 280
            sourceSize.width: 100
            smooth: true
            opacity: rootId.popupWindowOpen ? 1 : 0
            source: rootId.popupBackgroundImage

            Behavior on opacity {
                NumberAnimation {
                    duration: 500
                }
            }

            // the actual dial gauge is implemented as a c++-plugin
            BasicGauge {
                id: popupWindowDialGauge
                value: wheel.value
                width: 60
                height: 60
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 12
            }

            Image {
                id: popupWindowCloseButton

                property bool hover: false

                width: 50
                height: 50
                sourceSize.height: height
                sourceSize.width: width
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: parent.width/2
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: -parent.height/2
                smooth: true
                source: hover ? rootId.closeButtonHoveredImage : rootId.closeButtonImage

                states: [
                    State {
                        name: "clicked"
                        PropertyChanges {
                            target: rootId.popupWindowCloseButton
                            source: rootId.closeButtonPressedImage
                        }
                    }
                ]

                MouseArea {
                    width: popupWindowCloseButton.width
                    height: popupWindowCloseButton.height
                    hoverEnabled: true
                    onEntered: {
                        popupWindowCloseButton.hover = true
                    }
                    onExited: {
                        popupWindowCloseButton.hover = false
                        popupWindowCloseButton.state = ""
                    }
                    onPressed: {
                        popupWindowCloseButton.state = "clicked"
                    }
                    onReleased: {
                        popupWindowCloseButton.state = ""
                        rootId.popupWindowOpen = false
                        background.state = ""
                        dialGauge.value = wheel.value
                        numberFieldText.text = wheel.value
                        value = dialGauge.value
                    }
                }
            }

            Image {
                id: popupNumberField
                width: 40
                height: 26
                anchors.horizontalCenter: popupWindowDialGauge.horizontalCenter
                anchors.top: popupWindowDialGauge.bottom
                source: rootId.numberFieldImage

                Text {
                    id: popupNumberInField
                    anchors.fill: parent
                    anchors.top: parent.top
                    anchors.topMargin: 3
                    width: 40
                    height: 26
                    color: "white"
                    anchors.left: parent.left
                    horizontalAlignment: Text.AlignHCenter
                    font.pointSize: 12
                    text: wheel.value
                }
            }

            // this scrollwheel is used to set the value
            ScrollWheel {
                id: wheel
                anchors.top: popupNumberField.bottom
                anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                width: 80
                height: 200
            }
        }
    }
}
