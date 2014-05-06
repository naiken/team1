package jp.co.marugen.hakai;

import android.app.Activity;
import android.content.Intent;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.os.Vibrator;
import android.view.MotionEvent;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.CycleInterpolator;
import android.view.animation.TranslateAnimation;
import android.widget.ImageView;
import co.jp.marugen.hakai.R;

public class GameActivity extends Activity {

    private int count = 0;
    Animation animation = null;
    final int time = 250;
    int rnd0 = 0;
    private MediaPlayer mediaPlayer1;
    private MediaPlayer mediaPlayer2;
    private MediaPlayer mediaPlayer3;
    private Vibrator vibrator;

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_game);

        mediaPlayer1 = MediaPlayer.create(this, R.raw.flying_pan1);
        mediaPlayer2 = MediaPlayer.create(this, R.raw.damage1);
        mediaPlayer3 = MediaPlayer.create(this, R.raw.striking1);
        vibrator = (Vibrator) getSystemService(VIBRATOR_SERVICE);

        init();
    }

    public void init() {

        // ラジオボタンのID取得
        Intent intent = this.getIntent();
        // インテントから値を取得
        final int selectbutton = intent.getIntExtra("selectbutton", 0);

        selectimage(selectbutton);
        // btnclick();
    }

    public void selectimage(int selectbutton) {

        ImageView iv = (ImageView) findViewById(R.id.imageView1);

        if (selectbutton == 1) {
            iv.setImageResource(R.drawable.nabe01);
        } else if (selectbutton == 2) {
            iv.setImageResource(R.drawable.akikan01);
        } else if (selectbutton == 3) {
            iv.setImageResource(R.drawable.car01);
        } else if (selectbutton == 4) {
            rnd0 = (int) (Math.random() * 3 + 1);
            if (rnd0 == 1) {
                iv.setImageResource(R.drawable.nabe01);
            } else if (rnd0 == 2) {
                iv.setImageResource(R.drawable.akikan01);
            } else if (rnd0 == 3) {
                iv.setImageResource(R.drawable.car01);
            }
        }
        touch(selectbutton, rnd0);
    }

    public void touch(final int selectbutton, final int rnd0) {

        ImageView iv = (ImageView) findViewById(R.id.imageView1);

        iv.setOnTouchListener(new View.OnTouchListener() {

            @Override
            public boolean onTouch(View v, MotionEvent event) {
                final ImageView iv2 = (ImageView) findViewById(R.id.imageView1);
                count++;

                // 画像が動くアニメーション
                animation = new TranslateAnimation(0, 10, 0, 10);
                animation.setDuration(time);
                animation.setInterpolator(new CycleInterpolator(count));
                iv2.startAnimation(animation);

                //vibrator.vibrate(150);

                if (selectbutton == 1) {
                    mediaPlayer1.start();
                    nabe(selectbutton);
                } else if (selectbutton == 2) {
                    mediaPlayer2.start();
                    school(selectbutton);
                } else if (selectbutton == 3) {
                    mediaPlayer3.start();
                    town(selectbutton);
                } else if (selectbutton == 4) {
                    if (rnd0 == 1) {
                        mediaPlayer1.start();
                        nabe(selectbutton);
                    } else if (rnd0 == 2) {
                        mediaPlayer2.start();
                        school(selectbutton);
                    } else if (rnd0 == 3) {
                        mediaPlayer3.start();
                        town(selectbutton);
                    }
                }
                return false;
            }
        });
    }

    public void nabe(int selectbutton) {
        final ImageView iv = (ImageView) findViewById(R.id.imageView1);
        if (count == 3) {
            iv.setImageResource(R.drawable.nabe02);
        } else if (count == 9) {
            iv.setImageResource(R.drawable.nabe03);
        } else if (count == 15) {
            iv.setImageResource(R.drawable.nabe04);
        } else if (count == 25) {
            iv.setImageResource(R.drawable.nabe05);
        } else if (count == 27) {
            Intent intent = new Intent(GameActivity.this, EndActivity.class);
            intent.putExtra("totalcount", count);
            startActivity(intent);
            finish();
            mediaPlayer1.stop();
        }

    }

    public void school(int selectbutton) {
        final ImageView iv = (ImageView) findViewById(R.id.imageView1);
        if (count == 3) {
            iv.setImageResource(R.drawable.akikan02);
        } else if (count == 9) {
            iv.setImageResource(R.drawable.akikan03);
        } else if (count == 15) {
            iv.setImageResource(R.drawable.akikan04);
        } else if (count == 25) {
            iv.setImageResource(R.drawable.akikan05);
        } else if (count == 27) {
            Intent intent = new Intent(GameActivity.this, EndActivity.class);
            intent.putExtra("totalcount", count);
            startActivity(intent);
            mediaPlayer2.stop();
            finish();
        }

    }

    public void town(int selectbutton) {
        final ImageView iv = (ImageView) findViewById(R.id.imageView1);
        if (count == 3) {
            iv.setImageResource(R.drawable.car02);
        } else if (count == 9) {
            iv.setImageResource(R.drawable.car03);
        } else if (count == 15) {
            iv.setImageResource(R.drawable.car04);
        } else if (count == 25) {
            iv.setImageResource(R.drawable.car05);
        } else if (count == 27) {
            Intent intent = new Intent(GameActivity.this, EndActivity.class);
            intent.putExtra("totalcount", count);
            startActivity(intent);
            mediaPlayer3.stop();
            finish();
        }

    }
}
