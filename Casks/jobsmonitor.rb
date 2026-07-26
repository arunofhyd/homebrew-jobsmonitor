cask "jobsmonitor" do
  version "2.0.5"
  sha256 "415edb960230f71a26c98a073daf9135d13fe3136c890d8ce08236b059c4362e"

  url "https://github.com/arunofhyd/JobsMonitor/releases/download/v#{version}/JobsMonitor.zip"
  name "Jobs Monitor"
  desc "Native macOS menu bar app for Apple job postings"
  homepage "https://github.com/arunofhyd/JobsMonitor"

  livecheck do
    url "https://raw.githubusercontent.com/arunofhyd/JobsMonitor/main/version.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on macos: ">= :monterey"

  app "JobsMonitor.app"

  uninstall quit:      "com.aoh.jobsmonitor",
            launchctl: "com.aoh.jobsmonitor"

  zap trash: [
    "~/Library/Application Support/JobsMonitor",
    "~/Library/Logs/JobsMonitor",
    "~/Library/Preferences/com.aoh.jobsmonitor.plist",
  ]
end
