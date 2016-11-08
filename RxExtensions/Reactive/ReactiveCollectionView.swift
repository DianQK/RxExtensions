//
//  ReactiveCollectionView.swift
//  RxExtensions
//
//  Created by DianQK on 03/11/2016.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

open class ReactiveCollectionView<S : AnimatableSectionModelType>: UICollectionView {

    public let disposeBag = DisposeBag()

    public let _dataSource = RxCollectionViewSectionedAnimatedDataSource<S>()

    required public init(
        layout: UICollectionViewLayout = UICollectionViewFlowLayout(),
        register: (AnyClass, String)...,
        configureCell: @escaping (CollectionViewSectionedDataSource<S>, UICollectionView, IndexPath, S.Item) -> UICollectionViewCell!,
        modelSelected: ((Observable<S.Item>) -> Disposable)? = nil,
        data: Observable<[S]>
        ) {
        super.init(frame: CGRect.zero, collectionViewLayout: layout)
        for r in register {
            self.register(r.0, forCellWithReuseIdentifier: r.1)
        }
//        _dataSource.configureCell = configureCell
        _dataSource.configureCell = { dataSource, collectionView, indexPath, item in
            return configureCell(dataSource, collectionView, indexPath, item)
        }
        modelSelected?(self.rx.modelSelected(S.Item.self).asObservable()).addDisposableTo(disposeBag)
        data.asObservable().bindTo(self.rx.items(dataSource: self._dataSource)).addDisposableTo(disposeBag)
        commonInit()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override open func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }

    open func commonInit() {
        
    }

}
