import UIKit

class PopupDialogButton: UIButton {
    typealias PopupDialogButtonAction = () -> Void
    
    // MARK: - Appearance Properties
    var defaultTitleColor: UIColor = .black
    var defaultBorderWidth: CGFloat = 2
    var defaultBorderColor: CGColor = UIColor.black.cgColor
    var defaultCornerRadius: CGFloat = 4
    var defaultButtonHeight: CGFloat = 44
    
    var buttonAction: PopupDialogButtonAction?
    var dismissOnTap: Bool
    var buttonHeight: CGFloat
    
    init(title: String, dismissOnTap: Bool = true, buttonHeight: CGFloat = 44, action: PopupDialogButtonAction?) {
        self.buttonAction = action
        self.dismissOnTap = dismissOnTap
        self.buttonHeight = buttonHeight
        
        super.init(frame: .zero)
        
        setTitle(title, for: UIControl.State())

        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        setTitleColor(defaultTitleColor, for: .normal)
        layer.borderWidth = defaultBorderWidth
        layer.borderColor = defaultBorderColor
        layer.cornerRadius = defaultCornerRadius
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: buttonHeight)
        ])
    }
}
