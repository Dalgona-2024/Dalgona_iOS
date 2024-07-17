import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa
import SwiftUI

enum LevelDalgona {
    case firstLevel
    case secoundLevel
    case thirdLevel
    
    var description: String {
        switch self {
        case .firstLevel:
            ""
        case .secoundLevel:
            "2 단계를 완료했어요\n계속 문제를 풀면서 달고나를 얻어보세요!"
        case .thirdLevel:
            "3 단계를 완료했어요\n완료 버튼을 눌러 달고나를 얻어보세요!"
        }
    }
    
    var buttonText: String {
        switch self {
        case .firstLevel:
            "2 단계 풀러가기"
        case .secoundLevel:
            "3 단계 풀러가기"
        case .thirdLevel:
            "퀘스트 완료!"
        }
    }

    var dalgonaImage: UIImage {
        switch self {
        case .firstLevel:
            DalgonaIOSAsset.dalgonaL1.image
        case .secoundLevel:
            DalgonaIOSAsset.dalgonaL2.image
        case .thirdLevel:
            DalgonaIOSAsset.dalgonaLevel3.image
        }
    }
}

class QuizComplitionViewController: BaseVC<QuizComplitionViewModel> {

    init(level: LevelDalgona, viewModel: QuizComplitionViewModel) {
        super.init(viewModel: viewModel)
        subLabel.text = level.description
        nextButton.setTitle(level.buttonText, for: .normal)
        dalgonaImageView.image = level.dalgonaImage
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let mainLabel = UILabel().then {
        $0.text = "완료했어요!"
        $0.font = .bold32
        $0.textColor = .black
    }
    
    private let subLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .regular16
        $0.textColor = .gray500
        $0.numberOfLines = 2
    }
    
    private let dalgonaImageView = UIImageView()
    
    private let outButton = DalgonaFillButton(title: "나가기").then {
        $0.backgroundColor = .white
        $0.setTitleColor(.black, for: .normal)
    }
    
    private let nextButton = DalgonaFillButton(title: "2단계 풀러가기")
    
    override func attribute() {
        view.backgroundColor = .white
    }
    
    override func addView() {
        view.addSubviews(
            mainLabel,
            subLabel,
            outButton,
            nextButton,
            dalgonaImageView
        )
    }
    
    override func setLayout() {
        mainLabel.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.height.equalTo(30)
        }
        
        subLabel.snp.makeConstraints{
            $0.top.equalTo(mainLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        outButton.snp.makeConstraints{
            $0.left.right.equalToSuperview().inset(24)
            $0.height.equalTo(48)
            $0.bottom.equalToSuperview().inset(73)
        }
        
        nextButton.snp.makeConstraints{
            $0.left.right.equalToSuperview().inset(24)
            $0.height.equalTo(48)
            $0.bottom.equalTo(outButton.snp.top).offset(-18)
        }
        
        dalgonaImageView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(mainLabel.snp.top).offset(-101)
            $0.width.equalTo(270)
            $0.height.equalTo(209)
        }
    }
}

#Preview {
    QuizComplitionViewController(level: .secoundLevel, viewModel: .init())
}
