require 'rails_helper'

describe "devise registrations routing" do
  it "routes get /users/sign_up to registrations#new " do
    expect(get: "/users/sign_up").to route_to(
      controller: "registrations",
      action: "new"
    )
  end
  it "routes post /users/sign_up to registrations#create " do
    expect(post: "/users/sign_up").to route_to(
      controller: "registrations",
      action: "create"
    )
  end
  it "routes delete /users/sign_up to registrations#create " do
    expect(delete: "/users/sign_up").to route_to(
      controller: "registrations",
      action: "destroy"
    )
  end

  it "does not expose a patch" do
    expect(patch: "/users/sign_up").not_to be_routable
  end

  it "does not expose a put" do
    expect(put: "/users/sign_up").not_to be_routable
  end
end