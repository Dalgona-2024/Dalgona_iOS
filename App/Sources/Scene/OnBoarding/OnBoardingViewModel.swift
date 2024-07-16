import Foundation
import RxSwift
import RxCocoa
import RxFlow

class OnBoardingViewModel: ViewModelType, Stepper {
    var disposeBag: DisposeBag = .init()
    var steps: PublishRelay<Step> = .init()

    struct Input {
        let loginButtonTap: Observable<Void>
        let signUpButtonTap: Observable<Void>
    }
    
    struct Output {}

    func transform(input: Input) -> Output {

        input.loginButtonTap
            .map { DalgonaStep.loginIsRequired }
            .bind(to: steps)
            .disposed(by: disposeBag)

        input.signUpButtonTap
            .map { DalgonaStep.signupIsRequired }
            .bind(to: steps)
            .disposed(by: disposeBag)

        return Output()
    }
}
