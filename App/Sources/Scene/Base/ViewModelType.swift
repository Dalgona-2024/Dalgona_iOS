import Foundation
import RxSwift

protocol ViewModelType {

    var disposeBag: DisposeBag { get set }

    associatedtype Input
    associatedtype Output

    func transform(input: Input) -> Output
}
