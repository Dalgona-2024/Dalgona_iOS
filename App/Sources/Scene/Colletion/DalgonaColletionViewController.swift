import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

class DalgonaColletionViewController: BaseVC<DalgonaColletionViewModel> {

    private let layout = UICollectionViewFlowLayout().then {
        $0.itemSize = .init(width: 100, height: 100)
    }

    private lazy var dalgonaColletionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: layout
    ).then {
        $0.register(DalgonaColletionViewCell.self, forCellWithReuseIdentifier: DalgonaColletionViewCell.identifier)
    }

    private let navigationBarTitleLabel = UILabel().then {
        $0.text = "나의 달고나들"
        $0.font = .bold18
        $0.textColor = .black
    }
    private let rightViewItem = UIBarButtonItem().then {
        $0.image = DalgonaIOSAsset.singleLogoImage.image
        $0.isEnabled = false
    }

    override func attribute() {
        view.backgroundColor = .background
        navigationItem.titleView = navigationBarTitleLabel
        navigationItem.rightBarButtonItem = rightViewItem
    }

    override func addView() {
        view.addSubview(dalgonaColletionView)
    }

    override func setLayout() {
        dalgonaColletionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
}
