require 'spec_helper'

describe MessagesController do
  describe "AJAX request" do
    describe "with success flash" do
      before do
        xhr :get, :success_flash
      end

      it 'should return 200 ok' do
        response.code.should == '200'
      end

      it 'should return X-Flash-Success attribute in response header' do
        response.header.should have_key('X-Flash-Success')
      end
    end
    
    describe "with error and warning flash" do
      before do
        xhr :get, :error_and_warning_flash
      end

      it 'should return 200 ok' do
        response.code.should == '200'
      end

      it 'should return X-Flash-Error and X-Flash-Warning attributes in response header' do
        response.header.should have_key('X-Flash-Error')
        response.header.should have_key('X-Flash-Warning')
      end
    end
  end

  describe "Html request" do
    describe "with success flash" do
      before do
        get :success_flash
      end

      it 'should return 200 ok' do
        response.code.should == '200'
      end

      it 'should not have X-Flash-Success attribute in response header' do
        response.header.should_not have_key('X-Flash-Success')
      end
    end
  end
end
