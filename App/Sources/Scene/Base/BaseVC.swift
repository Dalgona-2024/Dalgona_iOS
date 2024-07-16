import UIKit
import RxSwift
import RxCocoa

class BaseVC<ViewModel: ViewModelType>: UIViewController {
    let disposeBag: DisposeBag = .init()
    let viewModel: ViewModel

    let viewDidLoadRelay = PublishRelay<Void>()
    let viewWillAppearRelay = PublishRelay<Void>()
    let viewDidAppearRelay = PublishRelay<Void>()

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewWillAppearRelay.accept(())
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewDidAppearRelay.accept(())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        bind()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addView()
        setLayout()
    }

    func attribute() { }
    func addView() { }
    func setLayout() { }
    func bind() { }
}
