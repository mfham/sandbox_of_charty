require 'faker'

30.times do
  page_id = Faker::Number.number(digits: 10)
  last_update_at = Faker::Date.between(from: '2020-01-01', to: '2021-09-30').strftime('%Y/%m')
  name = Faker::Name.name

  puts [page_id, last_update_at, name].join(',')
end
