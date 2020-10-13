//
//  IndentityCell.h
//  OnChain
//
//  Created by 赵伟 on 2018/3/8.
//  Copyright © 2018年 Zeus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IndentityCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *certicationTitle;
@property (weak, nonatomic) IBOutlet UIImageView *cerImage;
@property (weak, nonatomic) IBOutlet UIImageView *arrow;
@property (nonatomic, copy) NSArray *imageArr;
@property (nonatomic, copy) NSArray *titleArr;

- (void)setwithIndex:(NSIndexPath *)indexPath;
@end
