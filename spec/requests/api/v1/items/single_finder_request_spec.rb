require 'rails_helper'

RSpec.describe 'Single find feature' do
  it 'can return a single result based on a name query param' do
    item = create(:item)

    get "/api/v1/items/find?name=#{item.name}"
    item_json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.content_type).to eq("application/json")
    expect(item_json.class).to eq(Hash)
    expect(item_json.size).to eq(1)
    expect(item_json[:data][:id]).to eq("#{item.id}")
    expect(item_json[:data][:type]).to eq('item')
    expect(item_json[:data][:attributes][:name]).to eq(item.name)
    expect(item_json[:data][:attributes][:unit_price]).to eq(item.unit_price)
    expect(item_json[:data][:attributes][:description]).to eq(item.description)
    expect(item_json[:data][:attributes][:merchant_id]).to eq(item.merchant_id)
  end

  it 'can return a single result based on a id query param' do
    item = create(:item)

    get "/api/v1/items/find?id=#{item.id}"
    item_json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.content_type).to eq("application/json")
    expect(item_json.class).to eq(Hash)
    expect(item_json.size).to eq(1)
    expect(item_json[:data][:id]).to eq("#{item.id}")
    expect(item_json[:data][:type]).to eq('item')
    expect(item_json[:data][:attributes][:name]).to eq(item.name)
    expect(item_json[:data][:attributes][:unit_price]).to eq(item.unit_price)
    expect(item_json[:data][:attributes][:description]).to eq(item.description)
    expect(item_json[:data][:attributes][:merchant_id]).to eq(item.merchant_id)
  end
end
