require 'spec_helper'

describe 'API authentication' do
  let(:user) { create(:user) }

  it 'gets an authentication_token with a valid email/password' do
    post '/users/sign_in.json', user: { email: user.email, password: user.password }
    expect(response).to be_success
    expect(json['authentication_token']).to_not be_nil
  end

  it 'gets an error with an invalid email/password' do
    post '/users/sign_in.json', user: { email: user.email, password: "oops#{user.password}" }
    expect(response.status).to eq(401)
    expect(json['error']).to_not be_nil
  end
end
