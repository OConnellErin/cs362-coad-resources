require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the DashboardHelper. For example:
#
# describe DashboardHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe DashboardHelper, type: :helper do

    describe '#dashboard_for' do
        context 'admin users' do
            it 'returns admin_dashboard' do
                user = double()
                allow(user).to receive(:admin?) { true }
                expect(dashboard_for(user)).to eq('admin_dashboard')
            end
        end
        context 'organization users with a submitted oragnization' do
            it ' returns organization_submitted_dashboard' do
                user = double()
                allow(user).to receive(:admin?) { false }
                allow(user).to receive_message_chain(:oragnization, :submitted?) { true }
                expect(dashboard_for(user)).to eq('organization_submitted_dashboard')         
            end
        end
    end
end            

#this was covered in class 03/02/21