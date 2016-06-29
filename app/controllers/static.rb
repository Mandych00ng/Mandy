get '/' do
	@urls = Url.all
	erb :"static/index"
end

post '/urls' do
	@url = Url.find_by(long_url:params[:long_url])

	if @url
		@msg = "U ald exist!"
		@urls = Url.all
		erb :"static/index"
		
	else
		@url = Url.new(long_url:params[:long_url])
		if @url.save
			@msg = "TQ for your link, i ate it and u wait for the shorten one"
			@urls = Url.all
			erb :"static/index"
		else
			@msg = "wrong link la"
			@urls = Url.all
			erb :"static/index"
		end
	end
end

get '/:short_url' do
	@url = Url.where(short_url: params[:short_url]).first
  @url.save
  redirect @url.long_url
end