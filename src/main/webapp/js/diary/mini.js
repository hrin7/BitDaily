/**
 * 
 */
// 	일일통계 pie차트
var img = new Image();

	var ctx = document.getElementById("pieCanvas").getContext('2d');
	var fillPattern = ctx.createPattern(img, 'repeat');
	var data = {
		    datasets: [{
		        data: [10, 20, 30, 10],
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
	var options = {
			
	};
	var myPieChart = new Chart(ctx,{
	    type: 'doughnut',
	    data: data,
	    options: options
	});
//일일 통계 여기까지