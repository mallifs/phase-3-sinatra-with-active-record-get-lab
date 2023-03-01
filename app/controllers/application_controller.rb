class ApplicationController < Sinatra::Base
  set :default_content_type, :json
  # add routes
  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end
  
  get '/baked_goods/by_price' do
    bakedByPrice = BakedGood.by_price
    bakedByPrice.to_json
  end

  
  get '/baked_goods/most_expensive' do
    baked_good = BakedGood.by_price.first
    baked_good.to_json
  end


end
