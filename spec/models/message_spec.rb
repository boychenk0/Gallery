# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  body       :string(255)      not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#

require 'spec_helper'

describe Message do
  #pending "add some examples to (or delete) #{__FILE__}"
end
