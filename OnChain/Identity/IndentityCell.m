//
//  IndentityCell.m
//  OnChain
//
//  Created by 赵伟 on 2018/3/8.
//  Copyright © 2018年 Zeus. All rights reserved.
//

#import "IndentityCell.h"
#import "UIView+Scale.h"
#import "Config.h"

@implementation IndentityCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
     [_iconImage scaleFrameBaseWidth];
     [_certicationTitle scaleFrameBaseWidth];
     [_cerImage scaleFrameBaseWidth];
     [_arrow scaleFrameBaseWidth];
    _imageArr = @[@"twitter",@"LN",@"Github",@"F"];
    _titleArr = @[Localized(@"Twitter"),Localized(@"Linkedin"),Localized(@"Github"),Localized(@"Facebook")];

}

- (void)setwithIndex:(NSIndexPath *)indexPath{
    
//    if (indexPath.section==0) {
//
//        _iconImage.image = [UIImage imageNamed:@"SM"];
//        _certicationTitle.text = Localized(@"Identity");
//        _cerImage.image = [UIImage imageNamed:@"RZ"];
//
//    }else{
    
        _iconImage.image = [UIImage imageNamed:(NSString*)_imageArr[indexPath.row]];
        _certicationTitle.text = _titleArr[indexPath.row];
        
//    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
