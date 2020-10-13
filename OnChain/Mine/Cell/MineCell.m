//
//  MineCell.m
//  OnChain
//
//  Created by 赵伟 on 2018/3/9.
//  Copyright © 2018年 Zeus. All rights reserved.
//

#import "MineCell.h"
#import "UIView+Scale.h"
@implementation MineCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [_iconImage scaleFrameBaseWidth];
    [_MineTitle scaleFrameBaseWidth];
    [_arrow scaleFrameBaseWidth];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
