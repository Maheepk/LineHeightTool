//
//  NSString+Height.m
//  Cinemarun
//
//  Created by MaheepK on 26/08/15.
//  Copyright (c) 2015 Ergun Development LLC. All rights reserved.
//

#import "NSString+Height.h"

@implementation NSString (Height)

+ (CGRect ) setAttributeWithString : (NSString *) string withLineSpacing:(int) lineSpacing withSize:(CGSize )sizeMake withFont:(UIFont *)font
{
    NSDictionary *attributeDictionary = @{NSFontAttributeName:font};
    
    NSMutableAttributedString * attributeString = [self setAttributeWithString:string withLineSpacing:lineSpacing withFont:font];
    NSStringDrawingContext * con = [NSStringDrawingContext new];
    
    CGRect descriptionRect = [attributeString.string
                              boundingRectWithSize:sizeMake
                              options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                              attributes:attributeDictionary
                              context:con];
    
    CGFloat noOfLine = ceilf(descriptionRect.size.height / font.pointSize);
    
    CGRect newRect = descriptionRect;
    newRect.origin.y = ceil(lineSpacing + descriptionRect.origin.y);
    newRect.size.height = ceilf(noOfLine * lineSpacing + descriptionRect.size.height );
    descriptionRect = newRect;
    
    return descriptionRect;
}

+ (NSMutableAttributedString *)setAttributeWithString:(NSString *)string withLineSpacing:(int)lineSpacing withFont:(UIFont *)font
{
    NSDictionary *attributeDictionary = @{NSFontAttributeName:font};
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string attributes:attributeDictionary];
    NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
    [paragrahStyle setLineSpacing:lineSpacing];
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragrahStyle range:NSMakeRange(0, [string length])];
    
    return attributedString;
}

+ (CGRect ) setAttributeWithString : (NSString *) string withLineSpacing:(int) lineSpacing withSize:(CGSize )sizeMake withFont:(UIFont *)font withLabel:(UILabel *)label setLabelTextColor:(UIColor *)color;
{
    
    NSDictionary *attributeDictionary = @{NSFontAttributeName:font};
    
    NSMutableAttributedString *attributeString = [self setAttributeWithString:string withLineSpacing:lineSpacing withFont:font];
    [attributeString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, attributeString.length)];
    label.font = font;
    label.attributedText = attributeString;
    
    CGRect descriptionRect = [attributeString.string
                              boundingRectWithSize:sizeMake
                              options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                              attributes:attributeDictionary
                              context:nil];
    
    CGFloat noOfLine = ceilf(descriptionRect.size.height / font.pointSize);
    
    CGRect newRect = descriptionRect;
    newRect.size.height = ceilf(noOfLine * lineSpacing + descriptionRect.size.height );
    descriptionRect = newRect;
    
    return descriptionRect;
    
}

@end
