# frozen_string_literal: true

require_relative 'middleware/all_time'

class App
  def call(env)
    @request = Rack::Request.new(env)

    if @request.params['format'].nil?
      [404, {}, ['Empty format']]
    else
      create_time
    end
  end

  def create_time
    time = AllTime.new(@request.params['format'])

    if time.check_invalid?
      body = time.create_format
      Rack::Response.new(body).finish
    else
      body = ["Unknown time format #{time.invalid_params}"]
      [400, {}, body]
    end
  end
end
