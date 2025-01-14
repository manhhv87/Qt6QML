import QtQuick 2.15

/**
* This instance of a PathView Item is showing elements
* along a simple PathLine. This PathLine defines a vertical path that begins in the top
* and ends bottomline.
* As default elements (model) there are numbers from 0 to 55 with steps of 5.
* it is possible to set a different model
*/

PathView {
    id: rootId

    property variant currentValue

    /**
    * This function is called to set the current value
    */
    function setCurrentValue(value) {
        for( var i = 0; i < model.length; i++ ) {
            if( model[i] == value ) {
                i -= 2
                if( i < 0 )
                    i += model.length
                currentIndex = i
                break
            }
        }
    }

    width: 58
    height: Math.floor( model.length / 3 ) * 200
    y: -40
    model: ["00", "05", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55"]
    // The delegate shows the information as a Text Item
    delegate: Text {
        font.family: "Arial"
        font.bold: true
        font.pixelSize: 50
        smooth: true
        color: "black"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: modelData
        Component.onCompleted: {
            font.pointSize = font.pointSize * 0.8
        }
    }

    // The vertical path is defined here.
    path: Path {
        id: path
        startX: rootId.width / 2
        PathLine {
            x: path.startX
            y: rootId.height
        }
    }

    // if the currentIndex changes we set the current value appropriate
    onCurrentIndexChanged: {
        var index = ( currentIndex + 2 ) % model.length
        currentValue = model[ index]
    }

    /**
    * This mouse area is in the upper area.
    * When pressed inside the currentIndex is inremented
    */
    MouseArea {
        id: topArea
        x: 0
        y: 40
        width: 58
        height: 59
        onClicked: rootId.incrementCurrentIndex()
    }

    /**
    * This mouse area is in the lower area.
    * When pressed inside the currentIndex is decremented
    */
    MouseArea {
        id: bottomArea
        x: 0
        y: 180
        width: 58
        height: 59
        onClicked: rootId.decrementCurrentIndex()
    }
}
