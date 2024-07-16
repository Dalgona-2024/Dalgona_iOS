import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

class ProfileArrowButton: BaseButton {
    private let contentTitleLabel = UILabel().then {
        $0.text = "내가 얻은 달고나 보기"
        $0.font = .regular14
        $0.textColor = .black
    }
    private let arrowImageView = UIImageView(
        image: DalgonaIOSAsset.backArrow.image
            .withHorizontallyFlippedOrientation()
            .withTintColor(.main,renderingMode: .alwaysOriginal)
    )
    
    override func attribute() {
        layer.cornerRadius = 8
        backgroundColor = .white
    }
    
    override func addView() {
        addSubviews(
            contentTitleLabel,
            arrowImageView
        )
    }
    
    override func setLayout() {
        contentTitleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(10)
        }
        
        arrowImageView.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(10)
        }
    }
}
