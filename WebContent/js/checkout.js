function checkout(){
let total_list=[], data, total=0; console.log("hey"); 
	$.ajax({ 
		url:"GetOrders", 
		type:"post",
		data:{userId: getUrlParam()["userId"], tableNo: getUrlParam()["tableNo"] }, 
		success:function(result){
				total_list = result.trim().split("&"); 
				for(let i=0; i<total_list.length-1; i++){
					let itemArr = total_list[i].split("_"); total += (itemArr[2]*itemArr[1]);
					data += `<tr> <td>${itemArr[0]}</td><td>${itemArr[1]}</td><td>${(itemArr[2]*itemArr[1])}</td>  </tr>`;
				}
				data +=`<tr class='total-row'><td></td><td>Payment:</td><td>${total}</td></tr>`;
				$("#checkout_list").html(data);   
				 
			}
	});
}

function getUrlParam() {
    var vars = {};
    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
        vars[key] = value;
    });
    return vars;
}