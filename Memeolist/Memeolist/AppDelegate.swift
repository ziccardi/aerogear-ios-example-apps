import AGSAuth
import AGSSync
import Alamofire
import IQKeyboardManagerSwift
import UIKit

class AuthHeaderProvider: HeaderProvider {

    static let HEADER_TYPE = "Bearer "
    static let HEADER_KEY = "Authorization"

    let auth: AgsAuth

    init(_ auth: AgsAuth) {
        self.auth = auth
    }

    func getHeaders() -> [String: String] {
        do {
            let currentUser = try self.auth.currentUser()
            if let token = currentUser?.accessToken {
                return [AuthHeaderProvider.HEADER_KEY: AuthHeaderProvider.HEADER_TYPE + token]
            }
        } catch {
            // Intentionally empty when user is not logged in or auth is not enabled
        }
        return [:]
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true

        // create the authentication config
        let authenticationConfig = AuthenticationConfig(redirectURL: "memeolist://callback")
        try! AgsAuth.instance.configure(authConfig: authenticationConfig)
        if let transport = AgsSync.instance.transport {
            transport.headerProvider = AuthHeaderProvider(AgsAuth.instance)
        }
        if let user = try! AgsAuth.instance.currentUser() {
            print(user)
        } else {
            let rootViewController = LoginViewController()
            window?.rootViewController = UINavigationController(rootViewController: rootViewController)
            window?.makeKeyAndVisible()
            return true
        }
        
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey: Any] = [:]) -> Bool {
        do {
            return try AgsAuth.instance.resumeAuth(url: url as URL)
        } catch AgsAuth.Errors.serviceNotConfigured {
            print("AeroGear auth service is not configured")
        } catch {
            fatalError("Unexpected error: \(error).")
        }
        return false
    }
}
