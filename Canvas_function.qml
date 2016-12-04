import QtQuick 2.3

Item {

    Canvas{
        width: 400;
        height: 240;
        contextType: "2d";

        onPaint: {
            var ctx = getContext("2d");

            ctx.lineWidth = 2;
            ctx.strokeStyle = "red";

            var gradient = ctx.createLinearGradient(60,50,180,130);
            gradient.addColorStop(0.0,Qt.rgba(1,0,0,1.0));
            gradient.addColorStop(1.0,Qt.rgba(0,0,1,1.0));

            ctx.fillStyle = gradient;
            ctx.beginPath();
            ctx.rect(60,50,120,80);
            ctx.fill();
            ctx.stroke();

            gradient = ctx.createLinearGradient(230,160,30,260,200,20);
            gradient.addColorStop(0.0,Qt.rgba(1,0,0,1.0));
            gradient.addColorStop(1.0,Qt.rgba(0,0,1,1.0));
            ctx.fillStyle = gradient;
            ctx.beginPath();
//            ctx.rect(200,140,80,80);
            ctx.moveTo(200,80); //start point
            ctx.lineTo(200,200);
            ctx.lineTo(300,200)

            //
//            ctx.moveTo(200,200);
//            ctx.lineTo(200,80); //start point
//            ctx.lineTo(300,200)

            ctx.fill();
            ctx.stroke();
        }
    }

    Canvas{
        x:400;
        width: 400;
        height: 300;

        onPaint: {
            var ctx = getContext("2d");

            ctx.lineWidth = 2;
            ctx.strokeStyle = "red";
            ctx.font = "42px sans-serif";


            var gradient = ctx.createLinearGradient(0,0,width,height);
            gradient.addColorStop(0.0,Qt.rgba(0,1,0,1.0));
            gradient.addColorStop(1.0,Qt.rgba(0,0,1,1.0));

            ctx.fillStyle = gradient;
            ctx.beginPath();
            ctx.moveTo(4,4);

            ctx.bezierCurveTo(0,height - 1,width - 1, height/2,width/4,height/4);

            ctx.lineTo(width/2,height/4);

            ctx.arc(width*5/8,height/4,width/8,Math.PI,0,false);

            ctx.ellipse(width*11/16,height/4,width/8,height/4);

            ctx.lineTo(width/2,height*7/8);

            ctx.text("Complex path",width/4,height*7/8);

            ctx.fill();
            ctx.stroke();


            ctx.lineWidth = 2;
            ctx.strokeStyle = "red";
            ctx.beginPath();
            ctx.rect(0,0,400,300);
            ctx.stroke();
        }
    }


    Canvas{
        y:400;
        width: 400;height: 400
        property var imagePath: "1.png"
        onPaint: {
            var ctx = getContext("2d");

            ctx.lineWidth = 2;
            ctx.strokeStyle = "red";
            ctx.beginPath();
            ctx.rect(0,0,400,400);
            ctx.stroke();

            ctx.drawImage(imagePath,0,0)
        }

        Component.onCompleted: loadImage(imagePath);
        onImageLoaded: requestPaint();
    }
}
