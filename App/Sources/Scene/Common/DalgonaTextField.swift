import UIKit
import RxSwift
import RxCocoa

class DalgonaTextField: UITextField {

    private let disposeBag: DisposeBag = .init()

    init(
        placeholder: String?,
        isSecure: Bool = false
    ) {
        super.init(frame: .zero)
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray400.cgColor
        self.placeholder = placeholder
        attribute()
        bind()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func attribute() {
        let paddingView = UIView(frame: .init(x: 0, y: 0, width: 12, height: 0))
        rightViewMode = .always
        leftViewMode = .always
        rightView = paddingView
        leftView = paddingView

        attributedPlaceholder = NSAttributedString(
            string: self.placeholder ?? "",
            attributes: [
                .foregroundColor: UIColor.gray400,
                .font: UIFont.regular14
            ]
        )
    }

    private func bind() {
        self.rx.text
            .compactMap { $0 }
            .subscribe(
                with: self,
                onNext: { owner, text in
                    owner.layer.borderColor = text.isEmpty ?
                    UIColor.gray400.cgColor :
                    UIColor.main.cgColor
                })
                .disposed(by: disposeBag)
    }
}
