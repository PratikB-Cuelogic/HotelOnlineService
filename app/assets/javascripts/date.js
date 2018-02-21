window.onload = function () {
	
	//Checkin Changed
	document.getElementById("search_checkinSel").onchange = function () {
		var today = new Date(checkinSel.value);
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
}