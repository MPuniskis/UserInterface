import UIKit

public protocol NavigationVCActionResponder: class {
    func navigationVCDidSelectLogout()
}

public class NavigationVC: UIViewController {

    public weak var delegate: NavigationVCActionResponder?
    
    private lazy var logo: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.image = Media.logoDark.image
        img.widthAnchor.constraint(equalToConstant: 100).isActive = true
        img.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return img
    }()
    
    private lazy var logoutButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .clear
        btn.setImage(Media.logout.image, for: .normal)
        btn.heightAnchor.constraint(equalToConstant: 25).isActive = true
        btn.addTarget(self, action: #selector(logout(_:)), for: .touchUpInside)
        return btn
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.Testio.gray
        setupView()
    }
    
    private func setupView() {
        view.addSubview(logo)
        NSLayoutConstraint.activate([
            logo.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            logo.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
            ])
        
        view.addSubview(logoutButton)
        NSLayoutConstraint.activate([
            logoutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            logoutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
            ])
    }
}

extension NavigationVC {
    
    @objc func logout(_ sender: UIButton) {
        delegate?.navigationVCDidSelectLogout()
    }
}

