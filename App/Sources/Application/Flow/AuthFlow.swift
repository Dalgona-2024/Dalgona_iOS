import UIKit
import RxFlow

class AuthFlow: Flow {
    var root: any Presentable { self.presentable }

    private let presentable = BaseNavigationController()
    private let container = AppDelegate.container

    func navigate(to step: any Step) -> FlowContributors {
        guard let step = step as? DalgonaStep else { return .none }
        switch step {
        case .onBoardingIsRequired:
            return navigateToOnBoardingScreen()
        case .loginIsRequired:
            return navigateToLoginScreen()
        case .signupIsRequired:
            return navigateToSignUpScreen()
        default:
            return .none
        }
    }

    private func navigateToOnBoardingScreen() -> FlowContributors {
        let onBoardingVC = container.resolve(OnBoardingViewController.self)!

        presentable.pushViewController(onBoardingVC, animated: false)
        return .one(flowContributor: .contribute(
            withNextPresentable: onBoardingVC,
            withNextStepper: onBoardingVC.viewModel
        ))
    }

    private func navigateToLoginScreen() -> FlowContributors {
        let loginVC = container.resolve(LoginViewController.self)!

        presentable.pushViewController(loginVC, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: loginVC,
            withNextStepper: loginVC.viewModel
        ))
    }

    private func navigateToSignUpScreen() -> FlowContributors {
        let signUpVC = container.resolve(SignUpViewController.self)!

        presentable.pushViewController(signUpVC, animated: true)
        return .one(flowContributor: .contribute(
            withNextPresentable: signUpVC,
            withNextStepper: signUpVC.viewModel
        ))
    }
}

