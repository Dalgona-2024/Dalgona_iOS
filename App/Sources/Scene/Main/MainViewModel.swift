import Foundation
import RxSwift
import RxCocoa
import RxFlow

class MainViewModel: ViewModelType, Stepper {
    var disposeBag: DisposeBag = .init()
    var steps: PublishRelay<Step> = .init()

    struct Input {
        let dalgonaColletionButtonTap: Observable<Void>
    }

    struct Output {}

    func transform(input: Input) -> Output {

        input.dalgonaColletionButtonTap
            .map { DalgonaStep.dalgonaColletionIsRequired }
            .bind(to: steps)
            .disposed(by: disposeBag)

        return Output()
    }
}
