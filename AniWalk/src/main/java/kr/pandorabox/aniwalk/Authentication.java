package kr.pandorabox.aniwalk;

import java.util.HashMap;
import java.util.Random;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class Authentication {
	@Autowired
	private SHA256 hash;
	
	public String auth(String wk_phone) {
	    String api_key = "NCSZWHTZKWELPOQD";
	    String api_secret = "XFMSMEGET60Q3DSIQBPALSX7WEEC0OCU";
	    Message coolsms = new Message(api_key, api_secret);
	    Random ran = new Random();
	    String auth = Integer.toString(ran.nextInt(899999) + 100000);

	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", wk_phone);
	    params.put("from", "01092796963");
	    params.put("type", "SMS");
	    params.put("text", "[애니워크 산책 서비스] 인증번호\n"+"["+ auth + "]를 입력해주세요." );
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	    auth = hash.toSHA256(auth);
	    return auth;
	  }
}
