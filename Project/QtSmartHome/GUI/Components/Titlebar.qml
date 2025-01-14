import QtQuick 2.15

/**
 * The titleBar shows the date, time, label and the god button
 * The god button leads to weather god control
 */
Image {
    id:titleBar

    property alias titleBarText: titleBarText.text
    property alias titleHomeButton: homeButton
    property alias dateAndTime: dateText.text
    property bool godMode: godIcon.godAwareness

    signal homePressed();

    source: "qrc:/Images/screenelements/titlebar.png"

    Image {
        id:qtLogo
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        source: "qrc:/Images/logos/qt-logo-small.png"
    }

    BorderImage {
        id: dateImage
        source: "qrc:/Images/screenelements/text.svg"
        width: dateText.width + 40; height: parent.height - 16
        anchors.left: qtLogo.right
        anchors.verticalCenter: parent.verticalCenter
        border { left: 25; right: 25; top: 16; bottom: 16 }
        horizontalTileMode: BorderImage.Repeat
        verticalTileMode: BorderImage.Repeat

        SHText {
            id: dateText
            anchors.centerIn: parent
            color: "white"
            font {
                pointSize: titleBar.width > 840 ? 14 : 11
            }
        }
    }

    BorderImage {
        id: borderGod
        source: "qrc:/Images/screenelements/text.svg"
        width: parent.height
        height: parent.height - 16
        anchors.left: dateImage.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 20
        border { left: 25; right: 25; top: 16; bottom: 16 }
        horizontalTileMode: BorderImage.Repeat
        verticalTileMode: BorderImage.Repeat

        Image {
            id: godIcon

            property bool godAwareness: false
            source: godAwareness ? "qrc:/Images/screenelements/close_weathergod.svg" : "qrc:/Images/screenelements/open_weathergod.svg"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }

        MouseArea {
            anchors.fill: parent

            onPressed: {
                godIcon.godAwareness = !godIcon.godAwareness
            }
        }
    }

    SHText {
        id: titleBarText
        //anchors.horizontalCenter: parent.horizontalCenter
        anchors.left: borderGod.right
        anchors.leftMargin: 8
        anchors.verticalCenter: parent.verticalCenter
        color: "white"
        font { pointSize: 21; bold: true }
    }

    BorderImage {
        id: homeButton
        source: "qrc:/Images/screenelements/text.svg"
        width: parent.height
        height: parent.height - 16
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 4
        border { left: 25; right: 25; top: 16; bottom: 16 }
        horizontalTileMode: BorderImage.Repeat
        verticalTileMode: BorderImage.Repeat

        Image {
            id: homeIcon

            property bool homePressed: false

            anchors.centerIn:parent

            source: "qrc:/Images/screenelements/home.svg"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }

        MouseArea {
            anchors.fill: parent

            onPressed: {
                homeIcon.homePressed = true
            }

            onReleased: {
                titleBar.homePressed();
                homeIcon.homePressed = false
            }
        }
    }
}
