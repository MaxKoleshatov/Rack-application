# frozen_string_literal: true

class AllTime
  TIME_FORMAT = { 'year' => '%Y', 'month' => '%m', 'day' => '%d', 'hour' => '%H', 'minute' => '%M',
                  'second' => '%S' }.freeze

  def initialize(params)
    @params = params.split(',')
  end

  def create_format
    data = params

    format = data.map { |meaning| TIME_FORMAT[meaning] }.join('/')
    [Time.now.strftime(format)]
  end

  def invalid_params
    params - TIME_FORMAT.keys
  end

  def check_invalid?
    invalid_params.empty?
  end

  private

  attr_reader :params
end
