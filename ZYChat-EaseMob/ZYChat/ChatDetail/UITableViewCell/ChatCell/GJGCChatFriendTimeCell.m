//
//  GJGCChatFriendTimeCell.m
//  ZYChat
//
//  Created by ZYVincent QQ:1003081775 on 14-12-26.
//  Copyright (c) 2014年 ZYProSoft. All rights reserved.
//

#import "GJGCChatFriendTimeCell.h"

@interface GJGCChatFriendTimeCell ()

@property (nonatomic,strong)GJCFCoreTextContentView *timeLabel;

@property (nonatomic,assign)CGFloat cellMargin;

@end

@implementation GJGCChatFriendTimeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.cellMargin = 7.f;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.timeLabel = [[GJCFCoreTextContentView alloc]init];
        self.timeLabel.gjcf_centerX = GJCFSystemScreenWidth/2;
        self.timeLabel.gjcf_top = 7.f;
        self.timeLabel.gjcf_width = GJCFSystemScreenWidth;
        self.timeLabel.gjcf_height = 40.f;
        self.timeLabel.contentBaseWidth = self.timeLabel.gjcf_width;
        self.timeLabel.contentBaseHeight = self.timeLabel.gjcf_height;
        self.timeLabel.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:self.timeLabel];
        
    }
    
    return self;
}

- (void)setContentModel:(GJGCChatContentBaseModel *)contentModel
{
    if (!contentModel || !contentModel.timeString) {
        return;
    }
    
    self.timeLabel.gjcf_size = [GJCFCoreTextContentView contentSuggestSizeWithAttributedString:contentModel.timeString forBaseContentSize:self.timeLabel.contentBaseSize];
    
    self.timeLabel.contentAttributedString = contentModel.timeString;
    
    self.timeLabel.gjcf_centerX = GJCFSystemScreenWidth/2;
    
}

- (CGFloat)heightForContentModel:(GJGCChatContentBaseModel *)contentModel
{
    return self.timeLabel.gjcf_bottom + self.cellMargin;
}

@end
