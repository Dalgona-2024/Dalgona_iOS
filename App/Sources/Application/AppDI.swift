import Foundation
import Swinject

extension Container {
    func appDepedencyInject() {
        viewModelDependencyInject()
        viewControllerDependencyInject()
    }

    private func viewModelDependencyInject() {
        self.register(OnBoardingViewModel.self) { _ in OnBoardingViewModel() }
        self.register(LoginViewModel.self) { _ in LoginViewModel() }
        self.register(SignUpViewModel.self) { _ in SignUpViewModel() }
        self.register(MainViewModel.self) { _ in MainViewModel() }
        self.register(DalgonaColletionViewModel.self) { _ in DalgonaColletionViewModel() }
    }

    private func viewControllerDependencyInject() {
        self.register(OnBoardingViewController.self) {
            OnBoardingViewController(viewModel: $0.resolve(OnBoardingViewModel.self)!)
        }
        self.register(LoginViewController.self) {
            LoginViewController(viewModel: $0.resolve(LoginViewModel.self)!)
        }
        self.register(SignUpViewController.self) {
            SignUpViewController(viewModel: $0.resolve(SignUpViewModel.self)!)
        }
        self.register(MainViewController.self) {
            MainViewController(viewModel: $0.resolve(MainViewModel.self)!)
        }
        self.register(DalgonaColletionViewController.self) {
            DalgonaColletionViewController(viewModel: $0.resolve(DalgonaColletionViewModel.self)!)
        }
    }
}
