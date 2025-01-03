import QtQuick

Window {
    id: rootId
    width: 640
    height: 480
    visible: true
    title: qsTr("Properties and Handlers Demo")

    property string firstName: "Daniel"

    onFirstNameChanged: {
        console.log("The firstname changed to: " + firstName)
    }

    onTitleChanged: {
        console.log("The new title is: " + rootId.title)
    }

    Rectangle {
        width: 300;
        height: 100
        color: "greenyellow"
        anchors.centerIn: parent

        MouseArea{
            anchors.fill: parent
            onClicked: {
                rootId.firstName = "John"
                rootId.title = "The sky is blue"
            }
        }
    }

    Component.onCompleted: {
        console.log("The firstname is: " + firstName)
    }
}
