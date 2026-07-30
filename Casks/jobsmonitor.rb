cask "jobsmonitor" do
  version "2.1.0"
  sha256 "64cee57de4128f2843fabfee256ae1d26a9f4088aa00242d5e99740c3621b0e3"

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
