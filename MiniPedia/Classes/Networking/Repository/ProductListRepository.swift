//
//  ProductListRepository.swift
//  MiniPedia
//
//  Created by Agus Cahyono on 12/10/20.
//  Copyright © 2020 Agus Cahyono. All rights reserved.
//

import RxSwift

struct ProductListRepository {
    
    func getProductList(_ query: QueryProduct) -> Single<Products> {
        return APIClient.shared
            .requests(EndPoint.getProducts(query))
    }
    
}
