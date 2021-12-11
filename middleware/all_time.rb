class AllTime

    TIME_FORMAT = {"year" => "%Y", "month" => "%m", "day" => "%d", "hour" => "%H", "minute" => "%M", "second" => "%S"}

    attr_reader :params

    def initialize(params)
      @params = params.split(",")
    end

    def create_format
      data = self.params

      data_format = []

      data.each do |meaning|
        data_format << TIME_FORMAT[meaning]
    end
      format = data_format*"/"
      [Time.now.strftime(format)]
    end

    def check_invalid_params
      params - TIME_FORMAT.keys
    end

    def check_invalid?
      check_invalid_params.empty?
    end
end