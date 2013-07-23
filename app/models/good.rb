class Good < ActiveRecord::Base
  belongs_to :goods_type
  validates_presence_of :name,:message => "产品名称不为空"
   validates_presence_of :desc,:message => "产品口味特色不为空"
  validates_uniqueness_of :name,:message => "产品名称已经被使用"
  validates_presence_of :weight,:message => "产品重量不为空"
  validates_presence_of :makeing,:message => "产品制作方法不为空"
  validates_presence_of :cuisines,:message => "产品菜系不为空"
  validates_presence_of :burden,:message => "产品配料不为空"
   validates_presence_of :s_d,:message => "菜品特色不为空"
end

