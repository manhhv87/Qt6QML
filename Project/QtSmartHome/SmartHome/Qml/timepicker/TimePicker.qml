import QtQuick 2.15

/*
 * The TimePicker component is a widget to let the user select numbers (or, more unspecific,
 * elements) from a device with movable barrels. Currently two barrels are available. The elements
 * to be displayed can be set through properties. The component supports kinetic scrolling through
 * the QML PathView element.
 *
 * To create an another picker for different numbers, you can adapt this example.
 * You need to set a different model for your desired numbers as shown in Item with id "leftBarrel".
 * Maybe you would like to have a picker for a single number. In that case you could make the second "barrel" invisible
 * and/or maybe change the background image to fit your needs. The second PickerPathView instance isn't needed then.
 *
 * Properties:
 * variant currentValue1:     The current element on the first barrel
 * variant currentValue2:     The current element on the second barrel
 * string caption:            The caption of the widget
 * model leftBarrelModel:  The model to be used by the first PathView. The format of the model
 *                            is a list of strings.
 * model rightBarrelModel: The model to be used by the second PathView. The format of the model
 *                            is a list of strings.
 *
 * Signals:
 * valueChanged()           Emitted when either value changes
 */

Rectangle {
    id: rootId

    property variant currentValue1: leftBarrel.currentValue
    property variant currentValue2: rightBarrel.currentValue
    property string caption: "Time Picker"
    property alias leftBarrelModel: leftBarrel.model
    property alias rightBarrelModel: rightBarrel.model
    property alias backgroundImagePath: backgroundImage.source

    signal valueChanged

    function setCurrentValues(value1,value2) {
        leftBarrel.setCurrentValue(value1)
        rightBarrel.setCurrentValue(value2)
    }

    width: backgroundImage.width
    height: backgroundImage.height
    color: "transparent"

    onCurrentValue1Changed: {
        valueChanged()
    }
    onCurrentValue2Changed: {
        valueChanged()
    }

    Image {
        id: backgroundImage
        x: 0
        y: 0
        source: "qrc:/SmartHome/Images/timer/double_picker_background.svg"

        /*
         * The TimePicker uses a PathView to animate the elements. The part of the view which
         * lies directly over the barrel should be visible. The rest must be clipped. This is
         * done using an ordinaty QML Item. The Item acts as the clipping area.
         */
        Item {
            id: maskItem
            x: 15
            y: 47
            width: 200
            height: 200

            /*
             * Set clip to true to enable clipping of child items.
             */
            clip: true

            PickerPathView {
                id: leftBarrel
                x: 23
                model: ["00","01","02","03","04","05","06","07","08","09","10","11","12",
                        "13","14","15","16","17","18","19","20","21","22","23"]
            }

            PickerPathView {
                id: rightBarrel
                x: 118
                width: 58
                height: 800
            }
        }

        /*
         * The caption
         */
        Text {
            id: caption
            x: 15
            y: 11
            width: 200
            height: 20
            color: "#ffffff"
            text: rootId.caption
            font.bold: true
            font.pointSize: 13
            verticalAlignment: "AlignVCenter"
            horizontalAlignment: "AlignHCenter"
        }

    }

    /*
     * To finish the look of the element, a semi transparent graphic is rendered on top of the
     * barrels:
     */
    Image {
        id: image1
        x: 0
        y: 0
        source: "qrc:/SmartHome/Images/timer/double_picker_reflex.svg"
    }
}
