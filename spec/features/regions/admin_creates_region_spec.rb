require 'rails_helper'

#this was done in class on 2-23-21

RSpec.describe 'Creating a Region', type: :feature do

    let(:admin) { create(:user, :admin)}

    it 'succeeds meow' do 
        region_name = 'Fake Region Meow'
        log_in_as(admin)
        #click regions, meow
        click_on 'Regions'
        #click 'add region', meow
        click_on 'Add Region' # meow
        #click 'name field', meow
        #type the name of the region, meow
        fill_in 'Name', with: 'Fake Region Meow'
        #click on 'add region', meow
        click_on 'Add Region'
        #I should see the name of the new region
        expect(page.body).to have_text('Region successfully created')
        #I should see 'sucessfully created', meow
        expect(page.body).to have_text(region_name)
    end
    
    it 'fails when the name is missing' do 
        log_in_as(admin)
        click_on 'Regions'
        click_on 'Add Region'
        # fill_in 'Name', with: '' 
        click_on 'Add Region'
        expect(page.body)to have_text('errors')
    end    
end
