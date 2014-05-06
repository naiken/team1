package jp.co.marugen.hakai;

import android.app.Activity;
import android.content.Intent;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.os.Vibrator;
import android.view.KeyEvent;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import co.jp.marugen.hakai.R;

public class EndActivity extends Activity {

    private MediaPlayer mediaPlayer;
    private MediaPlayer mediaPlayer2;
    private MediaPlayer mediaPlayer3;
    private Vibrator vibrator;
    private int rnd2;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_end);

        mediaPlayer = MediaPlayer.create(this, R.raw.summer_beach1);
        mediaPlayer.setLooping(true);
        mediaPlayer2 = MediaPlayer.create(this, R.raw.takibi);
        mediaPlayer2.setLooping(true);
        mediaPlayer3 = MediaPlayer.create(this, R.raw.torinisaezuri);
        mediaPlayer3.setLooping(true);

        vibrator = (Vibrator) getSystemService(VIBRATOR_SERVICE);

        int rnd = (int) (Math.random() * 8);
        
        rnd2 = (int) (Math.random() * 6);

        if (rnd == 0) {
            ImageView textiv = (ImageView) findViewById(R.id.imageView2);
            textiv.setImageResource(R.drawable.text01);
        } else if (rnd == 1) {
            ImageView textiv = (ImageView) findViewById(R.id.imageView2);
            textiv.setImageResource(R.drawable.text02);
        } else if (rnd == 2) {
            ImageView textiv = (ImageView) findViewById(R.id.imageView2);
            textiv.setImageResource(R.drawable.text03);
        } else if (rnd == 3) {
            ImageView textiv = (ImageView) findViewById(R.id.imageView2);
            textiv.setImageResource(R.drawable.text04);
        } else if (rnd == 4) {
            ImageView textiv = (ImageView) findViewById(R.id.imageView2);
            textiv.setImageResource(R.drawable.text05);
        } else if (rnd == 5) {
            ImageView textiv = (ImageView) findViewById(R.id.imageView2);
            textiv.setImageResource(R.drawable.text06);
        } else if (rnd == 6) {
            ImageView textiv = (ImageView) findViewById(R.id.imageView2);
            textiv.setImageResource(R.drawable.text07);
        } else if (rnd == 7) {
            ImageView textiv = (ImageView) findViewById(R.id.imageView2);
            textiv.setImageResource(R.drawable.text08);
        }

        if (rnd2 == 0) {
            mediaPlayer.start();
            ImageView iv = (ImageView) findViewById(R.id.imageView1);
            iv.setImageResource(R.drawable.sample_iyashi01);
        } else if (rnd2 == 1) {
            mediaPlayer.start();
            ImageView iv = (ImageView) findViewById(R.id.imageView1);
            iv.setImageResource(R.drawable.sample_iyashi02);
        } else if (rnd2 == 2) {
            mediaPlayer.start();
            ImageView iv = (ImageView) findViewById(R.id.imageView1);
            iv.setImageResource(R.drawable.sample_iyashi03);
        } else if (rnd2 == 3) {
            mediaPlayer2.start();
            ImageView iv = (ImageView) findViewById(R.id.imageView1);
            iv.setImageResource(R.drawable.sample_iyashi04);
        } else if (rnd2 == 4) {
            mediaPlayer3.start();
            ImageView iv = (ImageView) findViewById(R.id.imageView1);
            iv.setImageResource(R.drawable.sample_iyashi05);
        } else if (rnd2 == 5) {
            mediaPlayer3.start();
            ImageView iv = (ImageView) findViewById(R.id.imageView1);
            iv.setImageResource(R.drawable.sample_iyashi06);
        }

        Button btn = (Button) findViewById(R.id.button1);
        btn.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                mediaPlayer.stop();
                mediaPlayer2.stop();
                mediaPlayer3.stop();
                Intent intent = new Intent(EndActivity.this, TopActivity.class);
                startActivity(intent);
                finish();
            }
        });
    }

    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK) {
            mediaPlayer.stop();
            mediaPlayer2.stop();
            mediaPlayer3.stop();
            finish();
            return super.onKeyDown(keyCode, event);

        } else {
            return false;
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        if (rnd2 == 0 || rnd2 == 1 || rnd2 == 2) {
            mediaPlayer.start();
        } else if (rnd2 == 3) {
            mediaPlayer2.start();
        } else if (rnd2 == 4 || rnd2 == 5) {
            mediaPlayer3.start();
        }
    }

    @Override
    protected void onStop() {
        super.onStop();
        mediaPlayer.pause();
        mediaPlayer2.pause();
        mediaPlayer3.pause();
    }
}
