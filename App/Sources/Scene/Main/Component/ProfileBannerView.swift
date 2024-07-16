import UIKit
import SnapKit
import Then

// TODO: - 프로필 이름 변경 가능하게 대응하기
class ProfileBannerView: BaseView {
    private let logoImageView = UIImageView(image: DalgonaIOSAsset.singleLogoImage.image)

    private let nameLabel = UILabel().then {
        $0.text = "조병진"
        $0.font = .regular24
        $0.textColor = .main
    }

    let myDalgonaButton = ProfileArrowButton()

    override func attribute() {
        layer.cornerRadius = 10
        backgroundColor = .gray200
    }

    override func addView() {
        addSubviews(
            logoImageView,
            nameLabel,
            myDalgonaButton
        )
    }

    override func setLayout() {
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.leading.equalToSuperview().inset(19)
            $0.width.height.equalTo(40)
        }

        nameLabel.snp.makeConstraints {
            $0.centerY.equalTo(logoImageView)
            $0.leading.equalTo(logoImageView.snp.trailing).offset(9)
        }

        myDalgonaButton.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(19)
            $0.height.equalTo(50)
        }

        self.snp.makeConstraints {
            $0.bottom.equalTo(myDalgonaButton).offset(15)
        }
    }
}
