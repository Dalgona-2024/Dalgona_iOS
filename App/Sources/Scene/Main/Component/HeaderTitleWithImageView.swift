import UIKit
import SnapKit
import Then

class HeaderTitleWithImageView: BaseView {
    private let titleLable = UILabel().then {
        $0.font = .bold24
    }

    private let subtitleLabel = UILabel().then {
        $0.font = .regular14
    }

    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }

    init(
        title: String?,
        subTitle: String? = nil,
        titleColor: UIColor = .black,
        subTitleColor: UIColor = .gray500,
        image: UIImage? = nil
    ) {
        super.init(frame: .zero)
        titleLable.text = title
        subtitleLabel.text = subTitle
        titleLable.textColor = titleColor
        subtitleLabel.textColor = subTitleColor
        imageView.image = image
        backgroundColor = .clear
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func addView() {
        addSubviews(
            titleLable,
            subtitleLabel,
            imageView
        )
    }

    override func setLayout() {
        titleLable.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        subtitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(titleLable.snp.bottom).offset(8)
        }
        imageView.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.centerY.equalTo(titleLable)
            $0.leading.equalTo(titleLable.snp.trailing).offset(6)
        }
        self.snp.makeConstraints {
            $0.bottom.equalTo(subtitleLabel)
        }
    }
}
