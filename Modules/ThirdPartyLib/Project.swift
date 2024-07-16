import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "ThirdPartyLib",
    targets: [
        .target(
            name: "ThirdPartyLib", 
            destinations: .iOS,
            product: .framework,
            bundleId: "\(dalgonaOrganizationName).ThirdPartyLib",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .default,
            sources: ["Sources/**"],
            dependencies: [
                .SPM.KeychainSwift,
                .SPM.Kingfisher,
                .SPM.Moya,
                .SPM.RxCocoa,
                .SPM.RxFlow,
                .SPM.RxMoya,
                .SPM.RxSwift,
                .SPM.SnapKit,
                .SPM.Then,
            ]
        )
    ]
)
