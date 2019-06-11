package com.qingclass;

import java.util.concurrent.TimeUnit;

/**
 * @author Wuji
 * @date 2019/6/10
 */
public class MainApp {

    public static void main(String[] args) {
        System.out.println("test start");
        while (true) {
            try {
                TimeUnit.SECONDS.sleep(10);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println("test is alive");
        }
    }

}
