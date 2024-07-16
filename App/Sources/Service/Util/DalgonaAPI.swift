import Foundation
import Moya

protocol DalgonaAPI: TargetType {
    var domain: String { get }
    var urlPath: String { get }
    var errorHandler: [Int: Error]? { get }
}

extension DalgonaAPI {

    var baseURL: URL {
        URL(string: "")!
    }

    var path: String {
        domain + urlPath
    }

    var validationType: ValidationType {
        .successCodes
    }
    
    var task: Task {
        .requestPlain
    }

    var headers: [String : String]? {
        TokenStorage.shared.toHeader(.access)
    }
}
