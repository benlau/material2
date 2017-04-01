import QtQuick 2.5

Item {

    id: rippleSurface

    property color color : "#1F000000"

    property int borderWidth: 0

    property color borderColor: color

    property real minRadius: 24

    property real maxRadius : Math.max(rippleSurface.width,rippleSurface.height)

    function tap(x,y) {
        if (_currentRipple) {
            _currentRipple.stop();
        }

        _currentRipple = rippleCreator.createObject(rippleSurface)
        _currentRipple.start(x,y);
    }

    function clear() {
        if (_currentRipple) {
            _currentRipple.stop();
            _currentRipple = null;
        }
    }

    property var _currentRipple : null

    Component {
        id: rippleCreator

        Item {
            id: container

            function start(x,y) {
                container.x = x;
                container.y = y;

                enlargeAnimation.start();
                fadeInAnimation.start();
            }

            function stop() {
                if (fadeInAnimation.running) {
                    fadeInAnimation.onStopped.connect(function() {
                        fadeOutAnimation.start();
                    });
                } else {
                    fadeOutAnimation.start();
                }
            }

            Rectangle {
                id: ripple
                property real centerX : 0
                property real centerY : 0

                anchors.centerIn: parent

                color: rippleSurface.color
                border {
                    width: rippleSurface.borderWidth
                    color: rippleSurface.borderColor
                }

                width: rippleSurface.minRadius * 2
                height: rippleSurface.minRadius * 2
                radius: rippleSurface.minRadius
                opacity: 0

                ScaleAnimator {
                    id: enlargeAnimation
                    target: ripple
                    duration: 500
                    from: 1
                    to: maxRadius / minRadius
                    easing.type: Easing.OutQuad
                }

                OpacityAnimator {
                    id: fadeInAnimation
                    target: ripple
                    from: 0
                    to: 1
                    duration: 200
                    easing.type: Easing.OutQuad
                }

                SequentialAnimation {
                    id: fadeOutAnimation

                    onStopped: {
                        ripple.destroy();
                    }

                    PauseAnimation {
                        duration: 200
                    }

                    OpacityAnimator {
                        target: ripple
                        duration: 200
                        to: 0
                        easing.type: Easing.InQuad
                    }
                }
            }

        }

    }


}

