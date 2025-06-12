package org.example.pojo;

public class Manager {
    private String mname;
    private String mpwd;
    public Manager(){

    }
    public Manager(String mname, String mpwd) {
        this.mname = mname;
        this.mpwd = mpwd;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public String getMpwd() {
        return mpwd;
    }

    public void setMpwd(String mpwd) {
        this.mpwd = mpwd;
    }
}
