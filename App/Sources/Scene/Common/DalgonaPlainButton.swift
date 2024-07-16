import UIKit

class DalgonaPlainButton: BaseButton {

    init(title: String?) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func attribute() {
        backgroundColor = .clear
        setTitleColor(.black, for: .normal)
        titleLabel?.font = .regular16
    }
}
