
//
//  ForecastsModel.swift
//  Amenohi
//
//  Created by 佐川晴海 on 2019/08/10.
//  Copyright © 2019 佐川晴海. All rights reserved.
//

import Foundation

struct ForecastsModel: Decodable {
    let forecasts: [ForecastModel]

    private enum CodingKeys: String, CodingKey {
        case forecasts
    }
}

struct ForecastModel: Decodable {
    let dateLabel: String
    let telop: String
    let date: String
    let temperature: TemperaturesModel

    private enum CodingKeys: String, CodingKey {
        case dateLabel
        case telop
        case date
        case temperature
    }
}
