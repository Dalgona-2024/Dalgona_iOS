import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa
import SwiftUI

class MainViewController: BaseVC<MainViewModel> {
    private let profileBannerView = ProfileBannerView()

    private let gradationView = UIView()
    private let scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
    }
    private let contentView = UIView()

    private let solvedQuizDisplayView = SolvedQuizView()
    private let incorrectQuizView = IncorrectQuizView()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func attribute() {
        view.backgroundColor = .background
    }

    override func addView() {
        scrollView.addSubview(contentView)
        contentView.addSubviews(
            solvedQuizDisplayView,
            incorrectQuizView
        )
        view.addSubviews(
            profileBannerView,
            gradationView,
            scrollView
        )
    }

    override func setLayout() {
        profileBannerView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(22)
            $0.horizontalEdges.equalToSuperview().inset(25)
        }

        gradationView.snp.makeConstraints {
            $0.top.equalTo(profileBannerView.snp.bottom).offset(23)
            $0.horizontalEdges.bottom.equalToSuperview()
        }

        scrollView.snp.makeConstraints {
            $0.top.equalTo(profileBannerView.snp.bottom).offset(23)
            $0.width.bottom.equalToSuperview()
        }

        contentView.snp.makeConstraints {
            $0.top.width.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.bottom.equalTo(incorrectQuizView.snp.bottom).offset(200)
        }

        solvedQuizDisplayView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
        }

        incorrectQuizView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(solvedQuizDisplayView.snp.bottom)
        }

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = gradationView.bounds
        let colors: [CGColor] = [
            UIColor.main.cgColor,
            UIColor.background.cgColor
        ]
        gradientLayer.colors = colors
        gradationView.layer.addSublayer(gradientLayer)
    }

    override func bind() {
        let input = MainViewModel.Input(
            dalgonaColletionButtonTap: profileBannerView.myDalgonaButton.rx.tap.asObservable()
        )
        let _ = viewModel.transform(input: input)
    }
}

#Preview {
    MainViewController(viewModel: MainViewModel())
}

