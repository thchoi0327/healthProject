package com.health.siteUtil;

public class SiteUtil {

	private static boolean siteOpen = true;
	
	public static boolean isSiteOpen() {
		return siteOpen;
	}

	public static void setSiteOpen(boolean siteOpen) {
		SiteUtil.siteOpen = siteOpen;
	}
	
	
}
