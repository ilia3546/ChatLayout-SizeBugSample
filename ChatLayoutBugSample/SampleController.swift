//
//  Controller.swift
//  ChatLayoutBugSample
//
//  Created by Ilya Kharlamov on 10/4/22.
//

import UIKit
import ChatLayout
import DifferenceKit

class SampleController: UICollectionViewController, ChatLayoutDelegate {
        
    var records: [Record] = [
        Record(id: 1, text: "1", size: CGSize(width: 300, height: 44)),
        Record(id: 2, text: "2", size: CGSize(width: 300, height: 44)),
        Record(id: 3, text: "3", size: CGSize(width: 300, height: 44)),
        Record(id: 4, text: "4", size: CGSize(width: 300, height: 44)),
        Record(id: 5, text: "5", size: CGSize(width: 300, height: 44))
    ]
    
    init() {
        let layout = CollectionViewChatLayout()
        layout.settings.interItemSpacing = 4
        super.init(collectionViewLayout: layout)
        layout.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.isPrefetchingEnabled = false
        self.collectionView.register(SampleCollectionCell.self, forCellWithReuseIdentifier: "cell")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: self.updateSize)
    }
    
    private func updateSize() {
        var updatedRecords = self.records
        updatedRecords[2].size.height = 88
        let changeset = StagedChangeset(source: self.records, target: updatedRecords)
        self.collectionView.reload(using: changeset, setData: { self.records = $0 })
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.records.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SampleCollectionCell
        cell.update(for: self.records[indexPath.item])
        return cell
    }
    
    func sizeForItem(_ chatLayout: CollectionViewChatLayout, of kind: ItemKind, at indexPath: IndexPath) -> ItemSize {
        .exact(self.records[indexPath.item].size)
    }
    
}
