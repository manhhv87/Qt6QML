import QtQuick 2.15

Item {
    Component {
        id: timerComp

        Timer {
            id: timer
            repeat: false
            property var _cb: function() {}

            onTriggered: {
                _cb()
                destroy(parent)
            }

            function setTimeout(callback, delayTime) {
                _cb = callback;
                interval = delayTime;
                start();
            }
        }
    }

    function callLate(callback, delayTime) {
        var timerObj = timerComp.createObject()
        timerObj.setTimeout(callback, delayTime)
    }

}
