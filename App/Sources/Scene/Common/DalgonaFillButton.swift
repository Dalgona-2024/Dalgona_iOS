import UIKit

class DalgonaFillButton: BaseButton {

    init(title: String?) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func attribute() {
        backgroundColor = .main
        setTitleColor(.white, for: .normal)
        titleLabel?.font = .regular16
        layer.cornerRadius = 8
    }
}
