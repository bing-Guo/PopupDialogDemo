import UIKit

class ViewController: UIViewController {
    lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 44))
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitle("Show Dialog", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.center = view.center
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()

    let dialog1 = PopupDialog(viewController: SampleOneViewController(), tapGestureDismissal: false)
    let dialog2 = PopupDialog(viewController: SampleTwoViewController(), tapGestureDismissal: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(button)
        
        let nextButton = PopupDialogDefaultButton(title: "NEXT", action: { [weak self] in
            guard let self = self else { return }
            self.present(self.dialog2, animated: true, completion: nil)
        })
        
        let okButton = PopupDialogDefaultButton(title: "OK", action: {
            print("OK!")
        })
        
        dialog1.addButtons([nextButton])
        dialog2.addButtons([okButton])
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        self.present(dialog1, animated: true, completion: nil)
    }
}
