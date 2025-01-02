import QtQuick

Window {
    id: rootId
    width: 640
    height: 480
    visible: true
    title: qsTr("Qt Global Object Demo")

    property var fonts: Qt.fontFamilies()

    Rectangle {
        width: 300
        height: 100
        color: "red"
        anchors.centerIn: parent

        MouseArea {
            anchors.fill: parent
            onClicked: {
                // // Quit the application
                // console.log("Quitting the App")
                // Qt.quit()

                // // List the available fonts
                // for(var i=0; i<rootId.fonts.length; i++) {
                //     console.log("[" + i + "]: " + fonts[i])
                // }

                // // Hash a string
                // var mName = "Daniel Gakwaya"
                // var mNameHash = Qt.md5(mName)
                // console.log("The hash of the name is: " + mNameHash)

                // // Open url externally
                // Qt.openUrlExternally("https://www.learnqt.guide/udemy-discounted-9/")

                // // Open local files with the default program
                // Qt.openUrlExternally("file:///D:/MySelft/Learning Videos/Qt C++/Qt6/Qt6 QML For Beginners.pdf")

                // Capture platform info
                console.log("The current platform is: " + Qt.platform.os)
            }
        }
    }
}
