import SwiftUI
import GoogleMobileAds
/*
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        return true
    }
}
*/
@main
struct KPSSPuanHesaplamaApp: App {
    
    //@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    init() {
        setupAppearances()
    }

    private func setupAppearances() {
        let appearanceNav = UINavigationBarAppearance()
        appearanceNav.configureWithOpaqueBackground()
        UINavigationBar.appearance().standardAppearance = appearanceNav
        UINavigationBar.appearance().scrollEdgeAppearance = appearanceNav
        
        let appearanceTab = UITabBarAppearance()
        appearanceTab.configureWithOpaqueBackground()
        UITabBar.appearance().scrollEdgeAppearance = appearanceTab
        UITabBar.appearance().standardAppearance = appearanceTab
        GADMobileAds.sharedInstance().start(completionHandler: nil)
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .modelContainer(for: Result.self) // Bu satır, modelContainer kullanıyorsanız uncomment edilmelidir.
    }
}

