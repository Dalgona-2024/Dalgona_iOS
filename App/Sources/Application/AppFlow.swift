import UIKit
import RxFlow

class AppFlow: Flow {
    var root: any Presentable { self.presentable }

    private let presentable: UIWindow

    init(presentable: UIWindow) {
        self.presentable = presentable
    }

    func navigate(to step: any Step) -> FlowContributors {
        guard let step = step as? DalgonaStep else { return .none }
        switch step {
        case .onBoardingIsRequired:
            return setRootToAuthFlow()
        default:
            return .none
        }
    }

    private func setRootToAuthFlow() -> FlowContributors {
        let authFlow = AuthFlow()
        Flows.use(authFlow, when: .ready) { [self] in
            presentable.rootViewController = $0
            presentable.makeKeyAndVisible()
        }
        return .one(flowContributor: .contribute(
            withNextPresentable: authFlow,
            withNextStepper: OneStepper(withSingleStep: DalgonaStep.onBoardingIsRequired)
        ))
    }
}
