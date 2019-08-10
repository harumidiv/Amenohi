//
//  TemperaturesModel.swift
//  Amenohi
//
//  Created by 佐川晴海 on 2019/08/10.
//  Copyright © 2019 佐川晴海. All rights reserved.
//

import Foundation

struct TemperaturesModel: Decodable {
    var min: TemperatureModel?
    var max: TemperatureModel?

    private enum CodingKeys: String, CodingKey {
        case min
        case max
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        min = try container.decodeIfPresent(TemperatureModel.self, forKey: .min)
        max = try container.decodeIfPresent(TemperatureModel.self, forKey: .max)
    }
}

struct TemperatureModel: Decodable {
    let celsius: String
    let fahrenheit: String

    private enum CodingKeys: String, CodingKey {
        case celsius
        case fahrenheit
    }
}
