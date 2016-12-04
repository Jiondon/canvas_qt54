import QtQuick 2.3

Item {
//    property var posX_point:0;
//    property var posY_point:0;
//    x:posX_point
//    y:posY_point;
    width: 10;
    height: 10;
    Canvas{
        id:canvas_point;
        width: 2;height: 2
        onPaint: {
            var ctx = getContext("2d");
            ctx.lineWidth = 2;
            ctx.strokeStyle = "red";
            ctx.arc(10,10,5,Math.PI,-Math.PI,false);
            ctx.stroke();
        }
        MouseArea{
            anchors.fill: parent;
            onClicked: {
                console.log("click point");
            }
        }
    }
    Component.onCompleted: {
        console.log("test 111")
    }
}

