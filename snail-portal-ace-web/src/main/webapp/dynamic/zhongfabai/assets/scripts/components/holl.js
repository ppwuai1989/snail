cc.Class({
    extends: cc.Component,

    properties: {
        store: cc.Button,
        my_store: cc.Node,
        my_store_ani: cc.Animation, // 动画
        store_left: [cc.Node],
        shop_right: [cc.Node],
        house: cc.Node,
        fenxiang: cc.Node
    },

    onLoad() {
        this.store.node.on(cc.Node.EventType.TOUCH_END, this.touchEnd, this);
        this.store.node.on(cc.Node.EventType.TOUCH_CANCEL, this.touchCancel, this);
        // console.log(this.my_store_ani)

    },
    //holl--一级点击监听

    //二级关闭监听
    touchStarts: function (event) {
        console.log(event.target.name)
        if (event.target.name == "New Layout") {
            this.my_store.active = false
            this.store_left[0].opacity = 255
            this.store_left[1].opacity = 0
            this.store_left[2].opacity = 0
            this.shop_right[0].active = true
            this.shop_right[1].active = false
            this.shop_right[2].active = false
            this.fenxiang.active = false
            this.node.getChildByName("fasong").active = false
            this.node.getChildByName("meiri").active = false
            this.node.getChildByName("daili").active = false
        }
    },
    //暂时
    // usertouchStart: function (event) {
    //     console.log(event.target.name)
    // },
    //金币 房卡 积分的点击事件
    storeStart: function (event) {
        console.log(event.target.name)
        for (var j = 0; j < this.shop_right.length; j++) {
            for (var i = 0; i < this.store_left.length; i++) {
                if (event.target.name == this.store_left[i].name) {
                    this.store_left[i].opacity = 255
                    this.my_store.active = true
                    if (event.target.name == this.shop_right[j].name) {

                        this.shop_right[j].active = true
                    } else {
                        this.shop_right[j].active = false
                    }
                    if (event.target.name == "New Layout") {

                    }
                } else {
                    this.store_left[i].opacity = 0
                }
            }
        }
    },
    //3种充值单独拿出来================================重要
    my_chong_Start: function (event) {
        console.log(event.target.name)
    },

    touchEnd: function (event) {
        // console.log("区域内")
    },
    touchCancel: function (event) {
        // console.log("区域外")
    },
    start() {

    },

    // update (dt) {},
});
