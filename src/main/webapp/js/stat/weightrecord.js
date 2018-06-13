
function setChart(list){
	var dates = [];
	var weights = [];
	for(var i = 0; i < list.length; i++) {
		var date = new Date(list[i].weightDate);
		var month = date.getMonth()+1;
		var date = date.getDate();
		dates.push(month+"\/"+date);
		weights.push(list[i].currentWeight);
//		eval("var date"+i+"="+month+"\/"+date);
//		eval("var weight"+i+"="+list[i].currentWeight);
	}
	var date1 = dates[6];
	var date2 = dates[5];
	var date3 = dates[4];
	var date4 = dates[3];
	var date5 = dates[2];
	var date6 = dates[1];
	var date7 = dates[0];
	var weight1 = weights[6];
	var weight2 = weights[5];
	var weight3 = weights[4];
	var weight4 = weights[3];
	var weight5 = weights[2];
	var weight6 = weights[1];
	var weight7 = weights[0];
	
	var data = {
		    labels: [
		    	date1, date2, date3, date4, date5, date6, date7
		    ], 
		    datasets: [
		        {
		            label: 'kg',
		            data: [
		            	weight1, weight2, weight3, weight4, weight5, weight6, weight7
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
		                    beginAtZero: false,
		                    stepSize: 0.5
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
}
	$("#nav-weight").addClass("active");
	
	$(document).on("click", "#weight", function() {
		$(".but").html("<input type='text' name='weightToday' id='weightToday'>　<button type='button' class='buts' id='cancletWeight'>취소</button> <button type='button' class='buts' id='registWeight'>등록</button>");
	});
	
	$(document).on("click", "#cancletWeight", function() {
		$(".but").html('　<a href="#" id="weight"><img src="/spring-bitdiary/images/icon/plus.png" width="20px" height="20px"> 오늘체중기록</a>');
	});
	
	
	$(document).on("click", "#registWeight", function() {
		$.ajax({
			type : "POST",
			url : "/spring-bitdiary/stat/weightupdate.json",
			data : {
				weight : $("#weightToday").val(),
				weightDate : new Date()
			},
			success : function(result) {
				alert("체중업데이트가 완료되었습니다.");
				$(".but").html("　 <a href='#' id='weight'><img src='/spring-bitdiary/images/icon/plus.png' width='20px' height='20px'> 오늘체중기록</a>");
				$("#sideList").html("");
				$("#lineCanvas").html("");
				makeWeightList();
			},
			error:function(request,status,error){
				alert("오늘은 이미 등록되었습니다. 수정버튼을 이용하세요.");
//		        console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
		});
	});
	
	function setScale() {
		$.ajax({
			type : "POST",
			url : "/spring-bitdiary/stat/getSession.json",
			success : function(member) {
				console.log(member);
				var startWeight = member.userWeight;
				var endWeight = member.goalWeight;
				
				var curWeight = member.currentWeight;
				$("#curWeight").html("<h3>"+curWeight+"kg</h3>");
				
				var goal = startWeight-endWeight; //감량해야할 수
				var cur = startWeight-curWeight; //감량한 수
				var percentage = ((cur/goal)*100).toFixed(0);
				if(percentage > 100) {
					percentage = 100;
				}
				if(percentage < 0) {
					percentage = 0;
				}
				$("#percentage").text("　"+percentage+"%");
				var length = 380;
				var move = length * (percentage/100);
				var gap = $(".runner").offset().left - 454.138;
//				console.log(gap);
				$(".runner").animate({right: "+="+gap+"px"}, 50);
				$(".runner").animate({right: "-="+move+"px"}, 800);
			},
			error:function(request,status,error){
		        console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
		});
	};
	
	
	function makeWeightList() {
		$.ajax({
			type : "POST",
			url : "/spring-bitdiary/stat/weightList.json",
			success : function(weightList) {
				console.log(weightList);
				var list = "";
				for(var i = 0; i < weightList.length; i++) {
					list+= "<hr>";
					if(i == 0) {
						list += "　　";
					}
					var date =  new Date(weightList[i].weightDate);
					list+= "<span>"+date.getFullYear() + "."
					+ (date.getMonth() + 1) + "."
					+ date.getDate()
					+ "　" + weightList[i].currentWeight + "kg</span>";
					if(i == 0) {
						list += "  <img id='updateCurrent' src='/spring-bitdiary/images/icon/editweight.png'>";
					}
				}
				$("#sideList").append(list);
				setChart(weightList);
				setScale();
				
			},
			error:function(request,status,error){
		        console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
		});
	};
	
	makeWeightList();
	
	$(document).on("click", "#updateCurrent", function() {
		$(this).prev().text("");
		$(this).prev().html("<input type='text' name='updateTodayWeight' id='updateTodayWeight'>");
		$(this).attr("id", "updateToday");
		
	});
	$(document).on("click", "#updateToday", function() {
		$.ajax({
			type : "POST",
			url : "/spring-bitdiary/stat/updateTodayWeight.json",
			data : {
				weight : $("#updateTodayWeight").val(),
				weightDate : new Date()
			},
			success : function() {
				alert("수정이 완료되었습니다.")
				$("#sideList").html("");
				$("#lineCanvas").html("");
				makeWeightList();
			},
			error:function(request,status,error){
				console.log("에러");
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	});
	
