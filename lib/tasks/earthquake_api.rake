namespace :earthquake_api do
  desc 'Synchronizing API data'
  task get_data: :environment do
    puts 'Getting data from earthquake.usgs.gov...'
    puts Geofeatures::GeofeaturesService.call(params: {
      start_time: '2024-03-06 2000:00:00',
      end_time: '2024-04-05 2023:59:59',
      minmagnitude: '2.5',
      order_by: 'time'
    })
  end
end
