require 'rails_helper'

describe "projects routing" do
  it "routes post /projects to projects#create " do
    expect(post: "/projects").to route_to(
      controller: "projects",
      action: "create"
    )
  end
  it "routes get /projects/:id/edit to projects#edit " do
    expect(get: "/projects/1/edit").to route_to(
      controller: "projects",
      action: "edit",
      id: "1"
    )
  end
  it "routes patch /projects/:id to projects#update " do
    expect(patch: "/projects/1").to route_to(
      controller: "projects",
      action: "update",
      id: "1"
    )
  end
  it "routes put /projects/:id to projects#update " do
    expect(put: "/projects/1").to route_to(
      controller: "projects",
      action: "update",
      id: "1"
    )
  end
  it "routes delete /projects/:id to projects#destroy " do
    expect(delete: "/projects/1").to route_to(
      controller: "projects",
      action: "destroy",
      id: "1"
    )
  end
end