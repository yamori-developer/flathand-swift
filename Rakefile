project_name = "auHome"

desc "Initial setup"
task :setup do
  sh "brew install rbenv ruby-build rbenv-binstubs swiftlint mono0926/license-plist/license-plist node jq"
  sh "npm install"
  sh "echo 'if ! [[ $PATH =~ \"shims\" ]]; then eval \"$(rbenv init -)\" && source ~/.bash_profile; fi' >> ~/.bash_profile"
  sh "rbenv install `cat .ruby-version`" do |is_success, status|
    p "WARN: ignore error." unless is_success
  end
  sh "gem install bundler"
  Rake::Task["update"].invoke
end

desc "Open workspace"
task :open do
  sh "open #{project_name}.xcworkspace"
end

desc "library update"
task :update do
  sh "bundle install"
  sh "pod repo update"
  sh "pod install"
# sh "carthage checkout"
# sh "carthage build --platform iOS"
end

desc "run synx"
task :synx do |t|
  sh "synx #{project_name}.xcodeproj/"
end

desc "Mock起動"
task :mock do |t|
  #sh "$(npm bin)/stubcell -e stub-api/entry.yml -p 8081 &"
  sh "/Users/yamori-developer/git/src/github.kddi.com/yamori/yamori-ios/node_modules/.bin/stubcell -e stub-api/entry.yml -p 8081 &"
end

desc "Firebase Crash Reportingを表示"
task :cr do |t|
  sh "open https://console.firebase.google.com/u/1/project/yamori-dev-157fc/monitoring/app/ios:com.kddi.auhome/crash"
end

desc "Google Analyticsを表示(PRD)"
task :ga do |t|
  sh "open https://analytics.google.com/analytics/web/?authuser=2#/embed/report-home/a111253071w165873883p170809643"
end
desc "Google Analyticsを表示(DEV)"
task :ga_dev do |t|
  sh "open https://analytics.google.com/analytics/web/?authuser=2#/report-home/a111253071w165908351p170654018"
end

desc "cocoapods付きplayground起動"
task :playground do |t|
  p "起動したらimport HydraAsyncをHydraに書き換えて, ⌘+Bで一度ビルドすること"
  # 使いたいライブラリがあったら,で複数並べる
  sh "cd Playgrounds; pod playgrounds HydraAsync,ObjectMapper"
end
