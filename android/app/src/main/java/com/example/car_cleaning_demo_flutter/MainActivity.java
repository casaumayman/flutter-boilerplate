package com.example.car_cleaning_demo_flutter;

import android.content.Intent;
import android.util.Log;
import android.widget.Toast;

import androidx.annotation.NonNull;

import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    public static final String CHANNEL = "com.example.car_cleaning_demo_flutter.chanel";
    public static final String KEY_NATIVE = "SCAN_NFC";


    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        Intent intentD=getIntent();
        String data= intentD.getStringExtra("name");
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            final Map<String, String> arguments = call.arguments();
                            if (call.method.equals(KEY_NATIVE)) {
                                String pin1 = arguments.get("pin1") == null ? "" : arguments.get("pin1");
                                String pin2 = arguments.get("pin2") == null ? "" : arguments.get("pin2");
                                HashMap<String, String> res = new HashMap<>();
                                res.put("pin1", pin1);
                                res.put("pin2", pin2);
                                String jsonString = new JSONObject(res).toString();
                                result.success(jsonString);
                            }
                            else {
                                result.notImplemented();
                            }

                        }
                );
    }
}
