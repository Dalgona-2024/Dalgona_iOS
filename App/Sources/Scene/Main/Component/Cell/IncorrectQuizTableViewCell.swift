import UIKit
import SnapKit
import Then

class IncorrectQuizTableViewCell: UITableViewCell {

    static let identifier = "IncorrectQuizTableViewCell"

    private let cellBackgroundView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.shadowColor = UIColor.gray400.cgColor
        $0.layer.shadowRadius = 4
        $0.layer.shadowOpacity = 0.6
        $0.layer.shadowOffset = .init(width: 0, height: 4)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        attribute()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(cellBackgroundView)
        cellBackgroundView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(10)
            $0.horizontalEdges.equalToSuperview().inset(25)
        }
    }

    private func attribute() {
        backgroundColor = .clear
        selectionStyle = .none
    }
}
