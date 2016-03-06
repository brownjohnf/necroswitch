namespace :switches do
  task check: :environment do
    loop do
      Switch.check
      Switch.where("created_at < ?", 7.days.ago).destroy_all

      sleep 60
    end
  end
end

