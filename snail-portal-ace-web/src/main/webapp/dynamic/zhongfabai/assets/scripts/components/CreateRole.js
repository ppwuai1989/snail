cc.Class({
    extends: cc.Component,

    properties: {
        inputName:cc.EditBox,
        // foo: {
        //    default: null,
        //    url: cc.Texture2D,  // optional, default is typeof default
        //    serializable: true, // optional, default is true
        //    visible: true,      // optional, default is true
        //    displayName: 'Foo', // optional
        //    readonly: false,    // optional, default is false
        // },
        // ...
    },
    
    onRandomBtnClicked:function(){
        var names = [
            "上官",
            "欧阳",
            "东方",
            "端木",
            "独孤",
            "司马",
            "南宫",
            "夏侯",
            "诸葛",
            "皇甫",
            "长孙",
            "缱绻",
            "轩辕",
            "东郭",
            "子车",
            "东阳",
            "纳兰",
        ];
        
        var names2 = [
            "若白",
            "林羽",
            "霜寒",
            "白雪",
            "听宫",
            "明浩",
            "天一",
            "洺烟",
            "汐洛",
        ];
        var idx = Math.floor(Math.random() * (names.length - 1));
        var idx2 = Math.floor(Math.random() * (names2.length - 1));
        this.inputName.string = names[idx] + names2[idx2];
    },

    // use this for initialization
    onLoad: function () {
        if(!cc.sys.isNative && cc.sys.isMobile){
            var cvs = this.node.getComponent(cc.Canvas);
            cvs.fitHeight = true;
            cvs.fitWidth = true;
        }
        this.onRandomBtnClicked();
    },

    onBtnConfirmClicked:function(){
        var name = this.inputName.string;
        if(name == ""){
            console.log("invalid name.");
            return;
        }
        console.log(name);
        cc.sx.userMgr.create(name);
    }
    // called every frame, uncomment this function to activate update callback
    // update: function (dt) {

    // },
});
