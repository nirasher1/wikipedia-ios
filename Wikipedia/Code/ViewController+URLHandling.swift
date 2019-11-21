import Foundation

extension NSUserActivity {
    static func wikipediaActivity(with url: URL, configuration: Configuration) throws -> NSUserActivity {
        let info = try configuration.activityInfo(with: url)
        let type = "org.wikimedia.wikipedia.\(info.type.rawValue)"
        let activity = NSUserActivity(activityType: type)
        activity.webpageURL = url
        return activity
    }
}

@objc extension UIViewController {
    @objc(wmf_navigateToActivityWithURL:error:)
    public func navigateToActivity(with url: URL) throws {
        let activity = try NSUserActivity.wikipediaActivity(with: url, configuration: Configuration.current)
        NotificationCenter.default.post(name: .WMFNavigateToActivity, object: activity)
    }
}

