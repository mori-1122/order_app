# frozen_string_literal: true

class EmailFormatValidator < ActiveModel::EachValidator
  REGEXP = /\A[\w\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  def validate_each(record, attribute, value)
    record.errors.add(attribute, options[:message] || 'の形式が正しくありません') unless value.present? && REGEXP.match?(value)
  end
end
