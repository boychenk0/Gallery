# == Schema Information
#
# Table name: events
#
#  id             :integer          not null, primary key
#  user_id        :integer          not null
#  eventable_type :string(255)      not null
#  eventable_id   :integer          not null
#  created_at     :datetime         not null
#

require 'spec_helper'

describe Event do
  #pending "add some examples to (or delete) #{__FILE__}"
end
