require 'rails_helper'

RSpec.describe Guest, type: :model do
  it do
    should define_enum_for(:bond).
      with_values([:member, :partner, :client, :escort])
  end
end
