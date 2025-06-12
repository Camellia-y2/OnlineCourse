package org.example.pojo;

public class StudentStatistics {
    private String sno;          // 学号 (主键)
    private String sname;        // 姓名 (不为空)
    private double totalCredits;    // 已获学分数
    private int passedCourses;    // 通过课程门数
    private int failedCourses;    // 不及格门数
    private double averageScore;  // 各科平均成绩


    public StudentStatistics(String sno, String sname, double totalCredits, int passedCourses, int failedCourses, double averageScore) {
        this.sno = sno;
        this.sname = sname;
        this.totalCredits = totalCredits;
        this.passedCourses = passedCourses;
        this.failedCourses = failedCourses;
        this.averageScore = averageScore;
    }

    public StudentStatistics() {

    }

    // Getter 和 Setter 方法
    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public double getTotalCredits() {
        return totalCredits;
    }

    public void setTotalCredits(double totalCredits) {
        this.totalCredits = totalCredits;
    }

    public int getPassedCourses() {
        return passedCourses;
    }

    public void setPassedCourses(int passedCourses) {
        this.passedCourses = passedCourses;
    }

    public int getFailedCourses() {
        return failedCourses;
    }

    public void setFailedCourses(int failedCourses) {
        this.failedCourses = failedCourses;
    }

    public double getAverageScore() {
        return averageScore;
    }

    public void setAverageScore(double averageScore) {
        this.averageScore = averageScore;
    }

    // 更新统计信息的方法
    public void updateStatistics(int score, int credits) {
        this.totalCredits += credits;
        if (score >= 60) { // 假设60分为及格线
            this.passedCourses++;
        } else {
            this.failedCourses++;
        }
        // 更新平均成绩
        if (this.passedCourses + this.failedCourses > 0) {
            this.averageScore = (this.averageScore * (this.passedCourses + this.failedCourses - 1) + score) / (this.passedCourses + this.failedCourses);
        } else {
            this.averageScore = score; // 第一次成绩
        }
    }
}