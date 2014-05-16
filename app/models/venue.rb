class Venue
  include Mongoid::Document
  field :name, type: String
  field :address, type: String
  field :date, type: String
  field :compensation, type: String
  field :typeofmusic, type: String
end
