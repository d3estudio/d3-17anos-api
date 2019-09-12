class Guest < ApplicationRecord
  enum bond: [ :member, :partner, :client, :escort ]
end
