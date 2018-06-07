//$(document).ready(function(){
	$("#nav-weight").addClass("active");
	
	$(document).on("click", "#weight", function() {
		$(".but").html("<input type='text' name='weightToday' id='weightToday'>　<button type='button' class='buts' id='registWeight'>등록</button>");
	});
	
	
	$(document).on("click", ".but", function() {
		$.ajax({
			type : "POST",
			url : "/spring-bitdiary/stat/weightupdate.json",
			data : {
				weight : $("#weightToday").val()
			},
			success : function() {
				alert("체중업데이트가 완료되었습니다.");
				$(".but").html("　 <a href='#' id='weight'><img src='/spring-bitdiary/images/icon/plus.png' width='20px' height='20px'> 오늘체중기록</a>");
			},
			error:function(request,status,error){
		        console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
		});
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