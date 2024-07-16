import Foundation
import RxSwift
import RxCocoa
import RxFlow

class LoginViewModel: ViewModelType, Stepper {
    var disposeBag: DisposeBag = .init()
    var steps: PublishRelay<Step> = .init()

    struct Input {}
    
    struct Output {}

    func transform(input: Input) -> Output {
        return Output()
    }
}
