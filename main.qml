import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

Rectangle {
    visible: true
    width: 800;height: 800;

//    Rectangle{
//        anchors.centerIn: parent;
//        width: 100;height: 100;
//        color: "blue";
//        MouseArea{
//            anchors.fill: parent;
//            hoverEnabled: true   //鼠标悬停开启
//            onEntered: {
//                console.log("enter mouse area");
//            }
//            onExited: {
//                console.log("exit mouse area");
//            }
//        }
//    }

//    Canvas_function{
//        id:test;
//        visible: false;
//    }

//    Canvas_anyLine{
//        id:test1;
//    }

    Canvas_curve{
        id:canvas_curve;
    }

//    Canvans_point{
//        id:canvas_point;
//    }
}
