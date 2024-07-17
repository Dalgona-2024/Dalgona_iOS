import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa
import SwiftUI

enum FailLevelDalgona {
    case firstLevel
    case secoundLevel
    case thirdLevel
    
    var description: String {
        switch self {
        case .firstLevel:
            "1 단계를 실패했어요\n문제를 다시 풀어보고 달고나를 얻어보세요!"
        case .secoundLevel:
            "2 단계를 실패했어요\n문제를 다시 풀어보고 달고나를 얻어보세요!"
        case .thirdLevel:
            "3 단계를 실패했어요\n문제를 다시 풀어보고 달고나를 얻어보세요!"
        }
    }
}
class QuizFailViewController: BaseVC<QuizFailViewModel> {
    
    init(level: FailLevelDalgona, viewModel: QuizFailViewModel) {
        super.init(viewModel: viewModel)
        subLabel.text = level.description
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let subLabel = UILabel().then {
        $0.textAlignment = .center
        $0.font = .regular16
        $0.textColor = .gray500
        $0.numberOfLines = 2
    }
    
    private let mainLabel = UILabel().then {
        $0.text = "실패했어요..."
        $0.font = .bold32
        $0.textColor = .black
    }
    
    private let outButton = DalgonaFillButton(title: "나가기")
    private let retryButton = DalgonaFillButton(title: "다시 풀러가기")
    
    private let dalgona = UIImageView().then{
        $0.image = DalgonaIOSAsset.dal.image
    }
    override func attribute() {
        view.backgroundColor = .white
    }
    
    override func addView() {
        view.addSubviews(
            subLabel,
            mainLabel,
            outButton,
            retryButton,
            dalgona
        )
    }
    
    override func setLayout() {
        subLabel.snp.makeConstraints{
            $0.top.equalTo(mainLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        mainLabel.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.height.equalTo(30)
        }
        
        outButton.snp.makeConstraints{
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(48)
            $0.bottom.equalToSuperview().inset(73)
        }
        
        retryButton.snp.makeConstraints{
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(48)
            $0.bottom.equalTo(outButton.snp.top).offset(-18)
        }
        
        dalgona.snp.makeConstraints{
            $0.bottom.equalTo(mainLabel.snp.top).offset(-43)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(216)
        }
    }
    
}

#Preview {
    QuizFailViewController(level: .secoundLevel
                           , viewModel: .init())
}

