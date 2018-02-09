class SearchService


  def initialize(params)
    @params=params
    puts @params
  end

  def search_by_all
  	puts "111111"
  	puts @params
  	@search = Hotel.ransack(@params)
    @s = @search.result(distinct: true)
    
    
  end

end
