
var Orders = {};
var OrderList = {};
var userId = generateUserId();
var alreadyPlaced = false;
$(".checkout").hide(); 

function getUrlParam() {
    var vars = {};
    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
        vars[key] = value;
    });
    return vars;
}

function incItem(e){
	let defaultCount = $(e).siblings(".number").text();
	let count = ++defaultCount;
    let foodId = $(e).siblings(".number").attr("item");
    let foodPrice = $(e).siblings(".number").attr("price");
	let obj = {}, food = {};   
	obj['foodId'] = foodId;
	obj['foodPrice'] = foodPrice;
	obj['foodQty'] = count;
	$(e).siblings(".number").text(count);
	food[foodId] = obj;
	Object.assign(Orders, food);
	addToOrderList(e);
}
function decItem(e){
	let defaultCount = $(e).siblings(".number").text();
	let count = --defaultCount;
	let foodId = $(e).siblings(".number").attr("item");
    let foodPrice = $(e).siblings(".number").attr("price");
	let obj = {}, food= {};
	if(count>=0){
		if(count == 0){
			delete Orders[foodId];
			$(e).siblings(".number").text(count);
		}else{
			obj['foodId'] = foodId;
			obj['foodPrice'] = foodPrice;
			obj['foodQty'] = count;
			$(e).siblings(".number").text(count);
			food[foodId] = obj;
		}
	}
	Object.assign(Orders, food);
	addToOrderList(e);
}

function toggleOrderPopup(){
	$(".order-menu").toggleClass("order-menu-open");
	$(".order-title span i").toggleClass("fa-bars").toggleClass("fa-close");
	getTotalOrders();
}

function addToOrderList(e){

	let list="", itemName="", itemQty=0, itemPrice=0; 
	let total=0;
	for(let item of Object.keys(Orders)){
		itemName = Orders[item].foodId.replace(/[0-9]/g, '');
		itemQty = Orders[item].foodQty;
		itemPrice = itemQty * Orders[item].foodPrice; total += itemPrice;
		list += `<tr> <td>${itemName}</td><td>${itemQty}</td><td>${itemPrice}</td>  </tr>`; 
	}
	list+=`<tr><td></td><td>Total : </td><td>${total}</td></tr>
			<tr><td colspan="3"><button class="genric-btn success circle" onclick="placeOrder(this)" >Place Order</button></td></tr>
			<tr><td colspan="3"><button class="checkout genric-btn success circle" onclick="checkout()" >Checkout</button></td></tr>`;
	
		$("#order-list").html(list);
		$(".checkout").hide();
}

function checkout(){
	let tableNo = getUrlParam()["tableNo"];
	if(confirm("Are you sure want to checkout ?")){
		window.location="checkout.jsp?userId="+userId+"&tableNo="+tableNo+" " ;
	}
}
 
function placeOrder(e){
	alert('Order placing...');
	$(e).text("Order Placed").removeClass("disable");
	$(e).attr("disabled", true);
	$.ajax({
		url:"PlaceOrder", 
		type:"post",
		data:{ userId: userId, tableNo: getUrlParam()["tableNo"], orders: JSON.stringify(Orders)}, 
		success:function(result){
				$(e).text("Order Placed").addClass("disable");
				Object.assign(OrderList, Orders);
				Orders = {}; alreadyPlaced = true;
				//getOrderedData();
				$(".plus").siblings(".number").text("0");
				$(".checkout").show();
				getTotalOrders(); 
			}
	});

}

function getOrderedData(){
	let data ="", itemName="", itemQty=0, itemPrice=0, total=0;
	for(let item of Object.keys(OrderList)){
		itemName = OrderList[item].foodId.replace(/[0-9]/g, '');
		itemQty = OrderList[item].foodQty;
		itemPrice = itemQty * OrderList[item].foodPrice; total += itemPrice;
		data += `<tr> <td>${itemName}</td><td>${itemQty}</td><td>${itemPrice}</td>  </tr>`; 
	}
	data +=`<tr><td></td><td>Total : </td><td>${total}</td></tr>`;
	
	$("#total-order-list").html(data);
}

function generateUserId(){
	return "USER"+Math.floor(Math.random() * 99)+""+Math.floor(Math.random() * 99);
}

function getTotalOrders(){
	let total_list=[], data, total=0;
	$.ajax({
		url:"GetOrders", 
		type:"post",
		data:{userId: userId, tableNo: getUrlParam()["tableNo"] }, 
		success:function(result){
				console.log(result);
				total_list = result.trim().split("&"); 
				console.log(total_list); 
				for(let i=0; i<total_list.length-1; i++){
					let itemArr = total_list[i].split("_"); total += (itemArr[2]*itemArr[1]);
					data += `<tr> <td>${itemArr[0]}</td><td>${itemArr[1]}</td><td>${(itemArr[2]*itemArr[1])}</td>  </tr>`;
				}
				data +=`<tr><td></td><td>Total : </td><td>${total}</td></tr>`;
				$("#total-order-list").html(data);  
				 
			}
	});
}
