require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it "gets a list of cats" do
      Cat.create(
        name: 'Sir Whiskerton the Brave',
        age: 2,
        enjoys: 'Knighted for his bravery against vacuums, Sir Whiskerton seeks a tuna-loving hero with box-sitting prowess. Dislikes dogs, loves can-opening allies.',
        image: 'http://tinyurl.com/22357jc4'
      )

      # Make a request
      get '/cats'

      cat = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(cat.length).to eq 1
    end
  end

  describe "POST /create" do
    it "creates a cat" do
      # The params we are going to send with the request
      cat_params = {
        cat: {
          name: 'Buster',
          age: 4,
          enjoys: 'Meow Mix, and plenty of sunshine.',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }
  
      # Send the request to the server
      post '/cats', params: cat_params
  
      # Assure that we get a success back
      expect(response).to have_http_status(200)
  
      # Look up the cat we expect to be created in the db
      cat = Cat.first
  
      # Assure that the created cat has the correct attributes
      expect(cat.name).to eq 'Buster'
    end
  end

  describe "PATCH /cats/:id" do
    let!(:cat) { Cat.create(name: 'Whiskers', age: 3, enjoys: 'Lounging in the sun', image: 'http://tinyurl.com/22357jc4') }
  
    it "updates a cat" do
      new_attributes = {
        cat: {
          name: 'Whiskers II',
          age: 4,
          enjoys: 'Chasing shadows',
          image: 'https://images.unsplash.com/photo-1583337130417-3346a1be7dee?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
        }
      }
  
      patch "/cats/#{cat.id}", params: new_attributes
  
      cat.reload
      expect(cat.name).to eq 'Whiskers II'
      expect(cat.age).to eq 4
      expect(cat.enjoys).to eq 'Chasing shadows'
      expect(cat.image).to eq new_attributes[:cat][:image]
      expect(response).to have_http_status(200)
    end
  end
end