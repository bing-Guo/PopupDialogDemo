import UIKit

class SampleOneViewController: UIViewController {
    let iconImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "favorite")?.withRenderingMode(.alwaysTemplate)
        view.tintColor = .systemPink
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let describeLabel: UILabel = {
        let label = UILabel()
        label.text = """
        Hello, This is a dialog demo.
        Hello, This is a dialog demo.
        Hello, This is a dialog demo.
        Hello, This is a dialog demo.
        Hello, This is a dialog demo.
        Hello, This is a dialog demo.
        Hello, This is a dialog demo.
        Hello, This is a dialog demo.
        Hello, This is a dialog demo.
        Hello, This is a dialog demo.
        Hello, This is a dialog demo.
        Hello, This is a dialog demo.
        Hello, This is a dialog demo.
        Hello, This is a dialog demo.
        Hello, This is a dialog demo.
        Hello, This is a dialog demo.
        Hello, This is a dialog demo.
        Hello, This is a dialog demo.
        """
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        view.addSubview(iconImageView)
        view.addSubview(describeLabel)
        
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 24),
            iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 44),
            iconImageView.heightAnchor.constraint(equalToConstant: 44),
            describeLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 24),
            describeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            describeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            describeLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -24)
        ])
    }
}
