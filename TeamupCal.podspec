Pod::Spec.new do |s|

  s.name         = "TeamupCal"
  s.platform     = :ios, "9.0"
  s.requires_arc = true

  s.version      = "0.1.0"
  s.summary      = "Calendar management for Teamup services."
  s.description  = <<-DESC
  					Swift framework with calendar management for Teamup services.
                   DESC

  s.homepage          = "https://github.com/amrap-labs/TeamupCal"
  s.license           = "MIT"
  s.author            = { "Merrick Sapsford" => "merrick@sapsford.tech" }
  s.social_media_url  = "http://twitter.com/MerrickSapsford"

  s.source       = { :git => "https://github.com/amrap-labs/TeamupCal.git", :tag => s.version.to_s }
  s.source_files = "Sources/TeamupCal/**/*.{h,m,swift}"

  s.dependency 'TeamupKit', '~> 0.1'

end
