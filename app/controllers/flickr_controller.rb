require 'flickraw'

class FlickrController < ApplicationController
  def home
  end


  def show
  	FlickRaw.api_key="5448acb0be52ab7d71af7d0498829ea6"
	FlickRaw.shared_secret="9552411e9c7dd486"

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
