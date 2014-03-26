class YoutubeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << (options[:message] || "- используются недопустимые символы") if value =~ /[^A-z0-9_-]/
  end
end
