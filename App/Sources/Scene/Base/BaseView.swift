import UIKit

class BaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        attribute()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        addView()
        setLayout()
    }

    func attribute() { }
    func addView() { }
    func setLayout() { }
    func bind() { }
}
