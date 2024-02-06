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

      get '/cats', as: :json

      cat = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(cat.length).to eq 1
    end
  end

  describe "POST /create" do
    it "creates a cat" do
      cat_params = {
        cat: {
          name: 'Captain Midnight',          
          age: 5,
          enjoys: 'Stealthy night prowler Captain Midnight seeks an adventurous partner for moonlit escapades. With a love for the shadows and midnight snacks, he\'s all about the thrill of the hunt under starry skies.',
          image: 'http://tinyurl.com/3989srhn'
        }
      }

      post '/cats', params: cat_params, as: :json

      cat = Cat.first
      expect(response).to have_http_status(200)
      expect(cat.name).to eq 'Captain Midnight'
    end
  end

  describe "PUT /update" do
    it "updates a cat" do
      cat = Cat.create(
        name: 'Sir Whiskerton the Brave',
        age: 2, 
        enjoys: 'Knighted for his bravery against vacuums, Sir Whiskerton seeks a tuna-loving hero with box-sitting prowess. Dislikes dogs, loves can-opening allies.',
        image: 'http://tinyurl.com/22357jc4'
      )

      cat_params = {
        cat: {
          name: 'Sir Whiskerton the Brave',
          age: 3,
          enjoys: 'Knighted for his bravery against vacuums, Sir Whiskerton seeks a tuna-loving hero with box-sitting prowess. Dislikes dogs, loves can-opening allies.',
          image: 'http://tinyurl.com/22357jc4'
        }
      }

      put "/cats/#{cat.id}", params: cat_params, as: :json

      cat = Cat.first
      expect(response).to have_http_status(200)
      expect(cat.age).to eq 3
    end
  end

  describe "DELETE /destroy" do
    it "deletes a cat" do
      cat = Cat.create(
        name: 'Sir Whiskerton the Brave',
        age: 2, 
        enjoys: 'Knighted for his bravery against vacuums, Sir Whiskerton seeks a tuna-loving hero with box-sitting prowess. Dislikes dogs, loves can-opening allies.',
        image: 'http://tinyurl.com/22357jc4'
      )

      delete "/cats/#{cat.id}"

      cats = Cat.all
      expect(response).to have_http_status(200)
      expect(cats.length).to eq 0
    end
  end  
end