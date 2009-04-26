class Attachment < ActiveRecord::Base
  has_attached_file :file,
      :styles => {
        :tiny => "42x42#",
        :preview => "175x175",
        :large => "300x300"
      }, 
      :storage => :s3,
      :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
      :path => ":attachment/:id/:style.:extension",
      :bucket => 'smut_kb'
end
