import Foundation
import RxFlow

enum DalgonaStep: Step {
    case tabbarIsRequired

    case onBoardingIsRequired
    case loginIsRequired
    case signupIsRequired
}
