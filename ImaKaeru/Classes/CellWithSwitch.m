// -*-  Mode:ObjC; c-basic-offset:4; tab-width:8; indent-tabs-mode:nil -*-
/*
 * ImaKaeru
 * Copyright (C) 2011, Takuya & Yasuko Murakami, All rights reserved.
 * For conditions of distribution and use, see LICENSE file.
 */

#import "CellWithSwitch.h"

@interface CellWithSwitch ()
- (void)setUp;
- (void)switchChanged:(id)sender;
@end

@implementation CellWithSwitch

@synthesize identifier = mIdentifier;
@synthesize delegate = mDelegate;

#define CELL_ID @"CellWithSwitch"

+ (CellWithSwitch *)getCell:(UITableView *)tableView
{
    CellWithSwitch *cell = (CellWithSwitch *)[tableView dequeueReusableCellWithIdentifier:CELL_ID];
    if (cell == nil) {
        UINib *nib = [UINib nibWithNibName:@"CellWithSwitch" bundle:nil];
        NSArray *array = [nib instantiateWithOwner:nil options:nil];
        cell = [array objectAtIndex:0];
        
        [cell setUp];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    return self;
}

- (void)setUp
{
    [mSwitch addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)setLabel:(NSString *)label
{
    [mLabel setText:label];
}

- (void)setOn:(BOOL)on
{
    mSwitch.on = on;
}

- (BOOL)on
{
    return mSwitch.on;
}

- (void)switchChanged:(id)sender {
    [mDelegate cellWithSwitchChanged:self];
}

#if 0
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#endif



@end
