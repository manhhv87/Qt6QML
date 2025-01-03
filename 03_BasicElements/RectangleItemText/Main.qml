import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("QML Basic Elements Demo")

    Item {
        id: containerItemId
        x: 50; y: 50
        width: 400; height: 200

        Rectangle {
            anchors.fill: parent
            color: "beige"

            // // Grouped Properties Syntax Variation #1
            // border.width: 5
            // border.color: "black"

            // // Grouped Properties Syntax Variation #2
            // border {
            //     color: "black"
            //     width: 5
            // }

            // Grouped Property Syntax Variation #3
            border {
                color: "black"; width: 5
            }
        }

        Rectangle {
            x: 0; y: 10
            width: 50; height: 50
            color: "red"
        }

        Rectangle {
            x: 60; y: 10
            width: 50; height: 50
            color: "green"
        }

        // Add the Text element below
        Text {
            id: mTextId
            x: 100; y: 100
            color: "red"
            text: "Hello World!"
            font {
                family: "Helvetica"
                pointSize: 13
                bold: true
            }
        }
    }
}
