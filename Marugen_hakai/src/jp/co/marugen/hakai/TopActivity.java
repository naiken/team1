package jp.co.marugen.hakai;

import net.app_c.cloud.sdk.AppCCloud;
import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.ImageView;
import co.jp.marugen.hakai.R;

public class TopActivity extends Activity {

    private AppCCloud appCCloud;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_top);

        // appC cloud生成
        appCCloud = new AppCCloud(this).start();

        Button btn = (Button) findViewById(R.id.button1);

        btn.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                Intent intent = new Intent(TopActivity.this, SettingActivity.class);
                startActivity(intent);
                finish();
            }
        });
    }

    @Override
    public void finish() {
        super.finish();
        // appC cloud終了処理
        appCCloud.finish();
    }
}
