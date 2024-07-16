import UIKit
import SnapKit
import Then

class SolvedQuizDisplayCollectionCell: UICollectionViewCell {

    static let identifier = "SolvedQuizDisplayCollectionCell"

    private let clipeView = UIView().then {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 10
    }
    private let solvedFooterView = UIView().then {
        $0.backgroundColor = .main
    }
    private let solvedFooterViewLable = UILabel().then {
        $0.text = "풀러가기"
        $0.font = .regular16
        $0.textColor = .white
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        attribute()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(clipeView)
        clipeView.addSubview(solvedFooterView)
        solvedFooterView.addSubview(solvedFooterViewLable)
        clipeView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        solvedFooterView.snp.makeConstraints {
            $0.bottom.horizontalEdges.equalToSuperview()
            $0.height.equalTo(60)
        }
        solvedFooterViewLable.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }

    private func attribute() {
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.gray400.cgColor
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.6
        layer.shadowOffset = .init(width: 0, height: 4)
    }
}
