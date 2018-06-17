require 'rails_helper'

describe "devise sessions routing" do
  it "routes get /users/sign_in to sessions#new " do
    expect(get: "/users/sign_in").to route_to(
      controller: "sessions",
      action: "new"
    )
  end
  it "routes post /users/sign_in to sessions#create " do
    expect(post: "/users/sign_in").to route_to(
      controller: "sessions",
      action: "create"
    )
  end
  it "routes delete /users/sign_out to sessions#create " do
    expect(delete: "/users/sign_out").to route_to(
      controller: "sessions",
      action: "destroy"
    )
  end

  it "does not expose a patch" do
    expect(patch: "/users/sign_in").not_to be_routable
  end

  it "does not expose a put" do
    expect(put: "/users/sign_in").not_to be_routable
  end
end