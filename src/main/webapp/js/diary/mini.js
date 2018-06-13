  
//여기서 부터 미니 통계 파트
//writeStatis (위 첫번째꺼)입니다.
function kal (data) {
	var html= "";
	html += '<p> 1 일 필요 열량 :'+ data.dailyKal + 'kcal </p>';
	html += '<p> 하루 섭취 열량 :'+ data.dailyMeal + 'kcal </p>';  
	html += '<p> 운동(소모한)열량 :'+ data.dailyExcer + 'kcal </p>';
	html += '<p> 남은 열량:'+ data.reCalories + 'kcal </p>';
	if(data.reCalories <= 0){
		html += '<p> 더 드시면 곤란해요..ㅠ ^ ㅠ </p>';	
	}
	
	$("#writeMiniStatis").html(html);
}

function KalUserSeq() {
	console.log("실행중.........");
	console.log(id);
	$.ajax({
		url: "/spring-bitdiary/mini/mini.json",
		data: {"id" : id},
		dataType: "json",
		success: function (data) {
			console.log("성공");
			kal(data);
			console.log(data);
		},
		error : function(data){
			console.log('에러',data);
		}
	});
}


var img = new Image();

var ctx = document.getElementById("pieCanvas").getContext('2d');
var fillPattern = ctx.createPattern(img, 'repeat');


function dou() {
	console.log(userSeq);
	$.ajax({
		url: "/spring-bitdiary/mini/minidou.json",
		data: {"userSeq" : userSeq},
		dataType: "json",
		success: function (data) {
			console.log(data);
			var data = {
				    datasets: [{
				        data: [data.morning, data.lunch, data.dinner, data.snack],
					    backgroundColor: [
					    	 'rgba(255, 99, 132)',
				             'rgba(255, 159, 64)',
				             'rgba(54, 162, 235)',
				             'rgba(255, 205, 86)'
					    ]
				    }],
				    // These labels appear in the legend and in the tooltips when hovering different arcs
				    labels: [
				        '아침',
				        '점심',
				        '저녁',
				        '간식'
				    ]
				};
			var img = new Image();

			var ctx = document.getElementById("pieCanvas").getContext('2d');
			var fillPattern = ctx.createPattern(img, 'repeat');
			var myPieChart = new Chart(ctx,{
			    type: 'doughnut',
			    data: data,
			    options: {
					rotation : 1 * Math.PI,
					'animation.animateScale' : true,
			    }
			});
		},

		
	});
}

 