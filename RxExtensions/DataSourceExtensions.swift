//
//  DataSourceExtensions.swift
//  RxExtensions
//
//  Created by DianQK on 25/10/2016.
//  Copyright © 2016 T. All rights reserved.
//

import RxDataSources

extension TableViewSectionedDataSource {
    public convenience init(configureCell: @escaping CellFactory) {
        self.init()
        self.configureCell = configureCell
    }
}

extension CollectionViewSectionedDataSource {
    public convenience init(configureCell: @escaping CellFactory) {
        self.init()
        self.configureCell = configureCell
    }
}
