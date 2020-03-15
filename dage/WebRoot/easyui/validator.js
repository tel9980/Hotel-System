$.extend($.fn.validatebox.defaults.rules,{
            NotEmpty : { // 非空字符串验证。 easyui 原装required 不能验证空格
                validator : function(value, param) {
                    return $.trim(value).length>0;
                },
                message : '该输入项为必输项'
            },
            PhoneOrMobile : {//非空电话号码 匹配 移动与固定电话号码
                validator : function(value, param) {
                    return /^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$|(^(13[0-9]|15[0|3|6|7|8|9]|18[8|9])\d{8}$)/.test(value);
                },
                message : '格式不正确,请输入正确的电话格式。'
            },
            minLength : { // 判断最小长度
                validator : function(value, param) {
                    return value.length >= param[0];
                },
                message : '最少输入 {0} 个字符。'
            },
            length : {
                validator : function(value, param) {
                    var len = $.trim(value).length;
                    return len >= param[0] && len <= param[1];
                },
                message : "输入内容长度必须介于{0}和{1}之间."
            },
            phone : {// 验证电话号码
                validator : function(value) {
                    return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i
                            .test(value);
                },
                message : '格式不正确,请使用下面格式:020-88888888'
            },
            mobile : {// 验证手机号码
                validator : function(value) {
                    return /^(13|15|18|17)\d{9}$/i.test(value);
                },
                message : '手机号码格式不正确'
            },
            idcard : {// 验证身份证
                validator : function(value) {
                    return /^\d{6}(19|20)\d{2}(0[1-9]|1[0-2])(0[1-9]|[1-2]\d|3[0-1])\d{3}(\d|X)$/i.test(value);
                },
                message : '身份证号码格式不正确'
            },
            intOrFloat : {// 验证整数或小数
                validator : function(value) {
                    return /^\d+(\.\d+)?$/i.test(value);
                },
                message : '请输入数字，并确保格式正确'
            },
            currency : {// 验证货币
                validator : function(value) {
                    return /^\d+(\.\d+)?$/i.test(value);
                },
                message : '货币格式不正确'
            },
            qq : {// 验证QQ,从10000开始
                validator : function(value) {
                    return /^[1-9]\d{4,9}$/i.test(value);
                },
                message : 'QQ号码格式不正确'
            },
            integer : {// 验证整数
                validator : function(value) {
                    return /^[+]?[0-9]+\d*$/i.test(value);
                },
                message : '请输入整数'
            },
            chinese : {// 验证中文
                validator : function(value) {
                    return /^[\u0391-\uFFE5]+$/i.test(value);
                },
                message : '请输入中文'
            },
            english : {// 验证英语
                validator : function(value) {
                    return /^[A-Za-z]+$/i.test(value);
                },
                message : '请输入英文'
            },
            unnormal : {// 验证是否包含空格和非法字符
                validator : function(value) {
                    return /.+/i.test(value);
                },
                message : '输入值不能为空和包含其他非法字符'
            },
            username : {// 验证用户名
                validator : function(value) {
                    return /^[a-zA-Z][a-zA-Z0-9_]{5,15}$/i.test(value);
                },
                message : '用户名不合法（字母开头，允许6-16字节，允许字母数字下划线）'
            },
            faxno : {// 验证传真
                validator : function(value) {
                    // return /^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[
                    // ]){1,12})+$/i.test(value);
                    return /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/i
                            .test(value);
                },
                message : '传真号码不正确'
            },
            zip : {// 验证邮政编码
                validator : function(value) {
                    return /^[1-9]\d{5}$/i.test(value);
                },
                message : '邮政编码格式不正确'
            },
            ip : {// 验证IP地址
                validator : function(value) {
                    return /^((\d|\d\d|[0-1]\d\d|2[0-4]\d|25[0-5])\.(\d|\d\d|[0-1]\d\d|2[0-4]\d|25[0-5])\.(\d|\d\d|[0-1]\d\d|2[0-4]\d|25[0-5])\.(\d|\d\d|[0-1]\d\d|2[0-4]\d|25[0-5]))$/i.test(value);
                },
                message : 'IP地址格式不正确'
            },
            name : {// 验证姓名，可以是中文或英文
                validator : function(value) {
                    return /^[\u0391-\uFFE5]+$/i.test(value)
                            | /^\w+[\w\s]+\w+$/i.test(value);
                },
                message : '请输入姓名'
            },
            carNo : {
                validator : function(value) {
                    return /^[\u4E00-\u9FA5][\da-zA-Z]{6}$/.test(value);
                },
                message : '车牌号码无效（例：粤J12350）'
            },
            carenergin : {
                validator : function(value) {
                    return /^[a-zA-Z0-9]{16}$/.test(value);
                },
                message : '发动机型号无效(例：FG6H012345654584)'
            },
            email : {
                validator : function(value) {
                    return /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/
                            .test(value);
                },
                message : '请输入有效的电子邮件账号(例：abc@126.com)'
            },
            msn : {
                validator : function(value) {
                    return /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/
                            .test(value);
                },
                message : '请输入有效的msn账号(例：abc@hotnail(msn/live).com)'
            },
            same : {
                validator : function(value, param) {
                    if ($("#" + param[0]).val() != "" && value != "") {
                        return $("#" + param[0]).val() == value;
                    } else {
                        return true;
                    }
                },
                message : '两次输入的密码不一致！'
            },
            ipv6 : {//验证ipv6
                validator : function(value){
                    return /^\s*((([0-9A-Fa-f]{1,4}:){7}([0-9A-Fa-f]{1,4}|:))|(([0-9A-Fa-f]{1,4}:){6}(:[0-9A-Fa-f]{1,4}|((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3})|:))|(([0-9A-Fa-f]{1,4}:){5}(((:[0-9A-Fa-f]{1,4}){1,2})|:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3})|:))|(([0-9A-Fa-f]{1,4}:){4}(((:[0-9A-Fa-f]{1,4}){1,3})|((:[0-9A-Fa-f]{1,4})?:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){3}(((:[0-9A-Fa-f]{1,4}){1,4})|((:[0-9A-Fa-f]{1,4}){0,2}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){2}(((:[0-9A-Fa-f]{1,4}){1,5})|((:[0-9A-Fa-f]{1,4}){0,3}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){1}(((:[0-9A-Fa-f]{1,4}){1,6})|((:[0-9A-Fa-f]{1,4}){0,4}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(:(((:[0-9A-Fa-f]{1,4}){1,7})|((:[0-9A-Fa-f]{1,4}){0,5}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:)))(%.+)?\s*$/.test(value);
                },
                message:'请输入正确的ipv6地址!'
            },
            date : {
                validator : function(value){
                    return /^([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8])))$/.test(value);
                },
                message:'请输入正确的日期格式：YYYY-MM-DD'
            },
            datetimes : {
                validator : function(value){
                    return /^([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8])))(\s){1}?([0-1]{1}\d{1}|[2]{1}[0-4]{1})(?::)?([0-5]{1}\d{1})$/.test(value);
                },
                message:'请输入正确的日期格式：YYYY-MM-DD HH:MM'
            },
            datetime : {
                validator : function(value){
                    return /^([0-9]{3}[1-9]|[0-9]{2}[1-9][0-9]{1}|[0-9]{1}[1-9][0-9]{2}|[1-9][0-9]{3})-(((0[13578]|1[02])-(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)-(0[1-9]|[12][0-9]|30))|(02-(0[1-9]|[1][0-9]|2[0-8])))(\s){1}?([0-1]{1}\d{1}|[2]{1}[0-4]{1})(?::)?([0-5]{1}\d{1})(?::)?([0-5]{1}\d{1})$/.test(value);
                },
                message:'请输入正确的日期格式：YYYY-MM-DD HH:MM:SS'
            },
            workNoAjax:{//验证员工管理界面，工号是否重复
                validator:function(value){
                    var a=true;
                    var doctorId=$('#doctor_id').val();
                    $.ajax({
                        type:"post",
                        async:false,
                        url:_basePath+'/base/bas/queryDoctorWorkNo.html',
                        data:"workno="+value+"&doctor_id="+doctorId,
                        dataType:"text",
                        success:function(data){
                            if(data=="true"){
                                a=false;
                            }
                        }
                    });
                    return a;
                },
                message:'该工号已经存在'
            }
        });