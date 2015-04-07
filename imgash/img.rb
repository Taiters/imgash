require 'rack'
require 'imash'

module Imgash
	class Img < Sinatra::Application

		get '/img.png' do

			name = params[:name] || (0...50).map { ('a'..'z').to_a[rand(26)] }.join
			send_file(get_path_to_img(name))
		end

		use Rack::Sendfile

		private 

		def get_path_to_img(name)

			filename = File.join(settings.root, 'storage', 'images', name.gsub(/[^A-Za-z0-9\-]/,'_') << ".png")

			return filename if File.exists?(filename)

			Imash.generate(name, 80, 8).save(filename).path

		end
	end
end