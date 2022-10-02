package com.blog.helpers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Helper {
    public static boolean deleteFile(String path) {
        File file = new File(path);
        return file.delete();
    }

    public static boolean saveFile(InputStream is, String path) {
        boolean f = false;
        try {
            byte[] b = new byte[is.available()];
            is.read(b);
            FileOutputStream out=new FileOutputStream(path);
            out.write(b);
            out.flush();
            out.close();
            f=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
}
