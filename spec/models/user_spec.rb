require 'spec_helper'

describe User do

  describe "#name" do
    subject do
      OpenStruct.new(first_name: 'Yukihiro',
                     last_name: 'Matsumoto')
    end
    before { subject.extend(User) }

    its(:name) { should eq('Yukihiro Matsumoto') }
  end

end
