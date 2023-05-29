package org.example;

import java.io.*;
import java.nio.Buffer;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalTime;
import java.util.Objects;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class Main {
    public static void main(String[] args) throws FileNotFoundException {
        Object o=null;
        Objects.requireNonNull(o,"kong1");
    }
   public static void copy(String source ,String target) throws FileNotFoundException {
        try (FileInputStream fileInputStream=new FileInputStream(source);FileOutputStream  fileOutputStream=new FileOutputStream(target)){
            byte buffer[]=new byte[512];
            int len;
            while((len=fileInputStream.read(buffer))!=-1){
                fileOutputStream.write(buffer,0,len);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
       Path p=Path.of("ss");
        FileInputStream fileInputStream=new FileInputStream(source);
        try {
            byte b[]=fileInputStream.readAllBytes();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }



    }

//    private static void copy(String source, String target) {
//        try(FileInputStream in = new FileInputStream(source);
//            FileOutputStream out = new FileOutputStream(target)) {
//            byte[] buffer = new byte[512];
//            int len;
//            while ((len = in.read(buffer)) != -1) {
//                out.write(buffer, 0, len);
//            }
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }
}