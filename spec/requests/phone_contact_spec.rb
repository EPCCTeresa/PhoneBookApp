require 'rails_helper'
require 'factories/phone_contact'

RSpec.describe "PhoneContacts", type: :request do
  let(:headers) { { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' } }
  let(:phone_contact) { create (:phone_contact) }
  describe "GET /index" do
    let(:expected_body) {
      [{
        "id": phone_contact.id,
        "firstname": "Bruce",
        "lastname": "Wayne",
        "phone": "12345678",
        "created_at": phone_contact.created_at,
        "updated_at": phone_contact.updated_at,
        "url": "http://www.example.com/phone_contacts/#{phone_contact.id}.json"
      }] }
    context 'when no contacts created' do
      it 'returns no error' do
        get '/phone_contacts', headers: headers
        expect(response.status).to eq 200
      end
    end
    context 'when contacts created' do
      it 'returns one contact' do
        phone_contact
        get '/phone_contacts', headers: headers
        should render_template(:index)
        expect(response.body).to eq expected_body.to_json
      end
    end
  end

  describe "GET /show" do
    context 'when contacts created' do
      it 'returns no error' do
        get "/phone_contacts/#{phone_contact.id}", headers: headers
        expect(response.status).to eq 200
        should render_template(:show)
      end
    end
  end

  describe "POST /create" do
    context 'when contacts with required params' do
      let!(:create_params) do
        { id: phone_contact.id, firstname: "Simba", lastname: "El marino" }
      end
      it 'creates a new instance' do
        post "/phone_contacts/", params: create_params.to_json, headers: headers
        expect(response.status).to eq 201
        should render_template(:show)
      end
    end
  end

  describe "PUT /update" do
    let!(:update_params) do
      { id: phone_contact.id, firstname: "Simba", lastname: "El marino" }
    end
    it 'redirects to show' do
      patch "/phone_contacts/#{phone_contact.id}", params: update_params.to_json, headers: headers
      expect(response.status).to eq 200
      should render_template(:show)
    end
  end

  describe "DELETE /destroy" do
    context 'when contacts created' do
      let!(:update_params) do
        { id: phone_contact.id, firstname: "Simba", lastname: "El marino" }
      end
      it 'deletes given contact' do
        delete "/phone_contacts/#{phone_contact.id}", headers: headers
        expect(response.status).to eq 204
      end
    end
  end
end
