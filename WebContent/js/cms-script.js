
$(document).ready(function(){
	
}); 

// delete page functions 
function deleteFood(name){
	let confirmation = confirm("Are you sure! You want to delete this Item ?");
	console.log(confirmation);
	if(confirmation){
		window.location = "DeleteFood?food_id="+name;
	}
}
 
// edit page functions 
function setValues(){
	if($('#availability').attr('check')){
		$('input[type="radio"]')[0].checked = true;
	}else{
		$('input[type="radio"]')[1].checked = true;
	}
	
	let category =  $('#category').attr('category').split(" ");
	for(let i in category){
		switch(category[i]){
			case "breakfast":
				$("#breakfast")[0].checked = true;
				break;
			case "lunch":
				$("#lunch")[0].checked = true;
				break;
			case "dinner":
				$("#dinner")[0].checked = true;
				break;
			default: 
				break;
		}
	}
}

// order page functions 
function deliverThis(e){ 
	if(!($(e).find("i").hasClass("delivered"))){
		let foodId, foodQty, date, userId;
		foodId = $(e).attr("foodId");
		foodQty = $(e).attr("foodQty");
		date = $(e).attr("date");
		userId = $(e).attr("userId"); 
		
		$.ajax({
			url: "DeliveryStatus",
			type:"post",
			data:{ foodId : foodId, foodQty: foodQty, date: date, userId: userId}, 
			success:function(result){
				if(result){
					$(e).addClass("disable").find("i").addClass("delivered");
					$(e).siblings("span").text("delivered");
				}
			}
		});
	}else{
		console.log("already delivered");
	}
}

function deliveryStatus(){ 
	for(let i=0; i<$(".d-status").length; i++){ 
		if( $(".d-status")[i].textContent ==="delivered" ){ 
			$(".d-status").eq(i).siblings("a").addClass("disable").find("i").addClass("delivered");
		}
	}
}