package jp.co.marugen.hakai;

import android.app.Activity;
import android.content.Intent;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.os.Vibrator;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.animation.Animation;
import android.view.animation.TranslateAnimation;
import android.widget.Button;
import android.widget.ImageView;
import co.jp.marugen.hakai.R;

public class SettingActivity extends Activity {

    private int button = 0;
    int rnd = 0;
    Animation animation = null;
    private MediaPlayer mediaPlayer;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_setting);

        click_btn();
    }
    
    public void click_btn(){

        Button btn = (Button) findViewById(R.id.button1);
        btn.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {

                Intent intent = new Intent(SettingActivity.this, GameActivity.class);

                intent.putExtra("selectbutton", button);
                startActivity(intent);
                finish();
            }
        });

    }

    
    
    @Override
    public void onWindowFocusChanged(boolean hasFocus) {
        super.onWindowFocusChanged(hasFocus);
        int width = findViewById(R.id.button2).getWidth();

        mediaPlayer = MediaPlayer.create(this, R.raw.click);
        
        final ImageView iv = (ImageView) findViewById(R.id.imageView2);
        final ImageView iv1 = (ImageView) findViewById(R.id.imageView1);

        final Button btn1 = (Button) findViewById(R.id.button5);
        final Button btn2 = (Button) findViewById(R.id.button2);
        final Button btn3 = (Button) findViewById(R.id.button3);
        final Button btn4 = (Button) findViewById(R.id.button4);


        final float select1 = (width / 4) * 3;
        final float select2 = (width / 4);
        
        TranslateAnimation translateAnimation = new TranslateAnimation(0.0f, (select1 * -1), 0.0f,
                0.0f);
        translateAnimation.setDuration(0);
        translateAnimation.setFillAfter(true);
        btn2.startAnimation(translateAnimation);
        btn3.startAnimation(translateAnimation);
        btn4.startAnimation(translateAnimation);

        TranslateAnimation translateAnimation1 = new TranslateAnimation(0.0f, (select2 * -1), 0.0f, 0.0f);
        translateAnimation1.setDuration(0);
        translateAnimation1.setFillAfter(true);
        btn1.startAnimation(translateAnimation1);

        button = 1;
        btn1.setOnClickListener(new OnClickListener() {

            @Override
            public void onClick(View v) {
                if (button == 2) {

                    TranslateAnimation translateAnimation = new TranslateAnimation((select2 * -1),
                            (select1 * -1), 0.0f, 0.0f);
                    translateAnimation.setDuration(1000);
                    translateAnimation.setFillAfter(true);
                    btn2.startAnimation(translateAnimation);
                } else if (button == 3) {
                    TranslateAnimation translateAnimation = new TranslateAnimation((select2 * -1),
                            (select1 * -1), 0.0f, 0.0f);
                    translateAnimation.setDuration(1000);
                    translateAnimation.setFillAfter(true);
                    btn3.startAnimation(translateAnimation);
                } else if (button == 4) {
                    TranslateAnimation translateAnimation = new TranslateAnimation((select2 * -1),
                            (select1 * -1), 0.0f, 0.0f);
                    translateAnimation.setDuration(1000);
                    translateAnimation.setFillAfter(true);
                    btn4.startAnimation(translateAnimation);
                }

                mediaPlayer.start();
                TranslateAnimation translateAnimation = new TranslateAnimation((select1 * -1),
                        (select2 * -1), 0.0f, 0.0f);
                translateAnimation.setDuration(1000);
                translateAnimation.setFillAfter(true);
                btn1.startAnimation(translateAnimation);

                iv.setImageResource(R.drawable.sample_kitchen);
                iv1.setImageResource(R.drawable.title_kictchen01);
                button = 1;

            }
        });

        btn2.setOnClickListener(new OnClickListener() {

            @Override
            public void onClick(View v) {

                if (button == 1) {
                    TranslateAnimation translateAnimation = new TranslateAnimation((select2 * -1),
                            (select1 * -1), 0.0f, 0.0f);
                    translateAnimation.setDuration(1000);
                    translateAnimation.setFillAfter(true);
                    btn1.startAnimation(translateAnimation);
                } else if (button == 3) {
                    TranslateAnimation translateAnimation = new TranslateAnimation((select2 * -1),
                            (select1 * -1), 0.0f, 0.0f);
                    translateAnimation.setDuration(1000);
                    translateAnimation.setFillAfter(true);
                    btn3.startAnimation(translateAnimation);
                } else if (button == 4) {
                    TranslateAnimation translateAnimation = new TranslateAnimation((select2 * -1),
                            (select1 * -1), 0.0f, 0.0f);
                    translateAnimation.setDuration(1000);
                    translateAnimation.setFillAfter(true);
                    btn4.startAnimation(translateAnimation);
                }
                mediaPlayer.start();

                TranslateAnimation translateAnimation = new TranslateAnimation((select1 * -1),
                        (select2 * -1), 0.0f, 0.0f);
                translateAnimation.setDuration(1000);
                translateAnimation.setFillAfter(true);
                btn2.startAnimation(translateAnimation);

                iv.setImageResource(R.drawable.sample_school);
                iv1.setImageResource(R.drawable.title_shcool01);

                button = 2;
            }
        });

        btn3.setOnClickListener(new OnClickListener() {

            @Override
            public void onClick(View v) {
                if (button == 1) {
                    TranslateAnimation translateAnimation = new TranslateAnimation((select2 * -1),
                            (select1 * -1), 0.0f, 0.0f);
                    translateAnimation.setDuration(1000);
                    translateAnimation.setFillAfter(true);
                    btn1.startAnimation(translateAnimation);
                } else if (button == 2) {
                    TranslateAnimation translateAnimation = new TranslateAnimation((select2 * -1),
                            (select1 * -1), 0.0f, 0.0f);
                    translateAnimation.setDuration(1000);
                    translateAnimation.setFillAfter(true);
                    btn2.startAnimation(translateAnimation);
                } else if (button == 4) {
                    TranslateAnimation translateAnimation = new TranslateAnimation((select2 * -1),
                            (select1 * -1), 0.0f, 0.0f);
                    translateAnimation.setDuration(1000);
                    translateAnimation.setFillAfter(true);
                    btn4.startAnimation(translateAnimation);
                }
                mediaPlayer.start();

                TranslateAnimation translateAnimation = new TranslateAnimation((select1 * -1),
                        (select2 * -1), 0.0f, 0.0f);
                translateAnimation.setDuration(1000);
                translateAnimation.setFillAfter(true);
                btn3.startAnimation(translateAnimation);

                iv.setImageResource(R.drawable.sample_street);
                iv1.setImageResource(R.drawable.title_street01);

                button = 3;
            }
        });

        btn4.setOnClickListener(new OnClickListener() {

            @Override
            public void onClick(View v) {
                if (button == 1) {
                    TranslateAnimation translateAnimation = new TranslateAnimation((select2 * -1),
                            (select1 * -1), 0.0f, 0.0f);
                    translateAnimation.setDuration(1000);
                    translateAnimation.setFillAfter(true);
                    btn1.startAnimation(translateAnimation);
                } else if (button == 2) {
                    TranslateAnimation translateAnimation = new TranslateAnimation((select2 * -1),
                            (select1 * -1), 0.0f, 0.0f);
                    translateAnimation.setDuration(1000);
                    translateAnimation.setFillAfter(true);
                    btn2.startAnimation(translateAnimation);
                } else if (button == 3) {
                    TranslateAnimation translateAnimation = new TranslateAnimation((select2 * -1),
                            (select1 * -1), 0.0f, 0.0f);
                    translateAnimation.setDuration(1000);
                    translateAnimation.setFillAfter(true);
                    btn3.startAnimation(translateAnimation);
                }

                mediaPlayer.start();

                TranslateAnimation translateAnimation = new TranslateAnimation((select1 * -1),
                        (select2 * -1), 0.0f, 0.0f);
                translateAnimation.setDuration(1000);
                translateAnimation.setFillAfter(true);
                btn4.startAnimation(translateAnimation);

                iv.setImageResource(R.drawable.rndscreen);
                iv1.setImageResource(R.drawable.title_random01);

                button = 4;
            }
        });
    
    }

}