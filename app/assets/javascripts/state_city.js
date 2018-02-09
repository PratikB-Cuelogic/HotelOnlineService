var stateCityInfo = {
	"Assam": [ "Dispur","Guwahati" ],
	"Andhra Pradesh": [],
	"Arunachal Pradesh": [],
	"Bihar": [],
	"Goa": [],
	"Gujarat": [ "Vadodara", "Surat" ],
	"Haryana": [],
	"Himachal Pradesh": [],
	"Jammu & Kashmir": [],
	"Karnataka": [],
	"Kerala": [],
	"Madhya Pradesh": [],
	"Maharashtra": [],
	"Manipur": [],
	"Meghalaya": [],
	"Mizoram": [],
	"Nagaland": [],
	"Orissa": [],
	"Punjab": [],
	"Rajasthan": [],
	"Sikkim": [],
	"Tamil Nadu": [],
	"Tripura": [],
	"Uttar Pradesh": [],
	"West Bengal": [],
	"Chhattisgarh": [],
	"Uttarakhand": [],
	"Jharkhand": [],
	"Telangana": []
}

var roomList = [
"1 Room","2 Rooms","3 Rooms"
/*"4 Rooms","5 Rooms","6 Rooms","7 Rooms","8 Rooms","9 Rooms","10 Rooms","11 Rooms","12 Rooms","13 Rooms","14 Rooms","15 Rooms","16 Rooms",*/
]	


window.onload = function () {
	
	//Get html elements
/*	var stateSel = document.getElementById("search_stateSel");	
	var citySel = document.getElementById("search_citySel");
*/	var roomSel = document.getElementById("q_roomSel");		
/*	//Load state
	for (var state in stateCityInfo) {
		stateSel.options[stateSel.options.length] = new Option(state, state);
	}
	
	//City Changed
	stateSel.onchange = function () {
		 citySel.length = 1; // remove all options bar first				
		 if (this.selectedIndex < 1)
			 return; // done
		var city = stateCityInfo[stateSel.value];
		console.log(city)
		for (var i = 0; i < city.length; i++) {
			citySel.options[citySel.options.length] = new Option(city[i], city[i]);
		}
	}
*/
	for (var i = 0; i < roomList.length; i++) {
		roomSel.options[roomSel.options.length] = new Option(roomList[i], roomList[i]);
	}
}
	