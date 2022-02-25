class Ship < ActiveHash::Base
  self.date = [
    {id: 1, name: '__' },
    {id: 2, name: '12日で発送' },
    {id: 3, name: '23日で発送' },
    {id: 3, name: '４〜７日で発送' }

  ]
  include ActiveHash::Associations
  has_many :articles

end