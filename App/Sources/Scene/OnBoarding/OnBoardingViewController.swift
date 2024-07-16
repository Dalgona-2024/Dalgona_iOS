import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

class OnBoardingViewController: BaseVC<OnBoardingViewModel> {
    private let logoImageView = UIImageView(image: DalgonaIOSAsset.logoWithText.image)
    private let loginButton = DalgonaFillButton(title: "기존의 계정으로 게속하기")
    private let signUpButton = DalgonaPlainButton(title: "새로운 계정으로 시작하기")

    override func attribute() {
        view.backgroundColor = .white
    }

    override func addView() {
        view.addSubviews(
            logoImageView,
            loginButton,
            signUpButton
        )
    }

    override func setLayout() {
        logoImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(view.frame.height / 5)
        }

        loginButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(48)
            $0.bottom.equalTo(signUpButton.snp.top).offset(-18)
        }

        signUpButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(48)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-18)
        }
    }

    override func bind() {
        let input = OnBoardingViewModel.Input(
            loginButtonTap: loginButton.rx.tap.asObservable(),
            signUpButtonTap: signUpButton.rx.tap.asObservable()
        )
        let _ = viewModel.transform(input: input)
    }
}
