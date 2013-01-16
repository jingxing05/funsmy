package com.funsmy.utils.oauth

import java.sql.Time
import org.scribe.builder.api.DefaultApi20
import org.scribe.extractors.AccessTokenExtractor 
import org.scribe.extractors.BaseStringExtractorImpl
import org.scribe.extractors.JsonTokenExtractor
import org.scribe.model.OAuthConfig;
import org.scribe.model.Token
import org.scribe.model.Verb
import org.scribe.utils.OAuthEncoder

class QqtApi  extends DefaultApi20{
	private static final String AUTHORIZE_URL = "https://open.t.qq.com/cgi-bin/oauth2/authorize?client_id=%s&response_type=code&redirect_uri=%s&state=%s";
	//private static final String SCOPED_AUTHORIZE_URL = AUTHORIZE_URL + "&scope=%s";


	/**
	 * 返回获取授权token的方式 腾讯微博的为 GET
	 */
	@Override
	public Verb getAccessTokenVerb()
	{
		return Verb.GET;
	}

	

	@Override
	public String getAccessTokenEndpoint()
	{
		return "https://open.t.qq.com/cgi-bin/oauth2/access_token?client_id=%s&client_secret=%s&redirect_uri=%s&grant_type=authorization_code&code=%s";
	}

	@Override
	public String getAuthorizationUrl(OAuthConfig config)
	{
		// Append scope if present
		if (config.hasScope())
		{
			return String.format(SCOPED_AUTHORIZE_URL, config.getApiKey(), OAuthEncoder.encode(config.getCallback()), OAuthEncoder.encode(config.getScope()));
		}
		else
		{
			return String.format(AUTHORIZE_URL, config.getApiKey(), OAuthEncoder.encode(config.getCallback()), Math.randomNumberGenerator.nextInt());
		}
	}
}
