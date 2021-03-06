require "csv"

WORK_FILE = Rails.root.join('db', 'media_seeds.csv')
puts "Loading raw media (work) data from #{WORK_FILE}"

work_failures = []
CSV.foreach(WORK_FILE, :headers => true) do |row|
  work = Work.new
  work.title = row['title']
  work.category = row['category']
  work.creator = row['creator']
  work.publication = row['publication_year'].to_i
  work.description = row['description']
  successful = work.save
  if !successful
    work_failures << work
    # puts "Failed to save work: #{work.inspect}"
  else
    # puts "Created work: #{work.inspect}"
  end
end

puts "Total: #{Work.count} work records"
puts "#{work_failures.length} works failed to save"
