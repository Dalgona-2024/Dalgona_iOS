import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "Dalgona-iOS",
    organizationName: dalgonaOrganizationName,
    targets: [
        .target(
            name: "Dalgona-iOS",
            destinations: .iOS,
            product: .app,
            bundleId: "\(dalgonaOrganizationName).Dalgona-iOS",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .extendingDefault(with: uiKitPlist),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                .Module.thirdPartyLib
            ]
        )
    ]
)
