package com.aaa.util;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import Decoder.BASE64Decoder;
import Decoder.BASE64Encoder;




/**
 * AES 是一种可逆加密算法，对用户的敏感信息加密处理 对原始数据进行AES加密后，在进行Base64编码转化；
 */
@SuppressWarnings("all")
public class AESUtil {

    /*
     * 加密用的Key 可以用26个字母和数字组成 此处使用AES-128-CBC加密模式，key需要为16位。
     */
    private String sKey = "1234123412341234";//key16位，可自行修改
    private String ivParameter = "1234123412341234";//偏移量	16位,可自行修改

    private static AESUtil instance = null;

    private AESUtil() {

    }

    public static AESUtil getInstance() {
        if (instance == null)
            instance = new AESUtil();
        return instance;
    }
    


    // 加密
    public String encrypt(String sSrc) {
        Cipher cipher;
        byte[] encrypted=null;
		try {
			cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
			byte[] raw = sKey.getBytes();
		    SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
		    IvParameterSpec iv = new IvParameterSpec(ivParameter.getBytes());// 使用CBC模式，需要一个向量iv，可增加加密算法的强度
	        cipher.init(Cipher.ENCRYPT_MODE, skeySpec, iv);
	        encrypted = cipher.doFinal(sSrc.getBytes("utf-8"));
	       
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvalidAlgorithmParameterException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (BadPaddingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return new BASE64Encoder().encode(encrypted);// 此处使用BASE64做转码。
    }

    // 解密
    public String decrypt(String sSrc) {
        byte[] raw;
        String originalString="";
		try {
			raw = sKey.getBytes("ASCII");
			SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
	        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
	        IvParameterSpec iv = new IvParameterSpec(ivParameter.getBytes());
	        cipher.init(Cipher.DECRYPT_MODE, skeySpec, iv);
	        byte[] encrypted1 = new BASE64Decoder().decodeBuffer(sSrc);// 先用base64解密
	        byte[] original = cipher.doFinal(encrypted1);
	        originalString = new String(original, "utf-8");
	        
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvalidAlgorithmParameterException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (BadPaddingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
		return originalString;
    }
    
   
    
    public static String encodeBytes(byte[] bytes) {
        StringBuffer strBuf = new StringBuffer();

        for (int i = 0; i < bytes.length; i++) {
            strBuf.append((char) (((bytes[i] >> 4) & 0xF) + ((int) 'a')));
            strBuf.append((char) (((bytes[i]) & 0xF) + ((int) 'a')));
        }

        return strBuf.toString();
    }

    public static void main(String[] args) {
    	
        // 需要加密的字串
        //String cSrc = "admin";

        String enString = AESUtil.getInstance().encrypt("123456");
        System.out.println("加密后的字串是：" + enString);
        
        String DeString = AESUtil.getInstance().decrypt("k7QFtKvgXBSY4ImlRB0aeA==");
        System.out.println("解密后的字串是：" + DeString);
       
    }
    
}