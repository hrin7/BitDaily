//$(document).ready(function(){
	$("#nav-weight").addClass("active");
	
	$("#weight").click(function () {
		$(".but").html("<input type='text' name='weightToday' id='weightToday'>　<button class='buts'>등록</button>");
	});
	
	var data = {
		    labels: [
		        "5/17", "5/18", "5/19", "5/20", "5/21", "5/22", "5/23"
		    ],
		    datasets: [
		        {
		            label: 'kg',
		            data: [
		                53, 49, 51, 55, 53, 48, 45
		            ],
		            backgroundColor: [
		                'rgba(255, 99, 132, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 0.2)',
		                'rgba(153, 102, 255, 0.2)',                                                               
		                'rgba(255, 159, 64, 0.2)'
		            ],
		            borderColor: [
		                'rgba(255,99,132,1)',
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(75, 192, 192, 1)',
		                'rgba(153, 102, 255, 1)',
		                'rgba(255, 159, 64, 1)'
		            ],
		            borderWidth: 0.5
		        }
		    ]
		};
	var options = {
		    animation: {
		        animateScale: true
		    },
		    responsive: false,
		    scales: {
		        yAxes: [
		            {
		                ticks: {
		                    beginAtZero: false                                                                    
		                }
		            }
		        ]
		    }
		};
	var ctx = document.getElementById("lineCanvas").getContext('2d');                                           
	var myBarChart = new Chart(ctx, {
	    type: 'line',
	    data: data,
	    options: options
	});
	
//})