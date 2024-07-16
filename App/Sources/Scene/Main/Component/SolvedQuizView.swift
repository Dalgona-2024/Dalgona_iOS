import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

class SolvedQuizView: BaseView {
    private let headerView = HeaderTitleWithImageView(
        title: "퀴즈를 풀어봐요",
        subTitle: "퀴즈를 풀면서 기본 상식을 알아가요",
        titleColor: .white,
        subTitleColor: .white
    )

    private let quizColletionViewlayout = UICollectionViewFlowLayout().then {
        $0.itemSize = CGSize(width: 168, height: 235)
        $0.minimumLineSpacing = 26
        $0.scrollDirection = .horizontal
    }

    private lazy var solvedQuizColletionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: quizColletionViewlayout
    ).then {
        $0.clipsToBounds = false
        $0.backgroundColor = .clear
        $0.showsHorizontalScrollIndicator = false
        $0.contentInset = .init(top: 0, left: 25, bottom: 0, right: 25)
        $0.register(SolvedQuizDisplayCollectionCell.self, forCellWithReuseIdentifier: SolvedQuizDisplayCollectionCell.identifier)
    }

    override func attribute() {
        solvedQuizColletionView.delegate = self
        solvedQuizColletionView.dataSource = self
        backgroundColor = .clear
    }

    override func addView() {
        addSubviews(
            headerView,
            solvedQuizColletionView
        )
    }

    override func setLayout() {
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(43)
            $0.horizontalEdges.equalToSuperview().inset(25)
        }
        solvedQuizColletionView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(45)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(235)
        }
        self.snp.makeConstraints {
            $0.bottom.equalTo(solvedQuizColletionView).offset(21)
        }
    }
}

extension SolvedQuizView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SolvedQuizDisplayCollectionCell.identifier, for: indexPath)
        return cell
    }
}
