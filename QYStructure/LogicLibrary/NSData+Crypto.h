//
//  NSData+Crypto.h
//  Logical Libaray
//
//  Created by Ethan Keung on 7/15/14.
//  Copyright (c) 2014 iBCode Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
    @category NSData+Crypto
 
    @discussion NSData+Crypto takes advantage of built-in system API to provide access to one symmetric encryption algorithm DES.
 */
@interface NSData (Crypto)

/*!
    @method DESEncrypt
 
    @abstract Encrypt data with default string key (@"ZdCX*@k^").
 
    @result Return an encrypted data.
 */
- (NSData *)DESEncrypt;

/*!
    @method DESDecrypt
 
    @abstract Decrypt data with default string key (@"ZdCX*@k^").
 
    @result Return an encrypted data.
 */
- (NSData *)DESDecrypt;

/*!
    @method DESEncryptWithKey:
 
    @abstract Encrypt data with specified string key.

    @param stringKey The string key used in the encryption.
 
    @result Return an encrypted data.
 */
- (NSData *)DESEncryptWithKey:(NSString *)key;

/*!
    @method DESDecryptWithKey:
 
    @abstract Decrypt data with specified string key.
 
    @param stringKey The string key used in the decryption.
 
    @result Return an decrypted data.
 */
- (NSData *)DESDecryptWithKey:(NSString *)key;

@end
