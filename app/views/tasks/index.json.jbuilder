json.array! @tasks.each do |task|
  json.title task.title
  json.description task.description
  json.priority task.priority
  json.completed task.completed
  json.note task.note
end