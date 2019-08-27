import UIKit

public final class ServerListCell: UITableViewCell {

    private lazy var server: UILabel = {
        let lbl = label
        lbl.textAlignment = .left
        return lbl
    }()
    
    private lazy var distance: UILabel = {
        let lbl = label
        lbl.textAlignment = .right
        return lbl
    }()
    
    private var label: UILabel {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor.Testio.darkGray
        return lbl
    }

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(server)
        NSLayoutConstraint.activate([
            server.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            server.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ])
        
        addSubview(distance)
        NSLayoutConstraint.activate([
            distance.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            distance.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ])
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        server.text = ""
        distance.text = ""
    }
    
    public func set(server: String, distance: String) {
        self.server.text = server
        self.distance.text = distance
    }
}
