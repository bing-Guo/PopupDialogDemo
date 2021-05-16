import UIKit

class PopupDialog: UIViewController {
    // MARK: - Properties
    let presentationManager: PopupDialogPresentationManager
    let tapGestureDismissal: Bool
    
    var viewController: UIViewController
    var buttons = [PopupDialogButton]()
    var containerView: PopupDialogContainerView {
        return view as! PopupDialogContainerView
    }
    
    // MARK: - Constructor
    init(viewController: UIViewController, tapGestureDismissal: Bool = true) {
        self.viewController = viewController
        self.presentationManager = PopupDialogPresentationManager()
        self.tapGestureDismissal = tapGestureDismissal
        
        super.init(nibName: nil, bundle: nil)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func loadView() {
        view = PopupDialogContainerView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        appendButtons()
    }
    
    private func appendButtons() {
        let stackView = containerView.stackView
        let buttonStackView = containerView.buttonStackView
        
        if buttons.isEmpty {
            stackView.removeArrangedSubview(containerView.buttonStackView)
        }
        
        for (_, button) in buttons.enumerated() {
            buttonStackView.addArrangedSubview(button)
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        }
    }
}
// MARK: - Setup UI
extension PopupDialog {
    func setupUI() {
        transitioningDelegate = presentationManager
        modalPresentationStyle = .custom
        
        addChild(viewController)
        containerView.stackView.insertArrangedSubview(viewController.view, at: 0)
        viewController.didMove(toParent: self)
        
        if tapGestureDismissal {
            allowDismissalOnBackgroundTap()
        }
    }
    
    private func allowDismissalOnBackgroundTap() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        
        tapRecognizer.cancelsTouchesInView = false
        containerView.addGestureRecognizer(tapRecognizer)
    }
}

// MARK: - Actions
extension PopupDialog {
    func addButtons(_ buttons: [PopupDialogButton]) {
        self.buttons += buttons
    }
    
    @objc func buttonTapped(_ button: PopupDialogButton) {
        if button.dismissOnTap {
            dismiss { button.buttonAction?() }
        } else {
            button.buttonAction?()
        }
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        dismiss()
    }
    
    @objc func dismiss(_ completion: (() -> Void)? = nil) {
        self.dismiss(animated: true) {
            completion?()
        }
    }
}
