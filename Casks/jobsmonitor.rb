cask "jobsmonitor" do
  version "2.0.1"
  sha256 "e1315187f0b8d22c46e9a85e058eba680cf1b40f996908027ac0680a97cd49b1"

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
