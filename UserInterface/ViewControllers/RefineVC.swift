import UIKit

public protocol RefineVCDelegate: class {
    func refineVCDidSelect(itemAtIndex index: Int)
}

public final class RefineVC: UIViewController {
    
    public weak var delegate: RefineVCDelegate?
    
    private var actions: [String]?
    
    private lazy var refineButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(Media.sort.image, for: .normal)
        btn.backgroundColor = UIColor.Testio.violet
        btn.addTarget(self, action: #selector(refineTapped(_:)), for: .touchUpInside)
        return btn
    }()
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.Testio.gray
        setupView()
    }
    
    private func setupView() {
        view.addSubview(refineButton)
        refineButton.fill(view)
    }
    
    public func setRefineActions(_ actions: [String]) {
        self.actions = actions
    }
}

extension RefineVC {
    
    @objc private func refineTapped(_ sender: UIButton) {
        
        guard let parent = self.parent, let actions = actions else { return }
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.view.translatesAutoresizingMaskIntoConstraints = false
        
        actions.enumerated().forEach({
            let action = UIAlertAction(title: $0.element, style: .default, handler: {  [weak self] a in
                DispatchQueue.main.async {
                    if let index = alert.actions.firstIndex(of: a) {
                        self?.delegate?.refineVCDidSelect(itemAtIndex: index)
                    }
                }
            })
            alert.addAction(action)
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancel)
        parent.present(alert, animated: true, completion: nil)
    }
}
