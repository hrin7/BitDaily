$(document).ready(function() {
	$("#nav-report").addClass("active");
	
	function drawChart() {
		var data = {
			labels : [ $("#start").text(), 2, 3, 4, 5, 6, $("#end").text() ],
			datasets : [ {
				type : 'bar',
				label : '아침',
				backgroundColor : "rgba(255, 99, 132, 0.2)",
				borderColor : "rgba(255, 99, 132)",
				borderWidth : 1,
				data : [ 1, 2, 3, 4, 5, 6, 7 ]
			}, {
				type : 'bar',
				label : '점심',
				backgroundColor : "rgba(255, 159, 64, 0.2)",
				borderColor : "rgba(255, 159, 64)",
				borderWidth : 1,
				data : [ 5, 2, 8, 4, 2, 5, 6 ]
			}, {
				type : 'bar',
				label : '저녁',
				backgroundColor : "rgba(255, 205, 86, 0.2)",
				borderColor : "rgba(255, 205, 86)",
				borderWidth : 1,
				data : [ 5, 2, 8, 4, 2, 5, 6 ]
			}, {
				type : 'bar',
				label : '간식',
				backgroundColor : "rgba(75, 192, 192, 0.2)",
				borderColor : "rgba(75, 192, 192)",
				borderWidth : 1,
				data : [ 5, 2, 8, 4, 2, 5, 6 ]
			}, {
				type : 'line',
				label : '목표 칼로리',
				fill : false,
				backgroundColor : "rgba(54, 162, 235, 0.2)",
				borderColor : "rgba(54, 162, 235)",
				borderWidth : 1,
				pointHoverBackgroundColor : "rgba(75,192,192,1)",
				pointHoverBorderWidth : 2,
				data : [ 5, 8, 4, 1, 8, 6, 2 ]
			} ]
		};

		var ctx = document.getElementById("barChart");
		window.myBar = new Chart(ctx, {
			type : 'bar',
			data : data,
			options : {
				title : {
					display : true,
					text : 'Chart.js Bar Chart - Stacked'
				},
				tooltips : {
					mode : 'index',
					intersect : false
				},
				responsive : true,
				scales : {
					xAxes : [ {
						stacked : true,
					} ],
					yAxes : [ {
						stacked : true
					} ]
				}
			}
		});
	}
	
	drawChart();
});