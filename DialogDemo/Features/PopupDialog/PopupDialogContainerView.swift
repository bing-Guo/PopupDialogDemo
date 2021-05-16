import UIKit

private extension PopupDialogContainerView {
    struct Constants {
        static let backgroundAlpha: CGFloat = 0.6
        static let alertPhoneWidth: CGFloat = 270
        static let containerViewPadding: CGFloat = 16
    }
}

class PopupDialogContainerView: UIView {
    // MARK: - UI Properties
    lazy var container: UIView = {
        let container = UIView(frame: .zero)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = UIColor.white
        container.clipsToBounds = true
        container.layer.cornerRadius = 14
        return container
    }()
    
    lazy var shadowContainer: UIView = {
        let shadowContainer = UIView(frame: .zero)
        shadowContainer.translatesAutoresizingMaskIntoConstraints = false
        shadowContainer.backgroundColor = UIColor.clear
        return shadowContainer
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.buttonStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 18
        return stackView
    }()
    
    lazy var buttonStackView: UIStackView = {
        let buttonStackView = UIStackView()
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 10
        buttonStackView.axis = .vertical
        return buttonStackView
    }()

    // MARK: - Constructor
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    private func setupViews() {
        self.backgroundColor = UIColor.black.withAlphaComponent(Constants.backgroundAlpha)
        
        addSubview(shadowContainer)
        shadowContainer.addSubview(container)
        container.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            shadowContainer.widthAnchor.constraint(equalToConstant: Constants.alertPhoneWidth),
            shadowContainer.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            shadowContainer.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            container.topAnchor.constraint(equalTo: shadowContainer.topAnchor),
            container.leftAnchor.constraint(equalTo: shadowContainer.leftAnchor),
            container.rightAnchor.constraint(equalTo: shadowContainer.rightAnchor),
            container.bottomAnchor.constraint(equalTo: shadowContainer.bottomAnchor),
            stackView.topAnchor.constraint(equalTo: container.topAnchor, constant: Constants.containerViewPadding),
            stackView.leftAnchor.constraint(equalTo: container.leftAnchor, constant: Constants.containerViewPadding),
            stackView.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -Constants.containerViewPadding),
            stackView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -Constants.containerViewPadding)
        ])
    }
}
