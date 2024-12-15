package util;

import com.paypal.base.rest.APIContext;

import java.util.HashMap;
import java.util.Map;

public class PayPalConfig {
    private static final String CLIENT_ID = "AT-gTYcPPpfrvVYKS1HY3Mg4tpUXqhFPjTIjx7NtydCKYCSBI72p0VxYpf5YaJ1vGax1GFa2MmGG1IA9"; // Replace with actual Client ID
    private static final String CLIENT_SECRET = "EHD1THNZmip25l-WtqyGb1Gs2vtDO0q3EcM4TOOhqtpp0ddaMozUbLaHBSzb-0mC0jni2Egl0CczVqxO"; // Replace with actual Client Secret
    private static final String MODE = "sandbox"; // Use "live" for production

    public static APIContext getAPIContext() {
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
        Map<String, String> configMap = new HashMap<>();
        configMap.put("mode", MODE);
        apiContext.setConfigurationMap(configMap);
        return apiContext;
    }
}
