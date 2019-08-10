//
//  ViewController.swift
//  Amenohi
//
//  Created by 佐川晴海 on 2019/07/14.
//  Copyright © 2019 佐川晴海. All rights reserved.
//

import Moya
import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let provider = MoyaProvider<TenkiAPI>()
        provider.request(.tokyo) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let model = try moyaResponse.map(ForecastsModel.self)
                    guard let today = model.forecasts.first else {
                        return
                    }
                    print(today.telop)
                } catch {
                    print("json parse失敗")
                }
            case let .failure(error):
                print("アクセスに失敗しました:\(error)")
            }
        }
    }
}
