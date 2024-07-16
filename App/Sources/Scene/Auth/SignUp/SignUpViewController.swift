import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

class SignUpViewController: BaseVC<SignUpViewModel> {
    private let titleLabel = UILabel().then {
        $0.text = "회원가입"
        $0.textColor = .black
        $0.font = .bold24
    }
    
    private let subTitleLabel = UILabel().then {
        $0.text = "새로은 계정을 만들어요."
        $0.textColor = .gray600
        $0.font = .regular16
    }

    private let nickNameTextField = DalgonaTextField(placeholder: "닉네임을 입력해 주세요.")
    private let passwordTextField = DalgonaTextField(placeholder: "비밀번호를 입력해 주세요.")

    private let signUpButton = DalgonaFillButton(title: "회원가입")

    override func attribute() {
        view.backgroundColor = .background
    }

    override func addView() {
        view.addSubviews(
            titleLabel,
            subTitleLabel,
            nickNameTextField,
            passwordTextField,
            signUpButton
        )
    }

    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(35)
            $0.left.equalToSuperview().inset(25)
        }

        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.left.equalTo(titleLabel)
        }

        nickNameTextField.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(50)
            $0.horizontalEdges.equalToSuperview().inset(25)
            $0.height.equalTo(50)
        }

        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(nickNameTextField.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(25)
            $0.height.equalTo(50)
        }

        signUpButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(48)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-30)
        }
    }
}
