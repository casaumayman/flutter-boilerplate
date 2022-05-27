package com.example.car_cleaning_demo_flutter;
import android.app.AlertDialog;
import android.app.PendingIntent;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.nfc.NfcAdapter;
import android.nfc.Tag;
import android.nfc.tech.IsoDep;
import android.nfc.tech.NfcB;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import jp.co.osstech.libjeid.InvalidPinException;

public class MainActivity extends FlutterActivity implements TagDiscoveredListener
{
    public static final String CHANNEL = "com.example.car_cleaning_demo_flutter.chanel";
    public static final String KEY_NATIVE = "SCAN_NFC";

    public static final String TAG = "JeidReader";
    protected NfcAdapter nfcAdapter;

    HashMap<String,String> hashMap=new HashMap<>();


    // NFC読み取りモード
    private final int NFC_AUTO_MODE = 0;
    private final int NFC_READER_MODE = 1;
    private final int NFC_FD_MODE = 2;
    protected int nfcMode;
    // ビューアーやメニュー画面ではNFC読み取りを無効化する
    // また、PIN間違いが発生してダイヤログを表示している間に
    // 連続読み取りが発生することを防ぐためのフラグ
    protected boolean enableNFC = false;

    static String pin1 = "";
    static String pin2 = "";

    String myData="";
    String err;

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);

        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            final Map<String, String> arguments = call.arguments();
                            if (call.method.equals(KEY_NATIVE)) {
                                 pin1 = arguments.get("pin1") == null ? "" : arguments.get("pin1");
                                 pin2 = arguments.get("pin2") == null ? "" : arguments.get("pin2");
//                                HashMap<String, String> res = new HashMap<>();
//                                res.put("pin1", "NGUYEN VAN A");
//                                res.put("pin2", "NGUYEN VAN B");

                                if(err!=null){
                                    result.error("",err,null);
                                }else {
                                    String jsonString = new JSONObject(hashMap).toString();
                                    result.success(jsonString);
                                }


                            }
                            else {
                                result.notImplemented();
                            }

                        }
                );
    }


    public String getPin1() {
        return pin1;
    }

    public String getPin2() {
        return pin2;
    }
    public void setErr(String err){
        this.err=err;
    }

    @Override
    protected void onNewIntent(@NonNull Intent intent) {
        super.onNewIntent(intent);
        Log.d("onNewIntent","onNewIntent");
        Tag tag = intent.getParcelableExtra(NfcAdapter.EXTRA_TAG);
        this.onTagDiscovered(tag);

    }
    public void onTagDiscovered(final Tag tag) {
        Log.d("onTagDiscovered","onTagDiscovered");
        DLReaderTask task = new DLReaderTask(MainActivity.this, tag);
        ExecutorService exec = Executors.newSingleThreadExecutor();
        exec.submit(task);
        Log.d("GetPin", " Pin1 :" + getPin1() + " Pin 2 : " + getPin2());

    }


    protected void showInvalidPinDialog(String name, InvalidPinException e) {
        String title;
        String msg;
        if (e.isBlocked()) {
            title = name + "がブロックされています";
            msg = "警察署でブロック解除の申請をしてください。";
        } else {
            int counter = e.getCounter();
            title = name + "が間違っています";
            msg = name + "を正しく入力してください。";
            msg += "のこり" + counter + "回間違えるとブロックされます。";

        }
        print(title);
        print(msg);
        showDialog(title, msg);
    }

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Log.d(TAG, getClass().getSimpleName() + "#onCreate(" + savedInstanceState + ")");
        enableNFC = true;
        SharedPreferences prefs = getSharedPreferences("settings", Context.MODE_PRIVATE);
        this.nfcMode = prefs.getInt("nfc_mode", NFC_AUTO_MODE);

        if (this.nfcMode == NFC_AUTO_MODE) {
            Toast.makeText(this, "oncreate display", Toast.LENGTH_SHORT).show();

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                // Android 8.0以上はReaderModeを利用
                this.nfcMode = NFC_READER_MODE;
            } else {
                // Android 8.0未満はForegroundDispatchを利用
                this.nfcMode = NFC_FD_MODE;
            }
        }

    }

    @Override
    protected void onResume() {
        super.onResume();
        Log.d(TAG, getClass().getSimpleName() + "#RunonResume()");
        super.onResume();

        invalidateOptionsMenu();

        nfcAdapter = NfcAdapter.getDefaultAdapter(this);
        if (nfcAdapter == null) {
           setErr("This devide no suport nfc");
            return ;
        }

        if (this.nfcMode == NFC_READER_MODE) {
            Log.d(TAG, "NFC mode: ReaderMode");
//            setErr("NFC mode: ReaderMode");

            if (!this.enableNFC) {
                // メニュー画面やビューアーでNFC読み取りを無効化します
                // これを行わないと通常モード(OS標準)の読み取りが有効になるからです
                nfcAdapter.enableReaderMode(this, null, NfcAdapter.STATE_OFF, null);
                return;
            }
            Bundle options = new Bundle();
            //options.putInt(NfcAdapter.EXTRA_READER_PRESENCE_CHECK_DELAY, 500);
            nfcAdapter.enableReaderMode(this,
                    new NfcAdapter.ReaderCallback() {
                        @Override
                        public void onTagDiscovered(Tag tag) {
                            onTagDiscovered(tag);
                        }
                    },
                    NfcAdapter.FLAG_READER_NFC_B | NfcAdapter.FLAG_READER_SKIP_NDEF_CHECK,
                    options);
        } else {
            Log.d(TAG, "NFC mode: ForegroundDispatch");
            if (!this.enableNFC) {
                return;
            }
            Intent intent = new Intent(this, getClass());
            intent.setFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP);
            PendingIntent pendingIntent = PendingIntent.getActivity(getApplicationContext(), 0, intent, 0);
            String[][] techLists = new String[][]{
                    new String[]{NfcB.class.getName()},
                    new String[]{IsoDep.class.getName()}
            };
            nfcAdapter.enableForegroundDispatch(this, pendingIntent, null, techLists);
        }
    }

    @Override
    protected void onPause() {
        super.onPause();
        Log.d("onPause", "onPause");
        Log.d(TAG, getClass().getSimpleName() + "#onPause()");
        super.onPause();
        if (nfcAdapter == null) {
            setErr("This devide no suport nfc");
            return;
        }
        if (nfcMode == NFC_READER_MODE) {
            nfcAdapter.disableReaderMode(this);
        } else {
            nfcAdapter.disableForegroundDispatch(this);
        }

    }

