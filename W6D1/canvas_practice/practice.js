document.addEventListener("DOMContentLoaded", function(){
    let canvas = document.getElementById('mycanvas'); 
    canvas.width = 500;
    canvas.height = 500;
    let ctx = canvas.getContext("2d");
    ctx.fillStyle = 'red';
    ctx.fillRect(30, 30, 180, 60);

    let ctx2 = canvas.getContext("2d");
    ctx2.beginPath();
    ctx2.arc(90, 200, 40, 0, 2 * Math.PI);
    ctx2.strokeStyle = 'white';
    ctx2.lineWidth = 3;
    ctx2.stroke();
    ctx2.fillStyle = 'blue';
    ctx2.fill();

    let ctx3 = canvas.getContext("2d");
    ctx3.beginPath();
    ctx3.moveTo(75, 50);
    ctx3.lineTo(100, 75);
    ctx3.lineTo(100, 25);
    ctx3.fillStyle = 'green';
    ctx3.fill();
});
