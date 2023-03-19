package io.renren.modules.mini.form;

import lombok.Data;

@Data
public class ClassForm {
    private Integer id;
    private String className;//班级名称
    private String teacherName;//老师名字
    private Integer presetNumber;//预设人数
    private String grade;//学段
    private String phone;
}
