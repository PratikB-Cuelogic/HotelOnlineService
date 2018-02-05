ActiveAdmin.register Hotel do
  
  controller do
    def new
      @hotel = Hotel.new
    end
    
  def show
    @hotel=Hotel.find(params[:id])
  end

    def create
      @hotel = Hotel.create(hotel_params)
      if @hotel.update_attributes(hotel_images_params)
        redirect_to [:admin, @hotel]
      else
        render 'new'
      end
    end
    
    def update
      @hotel = Hotel.find(params[:id])           
      if @hotel.update_attributes(hotel_images_params)
        redirect_to [:admin, @hotel]
      else
        render 'edit'
      end
    end

    private

    def hotel_params
      puts "1111"
      params.require(:hotel).permit(:name, :rating, :state, :city, :location, :description)
    end

    def hotel_images_params
      puts "222"
      params.require(:hotel).permit(:name, :rating, :state, :city, :location, :description,images_attributes: [:id, :image, :image_cache, :_destroy])
    end
  end

  #permit_params :name, :rating, :location, :description,images_attributes: [:image]

  filter :name
  filter :location
  filter :rating
  filter :created_at
  filter :updated_at
  
  state=["Andhra Pradesh","Arunachal Pradesh","Assam","Bihar","Goa","Gujarat","Haryana","Himachal Pradesh","Jammu & Kashmir","Karnataka","Kerala","Madhya Pradesh",
"Maharashtra","Manipur","Meghalaya","Mizoram","Nagaland","Orissa","Punjab","Rajasthan","Sikkim","Tamil Nadu","Tripura","Uttar Pradesh","West Bengal","Chhattisgarh","Uttarakhand","Jharkhand","Telangana"]
  
  cities= ["Agra","Ahmedabad","Ajmer","Aligarh","Allahabad","Ambattur","Amravati","Amritsar","Asansol","Aurangabad","Bangalore","Bareilly","Belgaum""Bhavnagar","Bhilai Nagar","Bhopal","Bhiwandi","Bikaner","Bhubaneswar","Chandigarh","Chennai","Coimbatore","Cuttack","Dehradun","Delhi","Dhanbad","Durgapur","Faridabad","Firozabad","Gaya","Ghaziabad","Gorakhpur","Gulbarga","Guntur","Gurgaon","Guwahati","Gwalior","Haora","Hubli and Dharwad","Hyderabad","Indore","Jabalpur","Jaipur","Jalandhar","Jalgaon","Jammu","Jamnagar","Jamshedpur","Jhansi","Jodhpur","Kalyan & Dombivali","Kanpur","Kochi","Kolapur","Kolkata","Kota","Loni","Lucknow","Ludhiana","Madurai","Maheshtala","Malegoan","Mangalore","Meerut",
"Mira and Bhayander","Moradabad","Mumbai","Mysore","Nagpur","Nanded Waghala","Nashik","Navi Mumbai","Nellore","Noida","Patna","Pimpri & Chinchwad","Pune","Raipur","Rajkot","Ranchi","Saharanpur","Salem","Sangli Miraj Kupwad","Siliguri","Solapur","Srinagar","Surat","Thane","Thiruvananthapuram","Tiruchirappalli","Tirunelveli","Udaipur","Ujjain","Ulhasnagar","Vadodara","Varanasi","Vasai Virar","Vijayawada","Visakhapatnam","Warangal",]

  form  html: { multipart: true } do |f|
    f.inputs "New" do
      f.input :name
      f.input :state, as: :select, collection: state
      f.input :city, as: :select, collection: cities
      f.input :location
      f.input :description
      f.input :rating, as: :number, min: 0,max: 5      
    end
      f.has_many :images do |i|
        i.inputs do          
          i.input :image,as: :file,:hint => i.object.image.present? ? image_tag(i.object.image.url) : content_tag(:span, "not added yet"), class: 'image_size' , :actions => :edit
        end
      end
    f.actions
  end
end

