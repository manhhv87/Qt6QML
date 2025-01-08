import QtQuick

import Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    CusButton_Blue {
        width: 120
        height: 35
        anchors.centerIn: parent
        text: "Hello"

        onClicked: {
            console.log("Hello custom components")
        }
    }
}
