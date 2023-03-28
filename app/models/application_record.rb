class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  @@image_urls = {
    "laptop" => "https://m.media-amazon.com/images/I/61Dw5Z8LzJL._SX522_.jpg",
    "mouse" => "https://m.media-amazon.com/images/I/61onAgKP5gL._SX522_.jpg",
    "bag" => "https://m.media-amazon.com/images/I/61OwgmN6VyL._UL1500_.jpg",
    "clothing" => "https://m.media-amazon.com/images/I/31b0YaEm4xL.jpg",
    "bottle" => "https://m.media-amazon.com/images/I/71XPs4whHSL._SL1500_.jpg",
    "mobile" => "https://m.media-amazon.com/images/I/71emcsxsRPL._SX679_.jpg",
    "id_card" => "https://m.media-amazon.com/images/I/411wf82p-GL.jpg",
    "desktop" => "https://m.media-amazon.com/images/I/71kDCavI6JS._AC_UY218_.jpg",
    "keyboard" => "https://m.media-amazon.com/images/I/61+U9lMboFL._AC_UY218_.jpg",
    "headset" =>   "https://m.media-amazon.com/images/I/61HBpQuLjVL._AC_UY218_.jpg",
    "charger" => "https://m.media-amazon.com/images/I/517cafPYn3L._AC_UL320_.jpg",
    "others" => "https://www.hsvphry.org.in/assets/img/AuthorityMember/image_202208231512_637968643401675127.jpg"
  }
end
