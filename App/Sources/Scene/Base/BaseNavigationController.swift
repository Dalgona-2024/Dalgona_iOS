import UIKit

class BaseNavigationController: UINavigationController {

    private var backButtonImage: UIImage? = {
        DalgonaIOSAsset.backArrow.image.withAlignmentRectInsets(.init(top: 0, left: -10, bottom: 0, right: 0)).withTintColor(.main, renderingMode: .alwaysOriginal)
    }()

    private var backButtonAppearance: UIBarButtonItemAppearance = {
        let appearance = UIBarButtonItemAppearance()
        appearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        return appearance
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        settingNavigationBar()
    }

    private func settingNavigationBar() {
        let standardAppearance = UINavigationBarAppearance()
        let scrolledAppearance = UINavigationBarAppearance()
        [standardAppearance, scrolledAppearance].forEach {
            $0.setBackIndicatorImage(backButtonImage, transitionMaskImage: backButtonImage)
            $0.backButtonAppearance = backButtonAppearance
        }
        scrolledAppearance.backgroundColor = .blue
        standardAppearance.backgroundColor = .clear
        navigationBar.standardAppearance = standardAppearance
//        navigationBar.scrollEdgeAppearance = scrolledAppearance
        navigationBar.tintColor = .black
    }
}
