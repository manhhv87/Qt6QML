import QtQuick

Window {
    id: rootId
    width: 640
    height: 480
    visible: true
    title: qsTr("QML Syntax Demo")

    // Define a custom property. Its type is string and the value is "hello"
    property string textToShow: "hello"

    Row {
        id: row1
        anchors.centerIn: parent    // The Row element will be centered in its parent,the Window in this case.
        spacing: 20                 // Add a spacing of 20 between the elements in our Row

        Rectangle {
            id: redRectId
            width: 100
            height: 100
            color: "red"
            radius: 20      // Make the borders of the rectangle round

            MouseArea {
                anchors.fill: parent    // Use anchors to make the MouseArea fill the Rectangle
                onClicked: {
                    console.log("Clicked on the red rectangle")
                    rootId.textToShow = "red"
                }
            }
        }

        Rectangle {
            id: greenRectId
            width: 100
            height: 100
            color: "green"
            radius: 20

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Clicked on the green rectangle")
                    rootId.textToShow = "green"
                }
            }
        }

        Rectangle {
            id: blueRectId
            width: 100
            height: 100
            color: "blue"
            radius: 20

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Clicked on the blue rectangle")
                    rootId.textToShow = "blue"
                }
            }
        }

        Rectangle {
            id: textRectId
            width: 100
            height: 100
            color: "dodgerblue"
            radius: 50

            Text {
                id: textId
                anchors.centerIn: parent

                // Property binding: We're bounding the value of the text property to the
                text: rootId.textToShow
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Clicked on the dodgerblue circle")

                    // Break the binding by assigning a static value to textId.text
                    textId.text = "broken"
                }
            }
        }
    }
}
