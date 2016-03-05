namespace :switches do
  task check: :environment do
    loop do
      Switch.check

      sleep 60
    end
  end
end

