//
//  NSData+Crypto.m
//  四川移动手机营业厅
//
//  Created by Ethan Keung on 7/15/14.
//  Copyright (c) 2014 iBCode Studio. All rights reserved.
//

#import "NSData+Crypto.h"
#import <CommonCrypto/CommonCryptor.h>

/// Default DES string key
static NSString * const kDESKey = @"J@c^kT~!";

@implementation NSData (Crypto)

- (NSData *)DESEncrypt
{
    return [self DESEncryptWithKey:kDESKey];
}

- (NSData *)DESDecrypt
{
    return [self DESDecryptWithKey:kDESKey];
}

- (NSData *)DESEncryptWithKey:(NSString *)key
{
    // Create and initialize buffer
    size_t bufferSize = ([self length] + kCCBlockSizeDES) & ~(kCCKeySizeDES - 1);
    void *buffer = malloc(bufferSize);
    memset(buffer, 0, bufferSize);
    
    size_t numberOfBytesEncrypted = 0;
    
    // Encrypt data
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          [key UTF8String], kCCKeySizeDES,
                                          NULL,
                                          [self bytes], [self length],
                                          buffer, bufferSize,
                                          &numberOfBytesEncrypted);
    
    // Return encrypted data if successful, otherwise nil
    if (cryptStatus == kCCSuccess && numberOfBytesEncrypted <= bufferSize) {
        return [NSData dataWithBytesNoCopy:buffer length:numberOfBytesEncrypted];
    } else {
        free(buffer);
        return nil;
    }
}

- (NSData *)DESDecryptWithKey:(NSString *)key
{
    // Create and initialize buffer
    size_t bufferSize = ([self length] + kCCBlockSizeDES) & ~(kCCKeySizeDES - 1);
    void *buffer = malloc(bufferSize);
    memset(buffer, 0, bufferSize);
    
    size_t numberOfBytesDecrypted = 0;
    
    // Decrypt data
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          [key UTF8String], kCCKeySizeDES,
                                          NULL,
                                          [self bytes], [self length],
                                          buffer, bufferSize,
                                          &numberOfBytesDecrypted);
    
    // Return decrypted data if successful, otherwise nil
    if (cryptStatus == kCCSuccess && numberOfBytesDecrypted <= bufferSize) {
        return [NSData dataWithBytesNoCopy:buffer length:numberOfBytesDecrypted];
    } else {
        free(buffer);
        return nil;
    }
}

@end
