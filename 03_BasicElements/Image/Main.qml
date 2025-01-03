import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("QML Basic Elements Demo")

    Item {
        id: containerItemId
        x: 150; y: 50
        width: 600; height: 300        

        // Loading image from the working directory
        Image {
            x: 10; y: 50
            width: 100; height: 100            
            source: "file:LearnQt.png"
        }

        // Loading image from the resource file
        Image {
            x: 150; y: 50
            width: 100; height: 100
            source: "qrc:/images/LearnQt.png"
        }

        // Load image from a full path
        Image {
            x: 300; y: 50
            width: 100; height: 100
            source: "file:///C:/Users/manhh/Qt6QML/03_BasicElements/Image/images/LearnQt.png"
        }

        // Specify the full web path to the image
        Image {
            x: 450; y: 50
            width: 100; height: 100
            source: "https://www.learnqt.guide/assets/blog/image/LearnQt.png"
        }
    }
}
