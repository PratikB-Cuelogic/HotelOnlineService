var stateCityInfo = {
	"Assam": [ "Dispur","Guwahati" ],
	"Andhra Pradesh": [],
	"Arunachal Pradesh": [],
	"Bihar": [],
	"Goa": [],
	"Gujarat": [ "Vadodara", "Surat", "Ahmedabad" ],
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

window.onload = function () {
	
	//Get html elements
	var stateSel = document.getElementById("hotel_state");	
	var citySel = document.getElementById("hotel_city");
	//Load state
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
}
	