import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

class IncorrectQuizView: BaseView {
    private let headerView = HeaderTitleWithImageView(
        title: "틀린 문제 복습하기",
        subTitle: "틀렸던 문제들을 다시 풀어보면서 기본 상식을 익혀요",
        image: DalgonaIOSAsset.singleLogoImage.image
    )

    private let incorrectQuizTableView = UITableView().then {
        $0.separatorStyle = .none
        $0.backgroundColor = .clear
        $0.rowHeight = 100
        $0.register(IncorrectQuizTableViewCell.self, forCellReuseIdentifier: IncorrectQuizTableViewCell.identifier)
    }

    override func attribute() {
        backgroundColor = .clear
        incorrectQuizTableView.delegate = self
        incorrectQuizTableView.dataSource = self
    }

    override func addView() {
        addSubviews(
            headerView,
            incorrectQuizTableView
        )
    }

    override func setLayout() {
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(9)
            $0.horizontalEdges.equalToSuperview().inset(25)
        }

        incorrectQuizTableView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(31)
            $0.height.equalTo(incorrectQuizTableView.contentSize.height)
            $0.horizontalEdges.equalToSuperview()
        }

        self.snp.makeConstraints {
            $0.bottom.equalTo(incorrectQuizTableView).offset(21)
        }
    }
}

extension IncorrectQuizView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IncorrectQuizTableViewCell.identifier, for: indexPath)

        return cell
    }
}
