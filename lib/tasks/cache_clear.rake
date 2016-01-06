namespace :cache do
  task :clear do
    `rake tmp:cache:clear`
  end
end
