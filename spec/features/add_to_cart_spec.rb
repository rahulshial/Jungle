require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99,
        image: open_asset('apparel1.jpg')
      )
    end
    User.create!(
      name: 'rahul',
      email: 'rahul@shial.com',
      password: '1234',
      password_confirmation: '1234')
  end
  scenario 'A user buys a product'  do
		#navigate to home page
    visit '/login'
    # page.find_link('Login').click
    fill_in 'email', with: 'rahul@shial.com'
    fill_in 'password', with: '1234'
    find('input[name="commit"]').click
    sleep(5)
    save_screenshot
    first('article.product').find_button('Add').click
    sleep(5)
    save_screenshot
    expect(page).to have_content('My Cart (1)')
    expect(page).to have_text 'My Cart (1)'
	end
end
