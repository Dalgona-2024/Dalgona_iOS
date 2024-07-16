import UIKit
import RxFlow

class MainFlow: Flow {
    var root: any Presentable { self.presentable }

    private let presentable = BaseNavigationController()
    private let container = AppDelegate.container

    func navigate(to step: any Step) -> FlowContributors {
        guard let step = step as? DalgonaStep else { return .none }
        switch step {
        case .mainIsRequired:
            return navigateToMainScreen()
        case .dalgonaColletionIsRequired:
            return navigateToDalgonaColletionScreen()
        default:
            return .none
        }
    }

    private func navigateToMainScreen() -> FlowContributors {
        let mainVC = container.resolve(MainViewController.self)!

        presentable.pushViewController(mainVC, animated: false)
        return .one(flowContributor: .contribute(
            withNextPresentable: mainVC,
            withNextStepper: mainVC.viewModel
        ))
    }

    private func navigateToDalgonaColletionScreen() -> FlowContributors {
        let dalgonaColletionVC = container.resolve(DalgonaColletionViewController.self)!

        presentable.pushViewController(dalgonaColletionVC, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: dalgonaColletionVC,
            withNextStepper: dalgonaColletionVC.viewModel
        ))
    }
}

