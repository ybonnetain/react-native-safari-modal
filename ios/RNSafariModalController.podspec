require "json"

package = JSON.parse(File.read(File.join(__dir__, "..", "package.json")))
version = package['version']

source = { :git => "https://github.com/ybonnetain/react-native-safari-modal.git" }
source[:tag] = "#{version}"

Pod::Spec.new do |s|
  s.name         = "RNSafariModalController"
  s.version      = version
  s.summary      = "RNSafariModalController"
  s.description  = "Opens a URL in SafariViewController presented in a modal"
  s.homepage     = "https://github.com/ybonnetain/react-native-safari-modal"
  s.license      = "MIT"
  s.author       = { "author" => "yann.bonnetain@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = source
  s.source_files = "**/*.{h,m}"
  s.requires_arc = true

  s.dependency "React"

end
