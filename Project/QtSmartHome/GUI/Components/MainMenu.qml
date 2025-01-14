import QtQuick 2.15

import "models"

/*
 * This is the MainMenu component.
 * The MainMenu consists of the four FanStack elements and provides some logic to implement
 * the special behavior.
 */
Item {
    id: mainMenu

    property int xSpacing: 0
    property int ySpacing: 0
    property int baseWidth: 800
    property int baseHeight: 400
    property int currentMinute: 0
    property int currentHour: 0
    property int currentRain: 0
    property int currentWindForce: 0
    property int currentLux: 0
    property int currentTemperature: 0

    property alias menuIsCovered: menu.isCovered

    function checkStates() {
        menu.checkStates();
    }

    function showAll() {
        menu.showAll();
    }

    HardwareModels { id: hardwareModels }

    Item {
        id: menu

        anchors.fill: parent

        property bool isCovered: stack1.flipped || stack2.flipped || stack3.flipped || stack4.flipped

        /*
         * This is a helper function to help position the elements evenly and horizontally centered.
         * Parameters:
         * index:   The index of the element for which a x coordinate should be calculated
         * count:   The total number of elements
         */
        function calculateX(index,count) {
            var ELEMENT_WIDTH = 150
            var SPACING = 30
            var TOTAL_WIDTH = count * ELEMENT_WIDTH + SPACING
            var OFFSET = ( menu.width - TOTAL_WIDTH ) / 2
            var x = index * ELEMENT_WIDTH + index * SPACING + OFFSET
            return x
        }

        function calcX(index) {
            return calculateX( index, children.length )
        }

        /*
         * This is a helper function to "activate" a specific FanStack
         */
        function setActive(name) {
            for( var i = 0; i < children.length; i++ ) {
                if( children[i].objectName != name ) {
                    children[i].inactive = true
                    children[i].doFanOut = false
                }
            }
        }

        /*
         * This helper function resets the state of all FanStacks. After calling this
         * functino all stacks are active and fanned in.
         */
        function showAll() {
            for( var i = 0; i < children.length; i++ ) {
                children[i].doFanOut = false
                children[i].inactive = false
                children[i].origState()
            }
        }

        /*
         * In this application all fan stack elements provide some sort of settings dialog, which
         * sets parameters for the house equipment. Those parameters depend on the current time and on
         * each other. So they have to be checked and updated regularly. This is done by the
         * checkStates() function, which in turn calls checkStates() on each Fan, which in turn calls
         * checkState on each fan stack element
         */
        function checkStates() {
            for( var i = 0; i < children.length; i++ ) {
                children[i].checkStates()
            }
        }

        Component.onCompleted: {
            for( var i = 0; i < children.length; i++ ) {
                children[i].x = calcX(i)
            }
        }

        onWidthChanged: {
            for( var i = 0; i < children.length; i++ ) {
                children[i].x = calcX(i)
            }
        }

        /*
         * Here the FanStack elements are instantiated
         */
        FanStack {
            id:          stack1
            objectName: "stack1"
            model: hardwareModels.lightModel
            onFanOut: menu.setActive(name)
            backPage: "settings/LightSettings.qml"
            flippedXPos: -x
            flippedYPos: -mainMenu.y
            flippedWidth: mainMenu.baseWidth - xSpacing
            flippedHeight: mainMenu.baseHeight - ySpacing
            xSpacing: mainMenu.xSpacing
            ySpacing: mainMenu.ySpacing
            currentMinute: mainMenu.currentMinute
            currentHour: mainMenu.currentHour
            currentRain: mainMenu.currentRain
            currentWindForce: mainMenu.currentWindForce
            currentLux: mainMenu.currentLux
            currentTemperature: mainMenu.currentTemperature
        }

        FanStack {
            id:          stack2
            objectName: "stack2"
            model: hardwareModels.heatingModel
            onFanOut: menu.setActive(name)
            backPage: "settings/HeatingSettings.qml"
            flippedXPos: -x
            flippedYPos: -mainMenu.y
            flippedWidth: mainMenu.baseWidth - 2 * xSpacing
            flippedHeight: 58+mainMenu.baseHeight - 2 * ySpacing
            xSpacing: mainMenu.xSpacing
            ySpacing: mainMenu.ySpacing
            currentMinute: mainMenu.currentMinute
            currentHour: mainMenu.currentHour
            currentRain: mainMenu.currentRain
            currentWindForce: mainMenu.currentWindForce
            currentLux: mainMenu.currentLux
            currentTemperature: mainMenu.currentTemperature
        }

        FanStack {
            id:          stack3
            objectName: "stack3"
            model: hardwareModels.blindModel
            onFanOut: menu.setActive(name)
            backPage: "settings/JalousieSettings.qml"
            flippedXPos: -x
            flippedYPos: -mainMenu.y
            flippedWidth: mainMenu.baseWidth - 2 * xSpacing
            flippedHeight: mainMenu.baseHeight - ySpacing
            xSpacing: mainMenu.xSpacing
            ySpacing: mainMenu.ySpacing
            currentMinute: mainMenu.currentMinute
            currentHour: mainMenu.currentHour
            currentRain: mainMenu.currentRain
            currentWindForce: mainMenu.currentWindForce
            currentLux: mainMenu.currentLux
            currentTemperature: mainMenu.currentTemperature
        }

        FanStack {
            id:          stack4
            objectName: "stack4"
            model: hardwareModels.windowModel
            onFanOut: menu.setActive(name)
            backPage: "settings/WindowSettings.qml"
            flippedXPos: -x
            flippedYPos: -mainMenu.y
            flippedWidth: mainMenu.baseWidth - 2 * xSpacing
            flippedHeight: mainMenu.baseHeight - ySpacing
            xSpacing: mainMenu.xSpacing
            ySpacing: mainMenu.ySpacing
            currentMinute: mainMenu.currentMinute
            currentHour: mainMenu.currentHour
            currentRain: mainMenu.currentRain
            currentWindForce: mainMenu.currentWindForce
            currentLux: mainMenu.currentLux
            currentTemperature: mainMenu.currentTemperature
        }
    }
}