//    @TargetApi(Build.VERSION_CODES.CUPCAKE)
//    protected void hideKeyboard() {
//        InputMethodManager imm = (InputMethodManager) getSystemService(Context.INPUT_METHOD_SERVICE);
//        if (imm == null) {
//            return;
//        }
//        View view = getCurrentFocus();
//        if (view == null) {
//            return;
//        }
//        imm.hideSoftInputFromWindow(view.getWindowToken(), InputMethodManager.HIDE_NOT_ALWAYS);
//    }
    protected  void getHasData(HashMap<String,String> data){
        Handler handler = new Handler(Looper.getMainLooper());

        handler.post(new Runnable() {
            @Override
            public void run() {
//                 Log.d("Print", msg + "\n");
                hashMap=data;
//                Toast.makeText(MainActivity.this, data.toString(), Toast.LENGTH_SHORT).show();

            }
        });
    }

    protected void print(String msg) {
        Handler handler = new Handler(Looper.getMainLooper());
        handler.post(new Runnable() {
            @Override
            public void run() {
                Log.d("Print", msg + "\n");
                myData=msg+"\n";
                Toast.makeText(MainActivity.this, msg + "\n", Toast.LENGTH_SHORT).show();

            }
        });
    }


    protected void showDialog(String title, String msg) {
        Log.d(TAG, getClass().getSimpleName() + "#showDialog()");
        this.enableNFC = false;
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle(title);
        builder.setMessage(msg);
        builder.setNeutralButton(
                "戻る",
                new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        enableNFC = true;
                    }
                });

        Handler handler = new Handler(Looper.getMainLooper());
        handler.post(new Runnable() {
            @Override
            public void run() {
                AlertDialog dialog = builder.create();
                dialog.show();
            }
        });
    }
}

