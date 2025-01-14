import QtQuick 2.15

import "../"

/**
 * This item represents a generic page for the tabs. A page has properties
 * like a title, a description, an icon and two optional explanation texts.
 * In addition to those a tab page also has an index, an icon and text located
 * under the icon. The alignment can also be set, determining if the page is
 * located left/right/top or bottom.
 *
 * int tabIndex:           The index of the page.
 * string tabText:         The text under the icon.
 * string tabIconPath:     The icon image
 * int tabAlignment:       The alignment setting of the page.
 *
 * alias titleText:        The title of the page visible at the top.
 * alias description:      A description of the page action.
 * alias iconSource:       The image on the page.
 * alias explanationText1: An explanation on the page.
 * alias explanationText2: A second explanation on the page.
 *
 */
Item {
    id: tabPage

    property int tabIndex: 0
    property string tabText: "tab"
    property string tabIconPath: ""
    property int tabAlignment: 1 // possible is 0 = left, 1 = right, 2 = top, 3 = bottom

    property alias titleText: settingText.text
    property alias description: closeText.text
    property alias iconSource: icon.source
    property alias explanationText1: explain1.text
    property alias explanationText2: explain2.text

    SHText {
        id: settingText

        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20
        font {
            pointSize: 19
            bold: true
        }
        color: "white"
    }

    Rectangle {
        id: line
        width: parent.width - 40
        radius: 2
        color: "white"
        height: 4
        border.color: "lightGray"
        border.width: 1
        anchors {
            top: settingText.bottom
            topMargin: 5
            left: parent.left
            leftMargin: 20
        }
    }

    Image {
        id: icon
        anchors.top:line.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20
    }

    SHText {
        id: closeText
        color: "white"
        font {
            pointSize: 18
            bold: false
        }
        anchors.left: icon.right
        anchors.top:line.bottom
        anchors.topMargin: 10
        //anchors.bottom: icon.bottom
        //verticalAlignment: Text.AlignVCenter

    }

    SHText {
        id: explain1
        anchors.top: icon.bottom
        anchors.topMargin: 25
        anchors.left: parent.left
        anchors.leftMargin: 20
        color: "white"
        font {
            pointSize: 18
            bold: false
        }
    }

    SHText {
        id: explain2
        anchors.top: explain1.bottom
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20
        color: "white"
        font {
            pointSize: 18
            bold: false
        }
    }
}
