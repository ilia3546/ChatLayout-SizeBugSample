//
//  SampleCollectionCell.swift
//  ChatLayoutBugSample
//
//  Created by Ilya Kharlamov on 10/4/22.
//

import UIKit

class SampleCollectionCell: UICollectionViewCell {
    
    private lazy var innerView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private lazy var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(self.innerView)
        self.innerView.addSubview(self.label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(for record: Record) {
        self.innerView.frame = CGRect(x: 0, y: 0, width: record.size.width, height: record.size.height)
        self.label.text = record.text
        self.label.sizeToFit()
        self.label.center = CGPoint(x: record.size.width/2, y: record.size.height/2)
    }
    
}
