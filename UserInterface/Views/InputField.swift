import UIKit

final class InputField: UITextField {
    
    private let padding: CGFloat = 10
    override init(frame: CGRect) {
        super.init(frame: frame)
        autocorrectionType = .no
        autocapitalizationType = .none
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: frame.height))
        leftViewMode = .always
        tintColor = .black
        font = font?.withSize(14)
        backgroundColor = .white
    }
    
    func setLeftIcon(_ icon: UIImageView) {
        
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: icon.bounds.width + 15, height: icon.bounds.height))
        containerView.backgroundColor = .clear
        containerView.addSubview(icon)
        leftView = containerView
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += 20
        return textRect
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
