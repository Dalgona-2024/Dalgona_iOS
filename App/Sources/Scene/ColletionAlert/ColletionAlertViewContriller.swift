import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

import SwiftUI

class ColletionAlertViewContriller: BaseVC<ColletionAlertViewModel> {
    
    private let mainView = UIView().then{
        $0.layer.cornerRadius = 20
        $0.layer.shadowColor = UIColor.gray300.cgColor
        $0.layer.shadowOpacity = 1
        $0.layer.shadowOffset = .init(width: 0, height: 4)
        $0.layer.shadowRadius = 3
        $0.clipsToBounds = false
        $0.backgroundColor = .white
        
//        $0.layer.applySketchShadow(
//            color: .gray300,
//            alpha: 0.5,
//            x: 0,
//            y: 4,
//            blur: 4,
//            spread: 2
//        )
    }
    
    private let mainImage = UIImageView().then{
        $0.image = DalgonaIOSAsset.viewCap.image
    }
    
    private let mainLabel = UILabel().then{
        $0.text = "축하드립니다!"
        $0.font = .bold24
        $0.textColor = .black
    }
    
    private let subLabel = UILabel().then{
        $0.text = "이제 당신은 회사 내에서의\n에티켓과 효율적인 업무 처리를\n잘 해낼 준비가 되어 있습니다."
        $0.font = .regular16
        $0.textColor = .black
        $0.numberOfLines = 3
        $0.textAlignment = .center
    }
    
    private var closeButton = DalgonaFillButton(title: "수료증 닫기")
    
    override func attribute() {
        
    }

    override func addView() {
        view.addSubview(mainView)
        mainView.addSubview(mainImage)
        mainView.addSubview(mainLabel)
        mainView.addSubview(subLabel)
        mainView.addSubview(closeButton)
    }

    override func setLayout() {
        mainView.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.right.left.equalToSuperview().inset(45)
            $0.width.equalTo(340)
            $0.height.equalTo(433)
        }
        mainImage.snp.makeConstraints{
            $0.top.equalToSuperview().inset(57)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(52.02)
            $0.height.equalTo(44)
        }
        mainLabel.snp.makeConstraints{
            $0.top.equalTo(mainImage.snp.bottom).offset(47)
            $0.centerX.equalToSuperview()
        }
        subLabel.snp.makeConstraints{
            $0.top.equalTo(mainLabel.snp.bottom).offset(43)
            $0.centerX.equalToSuperview()
        }
        closeButton.snp.makeConstraints{
            $0.top.equalTo(subLabel.snp.bottom).offset(44)
            $0.left.right.equalToSuperview().inset(28)
            $0.height.equalTo(50)
        }
    }
}

#Preview {
    ColletionAlertViewContriller(viewModel: .init())
}

extension CALayer {
  func applySketchShadow(
    color: UIColor = .black,
    alpha: Float = 0.5,
    x: CGFloat = 0,
    y: CGFloat = 2,
    blur: CGFloat = 4,
    spread: CGFloat = 0)
  {
    masksToBounds = false
    shadowColor = color.cgColor
    shadowOpacity = alpha
    shadowOffset = CGSize(width: x, height: y)
    shadowRadius = blur / 2.0
    if spread == 0 {
      shadowPath = nil
    } else {
      let dx = -spread
      let rect = bounds.insetBy(dx: dx, dy: dx)
      shadowPath = UIBezierPath(rect: rect).cgPath
    }
  }
}
