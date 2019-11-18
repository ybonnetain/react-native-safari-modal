require "json"

package = JSON.parse(File.read(File.join(__dir__, "..", "package.json")))
version = package['version']

source = { :git => "https://gitlab.groupemutuel.ch/gce/mobile/react-native-safari-modal.git" }
source[:tag] = "v#{version}"

Pod::Spec.new do |s|
  s.name         = "RNSafariModalController"
  s.version      = version
  s.summary      = "RNSafariModalController"
  s.description  = "Opens a URL in SafariViewController presented in a modal"
  s.homepage     = "https://gitlab.groupemutuel.ch/gce/mobile/react-native-safari-modal"
  s.license      = "MIT"
  s.author       = { "author" => "ybonnetain@groupemutuel.ch" }
  s.platform     = :ios, "8.0"
  s.source       = source
  s.source_files = "RNSafariModalController/**/*.{h,m}"
  s.requires_arc = true

  s.dependency "React"

end
