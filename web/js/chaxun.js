function getE(id) {
    return document.getElementById(id);
}

getE("check0").addEventListener("click", myFunction);

// getE("clear").addEventListener("click",myClear);
function myFunction() {
    var arr = document.getElementsByName("chec");
    if (getE("check0").checked == true) {
        for (i in arr) {
            arr[i].checked = true;
        }
    }
    else {
        for (j in arr) {
            arr[j].checked = false;
        }
    }
}


$(document).ready(function () {
    var rowNum = 0;
    $(".move").mouseenter(function () {
        $(".show2").fadeIn(1000);
        $("#up1").show();
        $("#dowm1").hide();

    });
    $("nav").mouseleave(function () {
        $(".show2").fadeOut(1000);
        $("#up1").hide();
        $("#dowm1").show();
    });
    $("#chaxun").click(function () {
        var bnsId = $("#id1").val();
        var bnsName = $("#name1").val();
        var bnsTel = $("#tele").val();
        var bnsGroup = $("input[name='rel']:checked").val();
        var bnsArea = $("#area").val();
        var bnsAddr = $("#addr").val();
        var bnsMoneyFrom = $("#moneyFrom").val();
        var bnsMoneyTo = $("#moneyTo").val();
        var str = $("#rowNum").val();
        $("#nowPage").text(1);
        rowNum = $("#rowNum").val();
        $.post("/SSM/SelectBns", {
            'businessModel.bnsId': bnsId,
            'businessModel.bnsName': bnsName,
            'businessModel.bnsTel': bnsTel,
            'businessModel.bnsGroup': bnsGroup,
            'businessModel.bnsArea': bnsArea,
            'businessModel.bnsAddr': bnsAddr,
            'businessModel.bnsMoneyFrom': bnsMoneyFrom,
            'businessModel.bnsMoneyTo': bnsMoneyTo,
            num: 1,
            'businessModel.rowNum': rowNum
        }, function (data) {
            $("tbody").html("");
            $("#information").html(data.businessList.length); //显示一共查出几条数据
            $("#pages").text(Math.ceil(data.businessList.length / rowNum)); //显示一共查出几页
            if (data.businessList != null && data.businessList.length != 0) {

                for (i = 0; i < rowNum; i++) {
                    $("tbody").html($("tbody").html() + "<tr >" +
                        "<td class=\"t-1\">" +
                        "<input class=\"check1\" type=\"checkbox\" name=\"chec\">" +
                        "</td>" +
                        "<td >" + data.businessList[i].bnsId + "</td>" +
                        "<td >" + data.businessList[i].bnsName + "</td>" +
                        "<td >" + data.businessList[i].bnsTel + "</td>" +
                        "<td >" + data.businessList[i].bnsGroup + "</td>" +
                        "<td >" + data.businessList[i].bnsArea + "</td>" +
                        "<td >" + data.businessList[i].bnsAddr + "</td>" +
                        "<td >" + data.businessList[i].bnsMoney + "</td>" +
                        "<td >" +
                        "<a href='tianjia.jsp?id=" + data.businessList[i].bnsId + "'><input type=\"button\" value=\"修改\"></a>" +
                        "</td>" +
                        "</tr>")
                }

            } else {
                $("#pages").text(1);
            }
        }, "json")
    });

    $("#clear2").click(function () {
        var arr = [];
        var checked = false;
        var clearAll = getE("myTable");//通过id获取到table节点
        var clear1 = document.getElementsByName("chec");//获取到所有复选框id名为checkName
        var num = 0;
        for (var i = 0; i < clear1.length; i++) { //循环数组
            if (clear1[i].checked) { //如果复选框被选中
                checked = true;
                num++;
            }
        }
        if (checked) { // 如果checked等于true
            if (confirm("您确定要删除" + num + "条数据吗?")) { // confirm()方法会弹出一个会话框 如果点击确定按钮就会返回true

                var n = 0;
                for (var j = clear1.length - 1; j >= 0; j--) {
                    if (clear1[j].checked) {
                        arr[n++] = clearAll.rows[j + 1].cells[1].innerHTML;//取到对应的商家id
                        clearAll.deleteRow(j + 1);// 删除所选的项
                    }
                }
                $("#information").text($("#information").text() - n);//显示一共查出几条数据
                $("#pages").text(Math.ceil($("#information").text() / rowNum));

            }
        }

        for (i in arr) {

            $.ajaxSettings.async = false;
            $.post("/SSM/DeleteBns", {
                bnsId: arr[i]
            }, function (data) {
                var nowPage = parseInt($("#nowPage").text());
                var pages = parseInt($("#pages").text());
                if (nowPage > pages) {
                    nowPage = pages;
                }
                $.post("/SSM/SelectBns", {
                    nowPage: nowPage,
                    pages: pages
                }, function (data) {
                    $("tbody").html("");
                    if (data.businessList != null) {
                        for (i in data.businessList) {
                            $("tbody").html($("tbody").html() + "<tr >" +
                                "<td class=\"t-1\">" +
                                "<input class=\"check1\" type=\"checkbox\" name=\"chec\">" +
                                "</td>" +
                                "<td >" + data.businessList[i].bnsId + "</td>" +
                                "<td >" + data.businessList[i].bnsName + "</td>" +
                                "<td >" + data.businessList[i].bnsTel + "</td>" +
                                "<td >" + data.businessList[i].bnsGroup + "</td>" +
                                "<td >" + data.businessList[i].bnsArea + "</td>" +
                                "<td >" + data.businessList[i].bnsAddr + "</td>" +
                                "<td >" + data.businessList[i].bnsMoney + "</td>" +
                                "<td >" +
                                "<a href='tianjia.jsp?id=" + data.businessList[i].bnsId + "'><input type=\"button\" value=\"修改\"></a>" +
                                "</td>" +
                                "</tr>")
                        }
                    }
                }, "json")
            }, "json")
        }

        if ($("#nowPage").text() > $("#pages").text()) {
            $("#nowPage").text($("#pages").text());
        }
    });

    $("#first").click(function () {
        var nowPage = parseInt($("#nowPage").text());
        if (nowPage > 1) {
            nowPage = 1;
            $("#nowPage").text(nowPage);
            var pages = $("#pages").text();
            $.post("/SSM/SelectBns", {
                nowPage: nowPage,
                pages: pages
            }, function (data) {
                $("tbody").html("");
                if (data.businessList != null) {
                    for (i in data.businessList) {
                        $("tbody").html($("tbody").html() + "<tr >" +
                            "<td class=\"t-1\">" +
                            "<input class=\"check1\" type=\"checkbox\" name=\"chec\">" +
                            "</td>" +
                            "<td >" + data.businessList[i].bnsId + "</td>" +
                            "<td >" + data.businessList[i].bnsName + "</td>" +
                            "<td >" + data.businessList[i].bnsTel + "</td>" +
                            "<td >" + data.businessList[i].bnsGroup + "</td>" +
                            "<td >" + data.businessList[i].bnsArea + "</td>" +
                            "<td >" + data.businessList[i].bnsAddr + "</td>" +
                            "<td >" + data.businessList[i].bnsMoney + "</td>" +
                            "<td >" +
                            "<a href='tianjia.jsp?id=" + data.businessList[i].bnsId + "'><input type=\"button\" value=\"修改\"></a>" +
                            "</td>" +
                            "</tr>")
                    }
                }
            }, "json")
        }
        else {
            alert("当前页已是第一页");
        }
    })

    $("#end").click(function () {
        var pages = $("#pages").text();
        $("#nowPage").text(pages);
        var nowPage = pages;
        $.post("/SSM/SelectBns", {
            nowPage: nowPage,
            pages: pages
        }, function (data) {
            $("tbody").html("");
            if (data.businessList != null) {
                for (i in data.businessList) {
                    $("tbody").html($("tbody").html() + "<tr >" +
                        "<td class=\"t-1\">" +
                        "<input class=\"check1\" type=\"checkbox\" name=\"chec\">" +
                        "</td>" +
                        "<td >" + data.businessList[i].bnsId + "</td>" +
                        "<td >" + data.businessList[i].bnsName + "</td>" +
                        "<td >" + data.businessList[i].bnsTel + "</td>" +
                        "<td >" + data.businessList[i].bnsGroup + "</td>" +
                        "<td >" + data.businessList[i].bnsArea + "</td>" +
                        "<td >" + data.businessList[i].bnsAddr + "</td>" +
                        "<td >" + data.businessList[i].bnsMoney + "</td>" +
                        "<td >" +
                        "<a href='tianjia.jsp?id=" + data.businessList[i].bnsId + "'><input type=\"button\" value=\"修改\"></a>" +
                        "</td>" +
                        "</tr>")
                }
            }
        }, "json")
    });

    $("#previous").click(function () {
        var nowPage = parseInt($("#nowPage").text());
        var pages = parseInt($("#pages").text());
        if (nowPage > 1) {
            nowPage--;
            $("#nowPage").text(nowPage);
            $.post("/SSM/SelectBns", {
                nowPage: nowPage,
                pages: pages
            }, function (data) {
                $("tbody").html("");
                if (data.businessList != null) {
                    for (i in data.businessList) {
                        $("tbody").html($("tbody").html() + "<tr >" +
                            "<td class=\"t-1\">" +
                            "<input class=\"check1\" type=\"checkbox\" name=\"chec\">" +
                            "</td>" +
                            "<td >" + data.businessList[i].bnsId + "</td>" +
                            "<td >" + data.businessList[i].bnsName + "</td>" +
                            "<td >" + data.businessList[i].bnsTel + "</td>" +
                            "<td >" + data.businessList[i].bnsGroup + "</td>" +
                            "<td >" + data.businessList[i].bnsArea + "</td>" +
                            "<td >" + data.businessList[i].bnsAddr + "</td>" +
                            "<td >" + data.businessList[i].bnsMoney + "</td>" +
                            "<td >" +
                            "<a href='tianjia.jsp?id=" + data.businessList[i].bnsId + "'><input type=\"button\" value=\"修改\"></a>" +
                            "</td>" +
                            "</tr>")
                    }
                }
            }, "json")
        }
        else {
            alert("当前页已是第一页");
        }
    })

    $("#next").click(function () {
        var nowPage = parseInt($("#nowPage").text());
        var pages = parseInt($("#pages").text());
        $("#check0").prop("checked", "");
        if (nowPage < pages) {
            nowPage += 1;
            $("#nowPage").text(nowPage);
            $.post("/SSM/SelectBns", {
                nowPage: nowPage,
                pages: pages
            }, function (data) {
                $("tbody").html("");
                if (data.businessList != null) {
                    for (i in data.businessList) {
                        $("tbody").html($("tbody").html() + "<tr >" +
                            "<td class=\"t-1\">" +
                            "<input class=\"check1\" type=\"checkbox\" name=\"chec\">" +
                            "</td>" +
                            "<td >" + data.businessList[i].bnsId + "</td>" +
                            "<td >" + data.businessList[i].bnsName + "</td>" +
                            "<td >" + data.businessList[i].bnsTel + "</td>" +
                            "<td >" + data.businessList[i].bnsGroup + "</td>" +
                            "<td >" + data.businessList[i].bnsArea + "</td>" +
                            "<td >" + data.businessList[i].bnsAddr + "</td>" +
                            "<td >" + data.businessList[i].bnsMoney + "</td>" +
                            "<td >" +
                            "<a href='tianjia.jsp?id=" + data.businessList[i].bnsId + "'><input type=\"button\" value=\"修改\"></a>" +
                            "</td>" +
                            "</tr>")
                    }
                }
            }, "json")

        }
        else {
            alert("当前页已经是最后一页了");
        }


    })

    $("#jump").click(function () {
        var nowPage = parseInt($("#num").val());
        var pages = parseInt($("#pages").text());
        if (nowPage <= pages && nowPage > 0) {
            $("#nowPage").text(nowPage);
            $.post("/SSM/SelectBns", {
                nowPage: nowPage,
                pages: pages
            }, function (data) {
                $("tbody").html("");
                if (data.businessList != null) {
                    for (i in data.businessList) {
                        $("tbody").html($("tbody").html() + "<tr >" +
                            "<td class=\"t-1\">" +
                            "<input class=\"check1\" type=\"checkbox\" name=\"chec\">" +
                            "</td>" +
                            "<td >" + data.businessList[i].bnsId + "</td>" +
                            "<td >" + data.businessList[i].bnsName + "</td>" +
                            "<td >" + data.businessList[i].bnsTel + "</td>" +
                            "<td >" + data.businessList[i].bnsGroup + "</td>" +
                            "<td >" + data.businessList[i].bnsArea + "</td>" +
                            "<td >" + data.businessList[i].bnsAddr + "</td>" +
                            "<td >" + data.businessList[i].bnsMoney + "</td>" +
                            "<td >" +
                            "<a href='tianjia.jsp?id=" + data.businessList[i].bnsId + "'><input type=\"button\" value=\"修改\"></a>" +
                            "</td>" +
                            "</tr>")
                    }
                }
            }, "json")

        }
        else {
            alert("输入的数不在查询范围");
        }


    })

    $("#moneyFrom").keyup(function () {
        var patt = /(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9]([0-9])?$)/;
        var patt2 = /[^\d]/g;
        var moneyFrom = $("#moneyFrom").val();
        var arr = moneyFrom.split("\.");
        if (patt2.test(arr[0])) {
            $("#moneyFrom").val("");
        }
        if (arr[1] != null && arr[1] != "") {
            if (!patt.test($("#moneyFrom").val())) {
                $("#moneyFrom").val("");
            }
        }
    })

    $("#moneyTo").keyup(function () {
        var patt = /(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9]([0-9])?$)/;
        var patt2 = /[^\d]/g;
        var moneyFrom = $("#moneyTo").val();
        var arr = moneyFrom.split("\.");
        if (patt2.test(arr[0])) {
            $("#moneyTo").val("");
        }
        if (arr[1] != null && arr[1] != "") {
            if (!patt.test($("#moneyTo").val())) {
                $("#moneyTo").val("");
            }
        }
    })

    $("#out").click(function () {
        if (confirm("您确定要退出登录吗?")) {
            $.post("/SSM/Out", {}, function (data) {
                window.location.href = "/SSM/jsp/shouye.jsp";
            })
        }
    })


});









