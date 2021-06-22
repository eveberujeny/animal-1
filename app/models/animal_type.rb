class AnimalType < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '犬'},
    { id: 3, name: '猫'},
    { id: 4, name: '鳥'},
    { id: 5, name: '小動物'},
    { id: 6, name: 'その他'},
  ]
  include ActiveHash::Associations
  has_many :animals
end