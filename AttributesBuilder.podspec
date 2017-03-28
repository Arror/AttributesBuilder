Pod::Spec.new do |s|
  s.name = 'AttributesBuilder'
  s.version = '0.0.2'
  s.license = 'MIT'
  s.summary = 'Attributes builder.'
  s.homepage = 'https://github.com/Arror/AttributesBuilder'
  s.authors = { 'Arror' => 'hallo.maqiang@gmail.com' }
  s.source = { git: 'https://github.com/Arror/AttributesBuilder.git', tag: s.version }
  s.source_files = 'Sources/*.swift'
  s.ios.deployment_target = '8.0'
end