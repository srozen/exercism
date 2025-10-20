class LogLineParser
  LOG_REGEX = /\[(\w*)\]:(.*)/

  def initialize(line)
    results = LOG_REGEX.match(line)
    @log_level = results[1].strip.downcase
    @message = results[2].strip
  end

  def message
    @message
  end

  def log_level
    @log_level
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
