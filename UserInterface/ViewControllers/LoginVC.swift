import UIKit

public protocol LoginVCActionResponder: class {
    func loginVCDidSelectLogin(with loginData: LoginData)
}

public typealias LoginData = (userName: String, password: String)

internal final class LoginVC: UIViewController {
    
    public weak var delegate: LoginVCActionResponder?
    
    private var cornerRadius: CGFloat { return 5 }
    private var controlHeight: CGFloat { return 55 }
    
    private lazy var background: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.image = Media.background.image
        return img
    }()
    
    private lazy var logo: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.image = Media.logoWhite.image
        img.widthAnchor.constraint(equalToConstant: 150).isActive = true
        img.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return img
    }()
    
    private lazy var user: InputField = {
        let u = inputField
        u.placeholder = "Username"
        let icon = UIImageView(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        icon.image = Media.user.image
        u.setLeftIcon(icon)
        return u
    }()
    
    private lazy var pass: InputField = {
        let p = inputField
        p.placeholder = "Password"
        let icon = UIImageView(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        icon.image = Media.password.image
        p.setLeftIcon(icon)
        p.isSecureTextEntry = true
        return p
    }()
    
    private var inputField: InputField {
        let e = InputField()
        e.layer.cornerRadius = cornerRadius
        e.translatesAutoresizingMaskIntoConstraints = false
        e.leftViewMode = .always
        e.heightAnchor.constraint(equalToConstant: controlHeight).isActive = true
        return e
    }
    
    private lazy var loginControls: UIStackView = {
        let lc = UIStackView()
        lc.translatesAutoresizingMaskIntoConstraints = false
        lc.axis = .vertical
        lc.spacing = 10
        lc.addArrangedSubview(user)
        lc.addArrangedSubview(pass)
        lc.addArrangedSubview(loginButton)
        lc.widthAnchor.constraint(equalToConstant: 250).isActive = true
        return lc
    }()

    private lazy var loginButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.backgroundColor = UIColor.Testio.green
        btn.layer.cornerRadius = cornerRadius
        btn.setTitle("Log In", for: .normal)
        btn.heightAnchor.constraint(equalToConstant: controlHeight).isActive = true
        btn.addTarget(self, action: #selector(login(_:)), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        setupView()
    }
    
    private func setupView() {
        
        view.addSubview(background)
        background.fill(view)
        
        view.addSubview(logo)
        NSLayoutConstraint.activate([
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.topAnchor.constraint(equalTo: view.topAnchor, constant: 150)
            ])
        
        view.addSubview(loginControls)
        NSLayoutConstraint.activate([
            loginControls.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginControls.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 150)
            ])
    }
}

extension LoginVC {
    
    @objc func login(_ sender: UIButton) {
        
        guard
            let username = user.text, !username.isEmpty,
            let password = pass.text, !password.isEmpty
        else {
            //Show alert
            let alert = UIAlertController(title: "Missing credentials", message: "Username and password can not be empty", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            return
        }
        delegate?.loginVCDidSelectLogin(with: (userName: username, password: password))
    }
}

extension LoginVC {
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}
