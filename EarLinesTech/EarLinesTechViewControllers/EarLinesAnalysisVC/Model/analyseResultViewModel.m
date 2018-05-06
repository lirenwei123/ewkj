//
//  analyseResultViewModel.m
//  EarLinesTech
//
//  Created by apple   on 2018/4/25.
//  Copyright © 2018年  RWLi. All rights reserved.
//

#import "analyseResultViewModel.h"

@implementation analyseResultViewModel

- (instancetype)initWithScore
{
    self = [super init];
    if (self) {
        _title = @"test";
        _content = @"The gipsies always camped on the flanks of the Fair, which they looked on with greater detachment than the gaujos who crowded into its heart, either selling or buying, doing or being done. Just within the semicircle of their earth-coloured tents were the caravans of the showmen, gaudily painted, with seedy horses at tether, very different from the Romany gris. Then came the booths, stalls piled with sweets in an interesting state of preservation, trays of neck and shoulder ribbons, tinsel cords, tin lockets with glass stones, all fairings, to be bought out of the hard-won wages of husbandry in love. Then there was the panorama, creaking and torn in places, but still giving a realistic picture of the crowning of King William; there was the merry-go-round, trundled noisily by two sweating cart-horses; there was the cocoa-nut shy, and the fighting booth, in the doorway of which half-breed Buck Washington loved to stand and display his hairy chest between the folds of his dressing-gown; and there was the shooting-gallery, where one could pot at the cardboard effigies of one's hates, Lord Brougham who had robbed the poor working man of his parish relief, or Boney, still a blood-curdler to those who had seen the building of the Martello towers.";
            //适配高度
      
      
                
        
                _contentHeight = [_content boundingRectWithSize:CGSizeMake(SW-130, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:EWKJfont(12)} context:nil].size.height;
                _cellHeight  =   _contentHeight + 105;
                if (_cellHeight<130) {
                    _cellHeight = 130;
                }
    }
    return self;
}


- (instancetype)initWithContent
{
    self = [super init];
    if (self) {
        _title = @"test";
        _content = @"The gipsies always camped on the flanks of the Fair, which they looked on with greater detachment than the gaujos who crowded into its heart, either selling or buying, doing or being done. Just within the semicircle of their earth-coloured tents were the caravans of the showmen, gaudily painted, with seedy horses at tether, very different from the Romany gris. Then came the booths, stalls piled with sweets in an interesting state of preservation, trays of neck and shoulder ribbons, tinsel cords, tin lockets with glass stones, all fairings, to be bought out of the hard-won wages of husbandry in love. Then there was the panorama, creaking and torn in places, but still giving a realistic picture of the crowning of King William; there was the merry-go-round, trundled noisily by two sweating cart-horses; there was the cocoa-nut shy, and the fighting booth, in the doorway of which half-breed Buck Washington loved to stand and display his hairy chest between the folds of his dressing-gown; and there was the shooting-gallery, where one could pot at the cardboard effigies of one's hates, Lord Brougham who had robbed the poor working man of his parish relief, or Boney, still a blood-curdler to those who had seen the building of the Martello towers.";
            //适配高度
     
                _contentHeight = [_content boundingRectWithSize:CGSizeMake(SW-40, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:EWKJfont(12)} context:nil].size.height;
                _cellHeight  =   _contentHeight + 70+20;
        
    }
    return self;
}
@end
