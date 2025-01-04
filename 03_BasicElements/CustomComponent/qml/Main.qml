import QtQuick 2.15
import QtQuick.Window 2.15
// import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
// import QtQuick.Controls.Fusion 2.3

import Style 0.1
import Controls 0.1

Window {
    id: rootId
    width: 950
    height: 680
    visible: true
    title: qsTr("Custom Components Demo")
    color: AppStyle.background

       RowLayout{
               spacing: 100
               anchors.centerIn: parent

               ColumnLayout{
                   visible: true
                   spacing: 100
                   RowLayout{
                       width: parent.width
                       spacing: 100
                       CustomButton {
                           setIcon: "qrc:/assets/Images/add.svg"
                       }
                       CustomButton{
                           setIcon: "qrc:/assets/Images/arrow.svg"
                           backgroundColor:"#3B71CA"
                       }
                   }
                   RowLayout{
                       width: parent.width
                       spacing: 100
                       CustomButton{
                           setIcon: "qrc:/assets/Images/sun.svg"
                           backgroundColor: "#9FA6B2"
                       }
                       CustomButton{
                           setIcon: "qrc:/assets/Images/moon.svg"
                           backgroundColor:"#DC4C64"
                       }
                   }
                   RowLayout{
                       width: parent.width
                       spacing: 100
                       CustomButton{
                           setIcon: "qrc:/assets/Images/eye-off.svg"
                           backgroundColor: "#E4A11B"
                       }
                       CustomButton{
                           setIcon: "qrc:/assets/Images/airdrop.svg"
                           backgroundColor:"#54B4D3"
                       }
                   }
                   RowLayout{
                       width: parent.width
                       spacing: 100
                       CustomButton{
                           setIcon: "qrc:/assets/Images/airplane.svg"
                           backgroundColor: "#FBFBFB"
                           textColor: "#000000"
                       }
                       CustomButton{
                           setIcon: "qrc:/assets/Images/eye-on.svg"
                           backgroundColor:"#332D2D"
                       }
                   }
               }

               ColumnLayout{
                   spacing: 100
                   RowLayout{
                       width: parent.width
                       spacing: 100
                       CustomButton{
                           implicitHeight: 50
                           implicitWidth: 150
                           text: qsTr("Success")
                       }
                       CustomButton{
                           implicitHeight: 50
                           implicitWidth: 150
                           backgroundColor:"#3B71CA"
                           text: qsTr("Primary")
                       }
                   }
                   RowLayout{
                       width: parent.width
                       spacing: 100
                       CustomButton{
                           implicitHeight: 50
                           implicitWidth: 150
                           backgroundColor: "#9FA6B2"
                           text: qsTr("Secondary")
                       }
                       CustomButton{
                           implicitHeight: 50
                           implicitWidth: 150
                           backgroundColor:"#DC4C64"
                           text: qsTr("Danger")
                       }
                   }
                   RowLayout{
                       width: parent.width
                       spacing: 100
                       CustomButton{
                           implicitHeight: 50
                           implicitWidth: 150
                           backgroundColor: "#E4A11B"
                           text: qsTr("Warning")
                       }
                       CustomButton{
                           implicitHeight: 50
                           implicitWidth: 150
                           backgroundColor:"#54B4D3"
                           text: qsTr("Info")
                       }
                   }
                   RowLayout{
                       width: parent.width
                       spacing: 100
                       CustomButton{
                           implicitHeight: 50
                           implicitWidth: 150
                           backgroundColor: "#FBFBFB"
                           textColor: "#000000"
                           text: qsTr("Light")
                       }
                       CustomButton{
                           implicitHeight: 50
                           implicitWidth: 150
                           backgroundColor:"#332D2D"
                           text: qsTr("Dark")
                       }
                   }
               }
           }
}
