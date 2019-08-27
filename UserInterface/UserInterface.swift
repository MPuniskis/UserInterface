import UIKit

public final class UserInterface: NSObject {
    
    internal static var bundle: Bundle {
        return Bundle(for: self)
    }
    
    public func loginVC(actionResponder: LoginVCActionResponder?) -> UIViewController {
        let vc = LoginVC(nibName: nil, bundle: nil)
        vc.delegate = actionResponder
        return vc
    }
}
