cc.Class({
    extends: cc.Component,

    properties: {
        tops: cc.Node,
        Fenxiang: cc.Node,
        home: cc.Node,
        wanren: cc.Node,
        down: cc.Node,
        my_store: cc.Node,
        house: cc.Node,
        my_store_ani: cc.Animation, // 动画
        xiaoshiAn: [cc.Animation],
        store_down: cc.Animation,
        secret: cc.Node,
        fengxiang: cc.Node,

    },

    onLoad() {
        for (var key in this.Fenxiang._children) {
            if (this.Fenxiang._children[key].getComponent(cc.Animation).play("gg1")) {
                console.log("ok")
            }
        }
        // ==============================分割线===============================
        console.log(cc.sx.userMgr)
        console.log(this.node.getChildByName("daili"))
        
        // console.log(this.node._children[2]._children.getComponent(cc.Animation))

    },
    touchStart: function (event) {
        console.log("点击了")
        console.log(event.target.name)
        //holl的事件
        if (event.target.name == "New Layout") {
            this.my_store.active = false
        } else if (event.target.name == "store") {
            this.my_store.active = true
            this.house.active = false
            this.my_store_ani.play()
            this.play_leave()
        } else if (event.target.name == "home") {
            this.house.active = true
            this.store_down.play()
            this.play_in()
            //创建房间
            console.log(cc.sx.http)
        } else if (event.target.name == "fenxiang") {
            this.fengxiang.active = true
        } else if (event.target.name == "shezhi") {
            this.node.children[11].active = true
            this.play_in()
        } else if (event.target.name == "fasong") {
            this.node.getChildByName("fasong").active = true
        } else if (event.target.name == "meiri") {
            this.node.getChildByName("meiri").active = true
        } else if (event.target.name == "diali") {
            this.node.getChildByName("daili").active = true
        }
        // else if(event.target.name == "user_gold" || event.target.name == "user_fangka" || event.target.name == "user_jifen"){
        //     this.my_store.active = true
        // }
    },
    play_leave: function () {
        for (var i = 0; i < this.xiaoshiAn.length; i++) {
            this.xiaoshiAn[0].getComponent(cc.Animation).play("tops_in")
            this.xiaoshiAn[1].getComponent(cc.Animation).play("fenxiang_in")
            this.xiaoshiAn[2].getComponent(cc.Animation).play("home_in")
            this.xiaoshiAn[3].getComponent(cc.Animation).play("wanren_in")
            this.xiaoshiAn[4].getComponent(cc.Animation).play("down_in")
        }
    },
    play_in: function () {
        for (var i = 0; i < this.xiaoshiAn.length; i++) {
            this.xiaoshiAn[i].play()
        }
    },
    start() {

    },

    update(dt) { },
});
