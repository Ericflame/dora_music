package com.chz.test;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;
import android.os.Bundle;
import android.os.PersistableBundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.amap.api.services.core.AMapException;
import com.amap.api.services.core.ServiceSettings;
import com.amap.api.services.poisearch.PoiSearch;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity{
    private static final String CHANNEL = "samples";
    private PoiSearch poiSearch = null;
    private Context context;
    private MethodChannel.Result resultCallback = null;

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            //获取电量
                            if (call.method.equals("getBatteryLevel")) {
                                int batteryLevel = getBatteryLevel();
                                if (batteryLevel != -1) {
                                    result.success(batteryLevel);
                                } else {
                                    result.error("UNAVAILABLE", "Battery level not available.", null);
                                }
                            //获取位置信息
                            } else if(call.method.equals("searchAddress")){
                                try {
                                    searchAddress(call.argument("address"),result);
                                } catch (AMapException e) {
                                    e.printStackTrace();
                                }
                            }
                            //初始化ApiKey
                            else if(call.method.equals("setApiKey")){
                                setApiKey(call.argument("key"));
                            }
                            else if(call.method.equals("updatePrivacyStatement")){
                                updatePrivacyStatement();
                            }
                            else {
                                result.notImplemented();
                            }
                        }
                );
    }

    //获取电量
    private int getBatteryLevel() {
        int batteryLevel = -1;
        if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
            BatteryManager batteryManager = (BatteryManager) getSystemService(BATTERY_SERVICE);
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
        } else {
            Intent intent = new ContextWrapper(getApplicationContext()).
                    registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
            batteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) /
                    intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
        }

        return batteryLevel;
    }

    //初始化ApiKey
    private void setApiKey(String key) {
        ServiceSettings.getInstance().setApiKey(key);
    }

    private void updatePrivacyStatement() {
        ServiceSettings.updatePrivacyShow(this,true,true);
        ServiceSettings.updatePrivacyAgree(this,true);
    }

    //高德地址搜索
    void searchAddress(String address,MethodChannel.Result result) throws AMapException {
        //cityCode表示POI搜索区域，可以是城市编码也可以是城市名称，也可以传空字符串，空字符串代表全国在全国范围内进行搜索
        PoiSearch.Query query=new PoiSearch.Query(address, "", "四川省");
        query.setPageSize(10);// 设置每页最多返回多少条poiitem
        query.setPageNum(1);//设置查询页码
        poiSearch = new PoiSearch(context,query);
        poiSearch.setOnPoiSearchListener((PoiSearch.OnPoiSearchListener) this);
        poiSearch.searchPOIAsyn();
        resultCallback = result;
    }
}