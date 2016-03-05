namespace :switches do
  task check: :environment do
    Switch.check
  end
end

