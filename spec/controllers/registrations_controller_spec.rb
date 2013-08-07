require 'spec_helper'

describe RegistrationsController do
  it 'create' do
    #post :create, :user => {:nickname => 'Jack', :email => 'jack@ukr.net', :password => '123123123', :password_confirmation => '123123123'}
    #post :create, :user => {"utf8"=>"✓", "authenticity_token"=>"MHtn6KI2+tFmB6qkRcxOAgFz+AcYPZuHnXFCILF/oNI=", "user"=>{"nickname"=>"Jjjjjjjjjj", "email"=>"jjjjjjjjj@ukr.net", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}, "captcha"=>"XRDJT", "captcha_key"=>"d00313c6d0918e5bebd5ee453bedd96ab7b5f6a7", "commit"=>"Sign up"}
  end
end