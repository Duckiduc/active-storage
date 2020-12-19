def migrate(from, to)
    configs = Rails.configuration.active_storage.service_configurations
    from_service = ActiveStorage::Service.configure from, configs
    to_service   = ActiveStorage::Service.configure to, configs
    
    ActiveStorage::Blob.service = from_service
    
    puts "#{ActiveStorage::Blob.count} Blobs to go..."
    
    ActiveStorage::Blob.find_each do |blob|
      if to_service.exist? blob.key
        puts "Already on service"
      else
        Blob.wrap(blob).download_to_tempfile do |file|
          checksum = blob.checksum
          to_service.upload(blob.key, file, checksum: checksum)
        end
      end
    rescue Errno::ENOENT
      puts "Rescued by Errno::ENOENT statement. ID: #{blob.id} / Key: #{blob.key}"
      next
    rescue ActiveStorage::FileNotFoundError
      puts "Rescued by FileNotFoundError. ID: #{blob.id} / Key: #{blob.key}"
      next
    end
  end
  
  namespace :storage do
    desc 'Migrate ActiveStorage files from local to Amazon S3'
    task migrate: :environment do
      migrate(:local, :amazon)
    end
  end
  