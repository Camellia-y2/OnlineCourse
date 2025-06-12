package org.example.pojo;

public class Course {
    private String cno; // 课程编号
    private String cname; // 课程名
    private double credit; // 学分
    private int ttime; // 理论学时
    private int ptime; // 实践学时
    private String exam; // 考核方式

    // 构造函数
    public Course() {}

    public Course(String cno, String cname, double credit, int ttime, int ptime, String exam) {
        this.cno = cno;
        this.cname = cname;
        this.credit = credit;
        this.ttime = ttime;
        this.ptime = ptime;
        this.exam = exam;
    }

    public String getCno() {
        return cno;
    }

    public void setCno(String cno) {
        this.cno = cno;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public double getCredit() {
        return credit;
    }

    public void setCredit(double credit) {
        this.credit = credit;
    }

    public int getTtime() {
        return ttime;
    }

    public void setTtime(int ttime) {
        this.ttime = ttime;
    }

    public int getPtime() {
        return ptime;
    }

    public void setPtime(int ptime) {
        this.ptime = ptime;
    }

    public String getExam() {
        return exam;
    }

    public void setExam(String exam) {
        this.exam = exam;
    }

    @Override
    public String toString() {
        return "Course{" +
                "cno='" + cno + '\'' +
                ", cname='" + cname + '\'' +
                ", credit=" + credit +
                ", ttime=" + ttime +
                ", ptime=" + ptime +
                ", exam='" + exam + '\'' +
                '}';
    }
}
