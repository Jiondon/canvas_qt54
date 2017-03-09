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
    property variant listData;  //产生的数据，存放的数据链表
    property var scale_space: 1;  //刻度单位

    ListModel{
        id:data_list;
    }

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

            var newObject = Qt.createQmlObject('import QtQuick 2.0
                Item {
                    property int posX;   //不可直接在里面复制，通过属性传递到外面进行复制，否则会导致最后一次覆盖掉前面所有的
                    property int posY;
                    property string posStr;
                    property var pointData:0;
                    x:posX;y:posY
                    Canvas{
                        id:canvas_point;
                        width: 8;height: 8
                        onPaint: {
                            var ctx = getContext(\"2d\");
                            ctx.lineWidth = 2;
                            ctx.strokeStyle = \"red\";
                            ctx.arc(2,2,2,Math.PI,-Math.PI,false);
                            ctx.stroke();
                        }
                        MouseArea{
                            anchors.fill: canvas_point;
                            hoverEnabled: true   //鼠标悬停开启
                            onClicked: {
                                console.log(\"click point\");
                            }
                            onEntered:{
                                console.log("enter the mouse area : ");
                                text_id.visible = true;
                            }
                            onExited:{
                                console.log("exit mouse area :: ");
                                text_id.visible = false;
                            }
                            Text{
                                id:text_id;
                                anchors.left: parent.right;
                                anchors.leftMargin: 10;
                                anchors.horizontalCenter: parent.horizontalCenter;
                                visible : false
                                text:String(pointData);
                            }
                        }
                    }
                    Component.onCompleted: {
                        console.log(\"test 111\")
                    }
                }
                ',test, "point_canvas")
            newObject.posX = posX; newObject.posY = posY;

            //必须使用this，如果不使用this的话，会导致所有的值都成为最后一个的值???
//            newObject.posStr = String(newObject.posX)+String(newObject.posY);
            newObject.posStr = Qt.binding(function(){
                console.log("point posX value:",String(this.posX),"point posY value::",String(this.posY));
                return String(this.posX)+String(this.posY);
            })

            console.log(newObject.posStr);
        }
    }


    function setData_list()
    {
        //生成随机数据
        data_list.append({"data":20})
    }
}
