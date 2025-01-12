import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts
import QtQuick.Controls 2.3
import Qt5Compat.GraphicalEffects
import SmartHome 1.0

// import "../SmartHome"
import "../screens"
import "../models"

ApplicationWindow {
    id: root
    width: 1440
    height: 1042
    visible: true
    title: qsTr("Smart Home App")

    property string bgGradientStart: '#0d8bfd'
    property string bgGradientStop: '#866aaf'
    property string textColor: '#d9d9d9'
    property color glassyBgColor: Style.alphaColor("#000000",0.5)

    property real powerConsumed: 7354
    property real ambientTemperature: 22
    property real temperature: 26
    property real humidity: 47
    property real heating: 35
    property real water: 231
    property real lightIntensity: 45

    property var currentTime: new Date()

    QtObject {
        id: internal

        property real temperature: 26
        property real humidity: 47
        property real heating: 35
        property real water: 231
        property real lightIntensity: 45
        property real powerConsumed: 7354
        property real ambientTemperature: 22
    }

    onActiveRoomLabelChanged: {
        for(var i=0; i<roomsModel.count; i++) {
            var obji = roomsModel.get(i)

            if(obji['label'] === activeRoomLabel) {
                internal.temperature = obji['temperature']
                internal.humidity = obji['humidity']
                internal.heating = obji['heating']
                internal.water = obji['water']
                internal.lightIntensity = obji['lightIntensity']

                break;
            }
        }
    }

    function hex_to_RGB(hex) {
        hex = hex.toString();
        var m = hex.match(/^#?([\da-f]{2})([\da-f]{2})([\da-f]{2})$/i);
        return Qt.rgba(parseInt(m[1], 16)/255.0, parseInt(m[2], 16)/255.1, parseInt(m[3], 16)/255.0, 1);
    }

    function hex_to_RGBA(hex, opacity=1) {
        hex = hex.toString();
        opacity = opacity > 1 ? 1 : opacity // Opacity should be 0 - 1
        var m = hex.match(/^#?([\da-f]{2})([\da-f]{2})([\da-f]{2})$/i);
        return Qt.rgba(parseInt(m[1], 16)/255.0, parseInt(m[2], 16)/255.1, parseInt(m[3], 16)/255.0, opacity);
    }

    function getRandOffset(value, range=4) {
        return Math.round(value + range/2 - (Math.random(1) * range))
    }

    Timer {
        interval: 1000
        repeat: true
        running: true
        triggeredOnStart: true
        onTriggered: {
            currentTime = new Date()
            ambientTemperature = getRandOffset(internal.ambientTemperature, 2)
            powerConsumed = getRandOffset(internal.powerConsumed, 2)
            temperature = getRandOffset(internal.temperature)
            humidity = getRandOffset(internal.humidity)
            heating = getRandOffset(internal.heating)
            water = getRandOffset(internal.water)
            lightIntensity = getRandOffset(internal.lightIntensity)
        }
    }

    function commafy(value) {
        return value.toLocaleString()
    }

    background: Image {
        anchors.fill: parent
        source: "qrc:/SmartHome/Images/Cover.png"
        //fillMode: Image.PreserveAspectFit

        // FPSText {
        //     id: fps_text
        // }
    }

    property ListModel roomsModel: RoomModel{}
    property string activeRoomLabel: 'Home'

    header: Pane {
        id: topPane
        width: parent.width
        height: 55
        topPadding: 50
        leftPadding: 50
        rightPadding: 50
        background: null

        RowLayout{
            anchors.fill: parent

            OutlinedLabel {
                Layout.alignment: Qt.AlignLeft
                icon: '\uf0c9' // menu
                iconSize: 18
                backgroundColor: Style.charcoalGrey
                borderColor: Style.charcoalGrey
                onClicked: {}
            }

            Item{ Layout.fillWidth: true }

            Pane {
                id: middlePanel
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                Layout.preferredWidth: topPane.width * 0.66
                Layout.preferredHeight: topPane.height

                background: Rectangle {
                    anchors.fill: parent
                    color: Style.alphaColor("#000000",0.5)
                    border.color: Style.alphaColor("#FFFFFF",0.25)
                    radius: 24
                }

                contentItem: Pane {
                    padding: 0
                    height: parent.height * 0.7
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.leftMargin: 20
                    anchors.rightMargin: 20
                    background: null

                    RowLayout{
                        width: parent.width
                        anchors.centerIn: parent

                        Repeater {
                            id: locationrepeater
                            model: roomsModel
                            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                            delegate: Item {
                                id: roomdelegateitem
                                height: 55
                                width: middlePanel.width / locationrepeater.model.count

                                property string label
                                property bool isActive: label === activeRoomLabel
                                property alias icon: iconlabel.icon
                                property alias size: iconlabel.size

                                signal clicked()

                                label: model.label
                                icon: model.icon
                                size: model.size
                                onClicked: activeRoomLabel=label

                                Column {
                                    anchors.fill: parent
                                    spacing: 8

                                    IconLabel {
                                        id: iconlabel
                                        width: parent.height * 0.5
                                        height: width
                                        color: Style.textColor
                                        topPadding: 10
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        horizontalAlignment: IconLabel.AlignHCenter
                                        verticalAlignment: IconLabel.AlignVCenter
                                        opacity: roomdelegateitem.isActive ? 1 : 0.5

                                        Behavior on opacity {
                                            NumberAnimation { duration: 300 }
                                        }
                                    }

                                    Text {
                                        text: roomdelegateitem.label
                                        font.pixelSize: 12
                                        color: Style.textColor
                                        anchors.horizontalCenter: parent.horizontalCenter
                                        opacity: roomdelegateitem.isActive ? 1 : 0.5

                                        Behavior on opacity {
                                            NumberAnimation { duration: 300 }
                                        }
                                    }
                                }

                                MouseArea {
                                    anchors.fill: parent

                                    onClicked: {
                                        roomdelegateitem.clicked()
                                        loadScreen(index)
                                    }
                                }
                            }
                        }

                    }
                }
            }

            Item{ Layout.fillWidth: true }

            OutlinedLabel {
                Layout.alignment: Qt.AlignRight
                icon: '\uf0f3' // bell
                iconSize: 18
                backgroundColor: Style.charcoalGrey
                borderColor: Style.charcoalGrey
                onClicked: {}
            }
        }
    }

    contentData: Loader {
        id: screenLoader
        anchors.topMargin: topPane.topPadding * 2
        anchors.fill: parent
        sourceComponent: mainArea
    }

    function loadScreen(currentScreenIndex){
        switch(currentScreenIndex){
            case 0:
                screenLoader.sourceComponent = mainArea
                break;
            case 1:
                screenLoader.sourceComponent = home
                break;
            // case 2:
            //     screenLoader.sourceComponent = kitchen
            //     break;
            // case 3:
            //     screenLoader.sourceComponent = bedroom
            //     break;
            // case 4:
            //     screenLoader.sourceComponent = laundary
            //     break;
            default:
        }
    }

    Component {
        id: mainArea
        MainArea {}
    }

    Component {
        id: home
        Home {}
    }

    // Component {
    //     id: kitchen
    //     Kitchen {}
    // }

    // Component {
    //     id: bedroom
    //     Bedroom {}
    // }

    // Component {
    //     id: laundary
    //     Laundary {}
    // }
}
