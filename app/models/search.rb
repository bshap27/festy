class Search #lifted from medisearch
  attr_accessor :search_term
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  def persisted?
    false
  end
end