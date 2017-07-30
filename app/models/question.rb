class Question < ApplicationRecord
  acts_as_mappable :default_units => :miles,
                 :default_formula => :sphere,
                 :distance_field_name => :distance,
                 :lat_column_name => :lat,
                 :lng_column_name => :lng
  # has_attached_file :image, styles: { square: '200x200#' },
  #               default_url: "/images/:style/missing.png",
  #               storage: :s3,
  #               s3_credentials: Proc.new{ |a| a.instance.s3_credentials }
  #
  # validates :clue_image, :presence => true
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :quest_id, :question_text, :answer, :hint, :clue_type, :clue_text, :lat, :lng,
    presence: true

  # def s3_credentials
  #  {:bucket => ENV['S3_BUCKET_NAME'], :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
  #    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'], :s3_region => ENV['AWS_REGION']}
  # end

  belongs_to :quest
  has_many :guesses, class_name: 'Result'
end
