import QtQuick 2.15
import SmartHome 1.0

/**
This defines a visual element containing the buttons to switch between the tabs
and some spacers between the buttons. When a button in the group is clicked
every other button has to be disabled. A javascript function is used to
propagate the change. The currently set button is made visible to the outside
via currentIndex.
*/

Item {
    id: rootId

    property int currentIndex: 0

    function updateTabs(index)
    {
        var i = 0;
        for(;i < children.length; i++)
        {
            if(children[i].objectName == "tabButton")
            {
                if(children[i].index != index)
                {
                    children[i].active = false
                }
            }
        }
        rootId.currentIndex = index
    }

    Rectangle {
        id: leftSpacer
        anchors.top: parent.top
        anchors.topMargin: 26
        width: 231
        height: 2
        color: "#b4b4b4"
    }

    TabButton {
        id: tabButton1
        index: 0
        anchors.top: parent.top
        anchors.topMargin: 11
        anchors.left: leftSpacer.right
        width: 58
        height: 26
        buttonText: "Gauges"
        active: true
        onActivated: rootId.updateTabs(index)
    }

    Rectangle {
        id: spacer1
        anchors.top: parent.top
        anchors.topMargin: 26
        anchors.left: tabButton1.right
        anchors.leftMargin: 2
        width: 7
        height: 2
        color: "#b4b4b4"
    }

    TabButton {
        id: tabButton2
        index: 1
        anchors.top: parent.top
        anchors.topMargin: 11
        anchors.left: spacer1.right
        height: 26
        buttonText: "Buttons"
        active: false
        onActivated: rootId.updateTabs(index)
    }

    Rectangle {
        id: spacer2
        anchors.top: parent.top
        anchors.topMargin: 26
        anchors.left: tabButton2.right
        anchors.leftMargin: 2
        width: 8
        height: 2
        color: "#b4b4b4"
    }

    TabButton {
        id: tabButton3
        index: 2
        anchors.top: parent.top
        anchors.topMargin: 11
        anchors.left: spacer2.right
        width: 71
        height: 26
        buttonText: "Advanced"
        active: false
        onActivated: rootId.updateTabs(index)
    }

    Rectangle {
        id: spacer3
        anchors.top: parent.top
        anchors.topMargin: 26
        anchors.left: tabButton3.right
        anchors.leftMargin: 2
        width: 8
        height: 2
        color: "#b4b4b4"
    }

    TabButton {
        id: tabButton4
        index: 3
        anchors.top: parent.top
        anchors.topMargin: 11
        anchors.left: spacer3.right
        width: 54
        height: 26
        buttonText: "Sliders"
        active: false
        onActivated: rootId.updateTabs(index)
    }

    Rectangle {
        id: spacer4
        anchors.top: parent.top
        anchors.topMargin: 26
        anchors.left: tabButton4.right
        anchors.leftMargin: 2
        width: 7
        height: 2
        color: "#b4b4b4"
    }

    TabButton {
        id: tabButton5
        index: 4
        anchors.top: parent.top
        anchors.topMargin: 11
        anchors.left: spacer4.right
        width: 56
        height: 26
        buttonText: "Graphs"
        active: false
        onActivated: rootId.updateTabs(index)
    }

    Rectangle {
        id: spacer5
        anchors.top: parent.top
        anchors.topMargin: 26
        anchors.left: tabButton5.right
        anchors.leftMargin: 2
        width: 7
        height: 2
        color: "#b4b4b4"
    }

    TabButton {
        id: tabButton6
        index: 5
        anchors.top: parent.top
        anchors.topMargin: 11
        anchors.left: spacer5.right
        width: 56
        height: 26
        buttonText: "Tabs"
        active: false
        onActivated: rootId.updateTabs(index)
    }

    Rectangle {
        id: rightSpacer
        anchors.top: parent.top
        anchors.topMargin: 26
        anchors.left: tabButton6.right
        width: 234
        height: 2
        color: "#b4b4b4"
    }
}
