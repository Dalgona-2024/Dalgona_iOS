import Foundation
import Moya

enum UserAPI {
    case login
}

extension UserAPI: DalgonaAPI {
    var domain: String {
        "/user"
    }
    
    var urlPath: String {
        switch self {
        case .login:
            return "/login"
        }
    }
    
    var errorHandler: [Int : any Error]? {
        [
            404: UserError.notFound
        ]
    }
    
    var method: Moya.Method {
        .get
    }

    var headers: [String : String]? { TokenStorage.shared.toHeader(.noToken) }
}
