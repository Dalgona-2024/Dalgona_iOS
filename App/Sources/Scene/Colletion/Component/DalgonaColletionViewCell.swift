import UIKit
import SnapKit
import Then

class DalgonaColletionViewCell: UICollectionViewCell {

    static let identifier = "DalgonaColletionViewCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        attribute()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func attribute() {
        backgroundColor = .gray200
        layer.cornerRadius = 10
    }
}
