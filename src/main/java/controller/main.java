package controller;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public class main {
	public static void main(String[] args) {
        ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);

        // Lập lịch để chạy hàm duyetlichnghi() mỗi ngày lúc 00:00
        scheduler.scheduleAtFixedRate(new Runnable() {
            public void run() {
                duyetlichnghiAutomatically();
            }
        }, getDelayToNextMidnight(), 24, TimeUnit.HOURS);
    }

    private static void duyetlichnghiAutomatically() {
        // Thực hiện logic tự động duyệt ở đây
        // Gọi phương thức duyetlichnghi() hoặc sao chép logic từ duyetlichnghi() vào đây
    }

    private static long getDelayToNextMidnight() {
        long now = System.currentTimeMillis();
        long midnight = (now / 86400000L + 1) * 86400000L; // Lấy thời gian cho tới nửa đêm tiếp theo
        return midnight - now;
    }
}
