import UIKit

class PopupDialogDefaultButton: PopupDialogButton {
    override func setupView() {
        defaultTitleColor = UIColor.orange
        defaultBorderColor = UIColor.orange.cgColor
        super.setupView()
    }
}

class PopupDialogCancelButton: PopupDialogButton {
    override func setupView() {
        defaultTitleColor = UIColor.lightGray
        defaultBorderColor = UIColor.lightGray.cgColor
        super.setupView()
    }
}
