package io.renren.common.utils;
import org.apache.commons.codec.binary.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.Charset;
import java.util.Arrays;
public class QiWeiBaoUtils {
    /**
     * 加密
     * @param data
     * @param key
     * @param iv
     * @return
     * @throws Exception
     */
    public static String encrypt(String data, String key, String iv) throws Exception {
        SecretKeySpec keyspec = new SecretKeySpec(key.getBytes(), "AES");
        IvParameterSpec ivspec = new IvParameterSpec(iv.getBytes());
        Cipher cipher = Cipher.getInstance("AES/CBC/NoPadding");//"算法/模式/补码方式"
        cipher.init(Cipher.ENCRYPT_MODE, keyspec, ivspec);
        byte[] encrypted = cipher.doFinal(PKCS7Encode(data).getBytes());
        return new Base64().encodeToString(encrypted);
    }

    /**
     * 解密
     * @param encryptData
     * @param key
     * @param iv
     * @return
     * @throws Exception
     */
    public static String decrypt(String encryptData, String key, String iv) throws Exception {
        byte[] encrypted1 = new Base64().decode(encryptData);
        SecretKeySpec keyspec = new SecretKeySpec(key.getBytes(), "AES");
        IvParameterSpec ivspec = new IvParameterSpec(iv.getBytes());
        Cipher cipher = Cipher.getInstance("AES/CBC/NoPadding");
        cipher.init(Cipher.DECRYPT_MODE, keyspec, ivspec);
        byte[] original = cipher.doFinal(encrypted1);

        // 去除补位字符
        byte[] bytes = PKCS7Decode(original);
        return new String(bytes);
    }

    /**
     * 补全
     * @param data
     * @return
     */
    public static String PKCS7Encode(String data) {
        int blocksize = 32;
        int padsize = blocksize - (data.getBytes().length % blocksize);
        if (padsize <= 0) {
            return data;
        }
        char[] result = new char[padsize];
        for (int i = 0; i < padsize; i++) {
            result[i] = (char) padsize;
        }
        data += new String(result);
        return data;
    }

    /**
     * 剔除补全
     * @param decrypted
     * @return
     */
    static byte[] PKCS7Decode(byte[] decrypted) {
        int pad =  (int)decrypted[decrypted.length - 1];
        if (pad < 1 || pad > 32) {
            pad = 0;
        }
        return Arrays.copyOfRange(decrypted, 0, decrypted.length - pad);
    }
}
