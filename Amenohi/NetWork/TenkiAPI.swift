//
//  TenkiAPI.swift
//  Amenohi
//
//  Created by 佐川晴海 on 2019/08/10.
//  Copyright © 2019 佐川晴海. All rights reserved.
//

import Foundation
import Moya

enum TenkiAPI {
    // TODO: 48都道府県
    case tokyo
    case osaka
}

extension TenkiAPI: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "http://weather.livedoor.com/forecast/webservice/json/v1") else {
            fatalError("base URL error")
        }
        return url
    }

    var path: String {
        switch self {
        case .tokyo:
            return ""
        case .osaka:
            return ""
        }
    }

    var method: Moya.Method {
        switch self {
        case .tokyo, .osaka:
            return .get
        }
    }

    var sampleData: Data {
        return Data()
    }

    // 新しく追加 パラメータ名がキーになります
    var parameters: [String: Any] {
        switch self {
        case .tokyo:
            let parameter = [
                "city": "130010"
            ] as [String: Any]
            return parameter
        case .osaka:
            let parameter = [
                "city": "270000"
            ] as [String: Any]
            return parameter
        }
    }

    // 新しく追加 URLにクエリ文字列として組み込む
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .tokyo, .osaka:
            return Moya.URLEncoding.queryString
        }
    }

    // 新しく追加 上で定義した parameters と parameterEncoding を使うに指定
    var task: Task {
        switch self {
        case .tokyo, .osaka:
            return .requestParameters(parameters: parameters, encoding: parameterEncoding)
        }
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
