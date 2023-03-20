class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  @@image_urls = {"laptop" => "https://m.media-amazon.com/images/I/61Dw5Z8LzJL._SX522_.jpg",
                  "mouse" =>  "https://m.media-amazon.com/images/I/61onAgKP5gL._SX522_.jpg",
                  "bag" =>    "https://m.media-amazon.com/images/I/61OwgmN6VyL._UL1500_.jpg",
                  "clothing" => "https://m.media-amazon.com/images/I/31b0YaEm4xL.jpg",
                  "bottle" => "https://m.media-amazon.com/images/I/71XPs4whHSL._SL1500_.jpg",
                  "mobile" => "https://m.media-amazon.com/images/I/71emcsxsRPL._SX679_.jpg"
  }


end
