public final class KeyBar: UIView {
    
    private lazy var leftLabel: UILabel = {
        let lbl = label
        lbl.textAlignment = .left
        return lbl
    }()
    
    private lazy var rightLabel: UILabel = {
        let lbl = label
        lbl.textAlignment = .right
        return lbl
    }()
    
    private var label: UILabel {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor.Testio.gray
        return lbl
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    public override func layoutSubviews() {
        layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        layer.shadowPath = UIBezierPath(rect: CGRect(x: -20, y: frame.height - (20 * 0.4), width: frame.width + 20 * 2, height: 20)).cgPath
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.5
    }
    
    private func setupView() {
        backgroundColor = .white
        addSubview(leftLabel)
        addSubview(rightLabel)
        NSLayoutConstraint.activate([
            leftLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            leftLabel.topAnchor.constraint(equalTo: self.topAnchor),
            leftLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
        NSLayoutConstraint.activate([
            rightLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            rightLabel.topAnchor.constraint(equalTo: self.topAnchor),
            rightLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
    }
    
    public func set(leftKey: String, rightKey: String) {
        leftLabel.text = leftKey
        rightLabel.text = rightKey
    }
}
