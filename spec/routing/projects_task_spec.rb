require 'rails_helper'

describe "projects_task routing" do
  it "routes post /projects/:project_id/tasks to tasks#create " do
    expect(post: "/projects/1/tasks").to route_to(
      controller: "tasks",
      project_id: "1",
      action: "create"
    )
  end
  it "routes get /projects/:project_id/tasks/:id/edit to tasks#edit " do
    expect(get: "/projects/1/tasks/3/edit").to route_to(
      controller: "tasks",
      action: "edit",
      project_id: "1",
      id: "3"
    )
  end
  it "routes patch /projects/:project_id/tasks/:id to tasks#update " do
    expect(patch: "/projects/4/tasks/1").to route_to(
      controller: "tasks",
      action: "update",
      project_id: "4",
      id: "1"
    )
  end
  it "routes put /projects/:project_id/tasks/:id to tasks#update " do
    expect(put: "/projects/5/tasks/1").to route_to(
      controller: "tasks",
      action: "update",
      project_id: "5",
      id: "1"
    )
  end
  it "routes delete /projects/:project_id/tasks/:id to tasks#destroy " do
    expect(delete: "/projects/6/tasks/1").to route_to(
      controller: "tasks",
      action: "destroy",
      project_id: "6",
      id: "1"
    )
  end
end