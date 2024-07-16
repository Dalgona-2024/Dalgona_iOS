import Foundation
import RxSwift
import RxCocoa
import RxFlow

class DalgonaColletionViewModel: ViewModelType, Stepper {
    var disposeBag: DisposeBag = .init()
    var steps: PublishRelay<Step> = .init()

    struct Input {}
    
    struct Output {}

    func transform(input: Input) -> Output {
        return Output()
    }
}
