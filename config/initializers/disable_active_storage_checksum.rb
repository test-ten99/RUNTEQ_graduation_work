Rails.application.config.to_prepare do
  require "active_storage/service/s3_service"

  module DisableChecksumAndMetadataOnUpload
    def upload(key, io, checksum: nil, **options)
      instrument :upload, key: key, checksum: checksum do
        object = object_for(key)

        # Cloudflare R2 が受け付けないオプションを除外する
        sanitized_options = upload_options.merge(options).merge(body: io)
        sanitized_options.delete(:checksum)
        sanitized_options.delete(:custom_metadata)

        object.put(sanitized_options)
      end
    end
  end

  ActiveStorage::Service::S3Service.prepend(DisableChecksumAndMetadataOnUpload)
end
