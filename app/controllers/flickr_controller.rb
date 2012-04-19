require 'flickraw'

class FlickrController < ApplicationController
  def home
  	redirect_to "/flickr" if user_signed_in?
  end


  def show
  	redirect_to "/" if !user_signed_in?
  	
		a = 0
		@urls = Array.new
		@flickr_links = Array.new

		list = flickr.interestingness.getList per_page: 10

		list.each do |photo|	  
	  @urls[a] = FlickRaw.url_m(flickr.photos.getInfo(:photo_id => "#{photo.id}"))
	  @flickr_links[a] = FlickRaw.url_photopage(flickr.photos.getInfo(:photo_id => "#{photo.id}"))
	  a+=1	  
	end
  end


end
