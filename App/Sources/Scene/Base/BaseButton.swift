import UIKit
import RxSwift
import RxCocoa
import SnapKit
import Then

class BaseButton: UIButton {

    let disposBag = DisposeBag()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        attribute()
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override open func layoutSubviews() {
        super.layoutSubviews()
        addView()
        setLayout()
    }

    override open var isHighlighted: Bool {
        willSet {
            UIView.animate(withDuration: 0.08) { [self] in
                transform = newValue ? CGAffineTransform(scaleX: 0.97, y: 0.97) : .identity
                layer.opacity = newValue ? 0.7 : 1
            }
        }
    }

    open func attribute() {}
    open func addView() {}
    open func setLayout() {}
}
