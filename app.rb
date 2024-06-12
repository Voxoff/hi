require 'sinatra'
require 'sinatra/base'
require 'date'
class App < Sinatra::Base
    path = "images"
    get '/' do
        send_file(path + '/pixel.png', type: 'image/png')
    end

    get '/image' do
        # File path and name for 1 x 1 pixel. Must be an absolute path to pixel.
        filename = path + '/pixel.png'

        # Log the User-Agent String.
        user_agent = request.user_agent

        # Get the current time of request and format time into readable format.
        current_time = DateTime.now
        timestamp = current_time.strftime('%Y-%m-%d %H:%M:%S')

        # Log the IP address of requester.
        get_ip = request.ip

        # Lookup Geolocation of IP Address.
        data = nil
        # data = open("https://geolocation-db.com/jsonp/#{get_ip}").read
        # data = data.split('(')[1].chomp(')')

        # Add User-Agent, Timestamp, and IP Address + Geolocation information to dictionary.
        log_entry = "Email Opened:\nTimestamp: #{timestamp}\nUser Agent: #{user_agent}\nIP Address: #{data}\n"

        # Write log to hardcoded path. Must be an absolute path to the log file.
        File.open(path + '/spy_pixel_logs.txt', 'a') do |f|
            f.write(log_entry)
        end

        # Serve a transparent pixel image when navigating to .../image URL. "image/png" displays the image in PNG format.
        send_file filename, type: 'image/png'
    end
end