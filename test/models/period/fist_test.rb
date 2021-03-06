require 'test_helper'

class Period::FistTest < ActiveSupport::TestCase
  describe '#validations' do
    %i(type).each do |column|
      describe 'with inclusion' do
        subject { Period::Fist.new(column => 'invalid') }

        it "rejects a bad #{column} in validation" do
          assert subject.invalid?(column)
          assert_includes subject.errors[column], I18n.t('errors.messages.inclusion')
        end
      end
    end
  end
end
