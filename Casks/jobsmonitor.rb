cask "jobsmonitor" do
  version "2.3.4"
  sha256 "8b52960d9335ad0a2f0e1d1adec5002070cb4f1e0c75f0c683f369ee5986ff17"

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
