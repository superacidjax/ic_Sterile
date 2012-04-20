require 'spec_helper'

describe Guest do

  its(:first_name) { should eq('Guest') }

end
