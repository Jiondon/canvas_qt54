//折线图
import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtQml 2.2

Rectangle{
    id:test;
    width: 800;
    height: 800;
    property var posX_s;  //设置起始绘图point（每次绘图完毕，结束的point设为起始的point）
    property var posY_s;

    //画布
    Canvas{
        id:canvas;
        width: 400;
        height: 400;
        contextType: "2d";

        onPaint: {

            var ctx = getContext("2d");  //获取画笔

            //设置画笔的属性
            ctx.lineWidth = 2;
            ctx.strokeStyle = "red";

            //开始绘图
            ctx.beginPath();
            ctx.moveTo(20,20);  //绘图开始的位置
            ctx.lineTo(20,200);  //绘图结束的位置---直线绘图
//            ctx.lineTo(200,200);
            ctx.stroke();  //结束

            ctx.beginPath();
            ctx.moveTo(20,200); //start point
            ctx.lineTo(200,200);
            ctx.stroke();
            posX_s = 20;posY_s = 200;

            canvas.setCurve(40,100,60,150);
            canvas.setCurve(60,150,80,100);
            canvas.setCurve(80,100,100,130);
        }


        //提供接口，设置每一个转折点
        function setCurve(posX,posY)
        {
            var ctx = getContext("2d");
            ctx.lineWidth = 4;
            ctx.strokeStyle = "blue";
            ctx.beginPath();
            ctx.moveTo(posX_s,posY_s); //start point
            ctx.lineTo(posX,posY);
            posX_s = posX;posY_s = posY;
            ctx.stroke();
            requestPaint();

            var newObject = Qt.createQmlObject("import QtQuick 2.0
                Item {
                    x:parent.posX_s;y:parent.posY_s
                    Canvas{
                        id:canvas_point;
                        width: 8;height: 8
                        onPaint: {
                            var ctx = getContext(\"2d\");
                            ctx.lineWidth = 2;
                            ctx.strokeStyle = \"red\";
                            ctx.arc(4,4,4,Math.PI,-Math.PI,false);
                            ctx.stroke();
                        }
                        MouseArea{
                            anchors.fill: canvas_point;
                            onClicked: {
                                console.log(\"click point\");
                            }
                        }
                    }
                    Component.onCompleted: {
                        console.log(\"test 111\")
                    }
                }
                ",test, "point_canvas")
        }
    }
}
