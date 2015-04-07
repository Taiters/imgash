require 'rubygems'
require 'rack'
require 'sinatra/base'
require './imgash/img'

module Imgash

	class App < Sinatra::Application

		use Rack::Deflater
		use Imgash::Img
	end
	
end