package cn.com.zhirun.SSM.model;

public class Pages {

    private Integer pages;

    private Integer nowPage;

    /**是否需要分页并判断是否点击查询按钮*/
    private Integer num;

    /**分页起始值*/
    private Integer start;

    private BusinessModel businessModel;

    public Integer getPages() {
        return pages;
    }

    public void setPages(Integer pages) {
        this.pages = pages;
    }

    public Integer getNowPage() {
        return nowPage;
    }

    public void setNowPage(Integer nowPage) {
        this.nowPage = nowPage;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public BusinessModel getBusinessModel() {
        return businessModel;
    }

    public void setBusinessModel(BusinessModel businessModel) {
        this.businessModel = businessModel;
    }
}
