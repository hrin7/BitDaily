package kr.co.bitdaily.util;

import com.google.cloud.translate.Translate;
import com.google.cloud.translate.TranslateOptions;
import com.google.cloud.translate.Translation;

public class TranslationAPI {
	
    private static Translate getTranslateService() {
        return TranslateOptions.getDefaultInstance().getService();
    }

    public static String translate(String text) {
        Translate translate = getTranslateService();

        Translation translation = translate.translate( text, 
        											   Translate.TranslateOption.sourceLanguage("en"), 
        											   Translate.TranslateOption.targetLanguage("ko")
        											  ); 

        return translation.getTranslatedText();
    }

}
