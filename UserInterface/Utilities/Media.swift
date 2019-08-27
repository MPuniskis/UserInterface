import Foundation

internal enum Media: String {
    
    case background = "background"
    case logoWhite = "logo-white"
    case logoDark = "logo-dark"
    case user = "user"
    case password = "lock"
    case logout = "logout"
    case sort = "sort"
    
    var image: UIImage? {
        return UIImage(named: self.rawValue, in: UserInterface.bundle, compatibleWith: nil)
    }
}
