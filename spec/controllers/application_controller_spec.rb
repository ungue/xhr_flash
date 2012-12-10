require 'spec_helper'

describe ApplicationController do
  describe "AJAX request" do
    describe "with success flash" do
      before do
        xhr :get, :get_with_success_flash
      end

      it 'should return 200 ok' do
        response.code.should == '200'
      end

      it 'should return X-Flash-Success attribute in response header' do
        response.header.should have_key('X-Flash-Success')
      end
    end
  end
end
