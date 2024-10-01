import DivKit
import Foundation
import UIKit

final class DivKitActionHandler: DivUrlHandler {
    func handle(_ url: URL, info _: DivActionInfo, sender _: AnyObject?) {
        guard let components = url.components, components.scheme == Constants.scheme else {
            return
        }
        
        switch components.host {
        case Constants.KnownHosts.toast:
            if let text = components.queryItems?.first?.name {
                showAlert(message: text)
            }
        default:
            return
        }
    }
    
    func showAlert(message: String) {
        Task { @MainActor in
            let keyWindow = UIApplication.shared.connectedScenes
                .filter {
                    $0.activationState == .foregroundActive
                }
                .compactMap { $0 as? UIWindowScene }
                .first?
                .windows
                .first {
                    $0.isKeyWindow
                }
            
            guard let keyWindow else {
                return
            }
            
            let alert = UIAlertController(title: "Sample alert", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            keyWindow.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
    
    private enum Constants {
        static let scheme = "sample-action"
        
        enum KnownHosts {
            static let toast = "toast"
        }
    }
}
