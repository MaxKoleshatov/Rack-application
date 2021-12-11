require_relative 'middleware/all_time'

class App

    def call(env)

      request = Rack::Request.new(env)

      if request.path != '/time' || request.params["format"].nil?
        [404, headers, body]
      else

        time = AllTime.new(request.params["format"])

        if time.check_invalid?
          body = time.create_format
          [status, headers, body]
        else
          body = ["Unknown time format #{time.check_invalid_params}"]
          [400, headers, body]
        end
      end
    end

    private

    def status
      200
    end

    def headers
      {'Content-Type' => 'text/plain'}
    end

    def body
      ["Unknown url or format"]
    end 
end