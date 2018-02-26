//Checkin Changed
function setCheckinCheckoutDate() {
	checkinSel = document.getElementById("search_checkinSel").value;
	console.log("22");
	var today = new Date(checkinSel);
	console.log(today);
	var tomorrow = new Date(today);
	tomorrow.setDate(today.getDate()+1);
	var month = tomorrow.getUTCMonth() + 1; //months from 1-12
	var day = tomorrow.getUTCDate();
	var year = tomorrow.getUTCFullYear();
	if( day < 10)
	{day = '0'+ day}
	if( month < 10)
	{month = '0'+ month}	
	var to = year + "-" + month + "-" + day;
	document.getElementById("search_checkoutSel").setAttribute("min", to);
	document.getElementById('search_checkoutSel').value = to;
}