import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

Rectangle {
    width: 800;height: 800;
    property var mouse_x;
    property var mouse_y;
    Canvas{
        id:canvas;

        width:400;height: 400;
        contextType: "2d"
        onPaint: {
            var ctx = getContext("2d");
            ctx.lineWidth = 2;
            ctx.strokeStyle = "red";
            ctx.beginPath();
            ctx.rect(0,0,width,height);
            ctx.stroke();
        }

        MouseArea{
            anchors.fill: parent;
            onMouseXChanged: {
                console.log("mouse x changed");
            }
            onClicked: {
                console.log("mouse click ");
            }

            onEntered: {
                console.log("enter mouseArea x:: ",mouseX,"mouse Y: ",mouseY);
//                canvas.context.lineWidth = 4;
//                canvas.context.strokeStyle = "blue";
//                canvas.context.beginPath();
//                canvas.context.moveTo(mouseX,mouseY);
                mouse_x = mouseX;mouse_y = mouseY
            }

            onPositionChanged: {
                console.log("mouse x: ",mouseX,"mouse y:  ",mouseY)
                canvas.context.lineWidth = 4;
                canvas.context.strokeStyle = "blue";
                canvas.context.beginPath();
                canvas.context.moveTo(mouse_x,mouse_y)
                canvas.context.lineTo(mouseX,mouseY);
                canvas.context.stroke();
                canvas.requestPaint();
                mouse_x = mouseX;
                mouse_y = mouseY;
            }
            onExited: {
                console.log("exit mouseArea")
//                canvas.context.stroke();
//                canvas.requestPaint();

            }
        }
    }

}
